package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.*;
import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IOrdersService;
import cn.edu.hit.spat.system.service.IRecordService;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.IService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.sql.RowSet;
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
@RequestMapping("statistics")
public class StatisticsController extends BaseController {

    private final IRecordService recordService;
    private final IOrdersService ordersService;
    @GetMapping("{recordId}")
    public Record getRecord(@NotBlank(message = "{required}") @PathVariable Long recordId) {
        return this.recordService.findByRecordId(recordId);
    }

    @GetMapping("inventory")
    @RequiresPermissions("inventory:view")
    public GwarbmsResponse recordList(Record record, QueryRequest request) {
        this.recordService.computerValue();
        Map<String, Object> dataTable = getDataTable(this.recordService.findRecordDetailList(record, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @GetMapping("sale")
    @RequiresPermissions("sale:view")
    public GwarbmsResponse saleList(Orders orders, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.ordersService.findOrdersDetailList(orders, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @GetMapping("pay")
    @RequiresPermissions("pay:view")
    public GwarbmsResponse payList(Orders orders, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.ordersService.findPayOrdersDetailList(orders, request));
        return new GwarbmsResponse().success().data(dataTable);
    }
}