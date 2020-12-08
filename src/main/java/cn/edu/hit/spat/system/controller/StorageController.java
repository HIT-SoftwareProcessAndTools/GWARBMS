package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.service.IRecordService;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
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
 * created by meizhimin on 2020/12/2
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("storage")
public class StorageController extends BaseController {

    private final IStorageService storageService;
    private final IRecordService recordService;

    @GetMapping("{storageId}")
    public Storage getStorage(@NotBlank(message = "{required}") @PathVariable Long storageId) {

        return this.storageService.findByStorageId(storageId);
    }

    @GetMapping("list")
    @RequiresPermissions("storage:view")
    public GwarbmsResponse storageList(Storage storage, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.storageService.findStorageDetailList(storage, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("storage:create")
    @ControllerEndpoint(operation = "新增仓库", exceptionMessage = "新增仓库失败")
    public GwarbmsResponse createStorage(@Valid Storage storage) {
        // 查询仓库名是否已经存在
        List<Storage> storages = storageService.findStorageList(storage);
        if(CollectionUtils.isNotEmpty(storages)){
            throw new GwarbmsException("该仓库名已经存在，请重新输入！");
        }
        this.storageService.createStorage(storage);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("storage:update")
    @ControllerEndpoint(operation = "修改仓库", exceptionMessage = "修改仓库失败")
    public GwarbmsResponse updateStorage(@Valid Storage storage) {
        if (storage.getStorageId() == null) {
            throw new GwarbmsException("仓库ID为空");
        }
        Storage tar = new Storage();
        tar.setStorageName(storage.getStorageName());
        // 查询仓库名是否已经存在
        List<Storage> storages = storageService.findStorageList(tar);
        if(CollectionUtils.isNotEmpty(storages)){
            throw new GwarbmsException("该仓库名已经存在，请重新输入！");
        }
        // 更新仓库名字
        this.storageService.updateStorage(storage);
        // 更新对应的记录
        Record record = new Record();
        record.setStorageId(storage.getStorageId());
        List<Record> recordList = this.recordService.findRecordList(record);
        for(Record x : recordList){
            x.setStorageName(storage.getStorageName());
            this.recordService.updateRecord(x);
        }
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{storageIds}")
    @RequiresPermissions("storage:delete")
    @ControllerEndpoint(operation = "删除仓库", exceptionMessage = "删除仓库失败")
    public GwarbmsResponse deleteStorages(@PathVariable String storageIds) {
        String[] ids = storageIds.split(StringPool.COMMA);
        // 依次查询各个目标仓库是否存有货品
        for(String i:ids){
            Long storageId = Long.parseLong(i);
            Record record = new Record();
            record.setStorageId(storageId);
            List<Record> records = recordService.findRecordList(record);
            for(Record x : records){
                if(x.getNumber()!=0){
                    throw new GwarbmsException("目标仓库仍存有货品，不可删除！");
                }
            }
        }
        // 删除仓库
        this.storageService.deleteStorage(ids);
        // 删除仓库时，也会将所有与该仓库相关的record删除
        this.recordService.deleteRecordByStorageIds(ids);

        return new GwarbmsResponse().success();
    }
}
