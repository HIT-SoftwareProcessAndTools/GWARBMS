package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.entity.StorageTrans;
import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IRecordService;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.IService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * created by meizhimin on 2020/12/3
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("record")
public class RecordController extends BaseController {

    private final IRecordService recordService;
    private final IStorageService storageService;
    private final IGoodsService goodsService;

    @GetMapping("{recordId}")
    public Record getRecord(@NotBlank(message = "{required}") @PathVariable Long recordId) {
        return this.recordService.findByRecordId(recordId);
    }

    @GetMapping("list")
    @RequiresPermissions("record:view")
    public GwarbmsResponse recordList(Record record, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.recordService.findRecordDetailList(record, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @GetMapping("getDesStorage")
    public List<Storage> DesStorageList() {
        return this.storageService.findAllStorage();
    }

    @GetMapping("getAllGoods")
    public List<Goods> GoodsList() {
        Goods goods = new Goods();
        return this.goodsService.findGoods(goods);
    }

    @PostMapping
    @RequiresPermissions("record:create")
    @ControllerEndpoint(operation = "新货品入库", exceptionMessage = "新货品入库失败")
    public GwarbmsResponse createRecord(@Valid Record record) {
        if (record.getNumber()<=0){
            throw new GwarbmsException("入库数量必须>0 ！");
        }
        Storage tarStorage = this.storageService.findByStorageId(record.getStorageId());
        Goods goods = this.goodsService.findByGoodsId(record.getGoodsId());
        if(tarStorage == null){
            throw new GwarbmsException("该仓库ID不存在！");
        }
        if(goods == null){
            throw new GwarbmsException("该货品ID不存在！");
        }
        // 判断此货品是否为新货品
        Record tar = new Record();
        tar.setStorageId(record.getStorageId());
        tar.setGoodsId(record.getGoodsId());
        List<Record> records = this.recordService.findRecordList(tar);
        if(CollectionUtils.isNotEmpty(records)){
            throw new GwarbmsException("该仓库已有该货品的库存！");
        }
        record.setStorageName(tarStorage.getStorageName());
        record.setGoodsName(goods.getName());
        record.setValue(0.0);
        this.recordService.createRecord(record);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("record:update")
    @ControllerEndpoint(operation = "已有货品入库", exceptionMessage = "已有货品入库失败")
    public GwarbmsResponse updateRecord(@Valid Record record) {
        if (record.getNumber()<=0) {
            throw new GwarbmsException("入库数量必须>0 ！");
        }
        if (record.getRecordId() == null) {
            throw new GwarbmsException("记录ID为空");
        }
        Record tarRecord = new Record();
        tarRecord.setRecordId(record.getRecordId());
        List<Record> records = this.recordService.findRecordList(tarRecord);
        // 库存数量加上入库数量
        record.setNumber(records.get(0).getNumber()+record.getNumber());
        this.recordService.updateRecord(record);
        return new GwarbmsResponse().success();
    }

    @PostMapping("out")
    @RequiresPermissions("record:out")
    @ControllerEndpoint(operation = "货品出库", exceptionMessage = "货品出库失败")
    public GwarbmsResponse outRecord(@Valid Record record) {
        if (record.getNumber()<=0) {
            throw new GwarbmsException("出库数量必须>0 ！");
        }
        Record tarRecord = new Record();
        tarRecord.setRecordId(record.getRecordId());
        List<Record> records = this.recordService.findRecordList(tarRecord);
        if (record.getNumber()>records.get(0).getNumber()) {
            throw new GwarbmsException("出库数量不能大于库存数量！");
        }
        if (record.getRecordId() == null) {
            throw new GwarbmsException("记录ID为空");
        }
        // 库存数量减去出库数量
        record.setNumber(records.get(0).getNumber()-record.getNumber());
        this.recordService.outRecord(record);
        // 若完全出库，则删除此条记录
        if(record.getNumber() == 0){
            this.recordService.deleteRecord(record);
        }
        return new GwarbmsResponse().success();
    }

    @PostMapping("trans")
    @RequiresPermissions("record:trans")
    @ControllerEndpoint(operation = "货品转移", exceptionMessage = "货品转移失败")
    public GwarbmsResponse transRecord(@Valid StorageTrans storageTrans) {
        if (storageTrans.getSourceStorageName().equals(storageTrans.getDesStorageName())) {
            throw new GwarbmsException("不能向自己转移！");
        }
        if (storageTrans.getNumber()<=0) {
            throw new GwarbmsException("转移数量必须>0 ！");
        }
        Storage storage = new Storage();
        storage.setStorageName(storageTrans.getDesStorageName());
        List<Storage> storages = this.storageService.findStorageList(storage);
        if(CollectionUtils.isEmpty(storages)){
            throw new GwarbmsException("目的仓库不存在！");
        }
        Record record = new Record();
        record.setGoodsId(storageTrans.getGoodsId());
        record.setStorageName(storageTrans.getSourceStorageName());
        List<Record> records = this.recordService.findRecordList(record);
        if (storageTrans.getNumber()>records.get(0).getNumber()) {
            throw new GwarbmsException("转移数量不能大于库存数量！");
        }
        this.recordService.transRecord(storageTrans,storages.get(0).getStorageId());
        return new GwarbmsResponse().success();
    }
}