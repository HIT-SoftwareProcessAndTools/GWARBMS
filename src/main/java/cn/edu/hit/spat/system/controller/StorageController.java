package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.service.IStorageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
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

    @GetMapping("{storageId}")
    public Storage getStorage(@NotBlank(message = "{required}") @PathVariable Long storageId) {
        return this.storageService.findStorageDetailList(storageId);
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
        this.storageService.updateStorage(storage);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{storageId}")
    @RequiresPermissions("storage:delete")
    @ControllerEndpoint(operation = "删除仓库", exceptionMessage = "删除仓库失败")
    public GwarbmsResponse deleteStorages(@NotBlank(message = "{required}") @PathVariable String storageId) {
        this.storageService.deleteStorage(storageId);
        return new GwarbmsResponse().success();
    }
}
