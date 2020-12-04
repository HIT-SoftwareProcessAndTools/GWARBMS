package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.entity.StorageTrans;
import cn.edu.hit.spat.system.service.IRecordService;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
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

    @PostMapping
    @RequiresPermissions("record:create")
    @ControllerEndpoint(operation = "新货品入库", exceptionMessage = "新货品入库失败")
    public GwarbmsResponse createRecord(@Valid Record record) {
        Storage tarStorage = this.storageService.findByStorageId(record.getStorageId());
        record.setStorageName(tarStorage.getStorageName());
        this.recordService.createRecord(record);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("record:update")
    @ControllerEndpoint(operation = "已有货品入库", exceptionMessage = "已有货品入库失败")
    public GwarbmsResponse updateRecord(@Valid Record record) {
        if (record.getRecordId() == null) {
            throw new GwarbmsException("记录ID为空");
        }
        this.recordService.updateRecord(record);
        return new GwarbmsResponse().success();
    }

    @PostMapping("out")
    @RequiresPermissions("record:out")
    @ControllerEndpoint(operation = "货品出库", exceptionMessage = "货品出库失败")
    public GwarbmsResponse outRecord(@Valid Record record) {
        if (record.getRecordId() == null) {
            throw new GwarbmsException("记录ID为空");
        }
        this.recordService.outRecord(record);
        return new GwarbmsResponse().success();
    }

    @PostMapping("trans")
    @RequiresPermissions("record:trans")
    @ControllerEndpoint(operation = "货品转移", exceptionMessage = "货品转移失败")
    public GwarbmsResponse transRecord(@Valid StorageTrans storageTrans) {
        Storage storage = new Storage();
        storage.setStorageName(storageTrans.getDesStorageName());
        List<Storage> storages = storageService.findStorageList(storage);
        if(CollectionUtils.isEmpty(storages)){
            throw new GwarbmsException("目的仓库不存在！");
        }
        this.recordService.transRecord(storageTrans,storages.get(0).getStorageId());
        return new GwarbmsResponse().success();
    }
}