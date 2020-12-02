package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Orders;
import cn.edu.hit.spat.system.service.IOrdersService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * @Author Daijiajia
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("orders")
public class OrdersController extends BaseController {

    private final IOrdersService ordersService;

    @GetMapping("{customername}")
    public Orders getOrders(@NotBlank(message = "{required}") @PathVariable String customername) {
        return this.ordersService.findOrdersDetailList(customername);
    }

    @GetMapping("check/{customername}")
    public boolean checkCustomerName(@NotBlank(message = "{required}") @PathVariable String customername, String ordersId) {
        return this.ordersService.findByName(customername) == null || StringUtils.isNotBlank(ordersId);
    }

    @GetMapping("list")
    @RequiresPermissions("orders:view")
    public GwarbmsResponse ordersList(Orders orders, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.ordersService.findOrdersDetailList(orders, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("orders:create")
    @ControllerEndpoint(operation = "新增订单", exceptionMessage = "新增订单失败")
    public GwarbmsResponse createOrders(@Valid Orders orders) {
        this.ordersService.createOrders(orders);
        return new GwarbmsResponse().success();
    }

    @GetMapping("archive/{ordersIds}")
    @RequiresPermissions("orders:archive")
    @ControllerEndpoint(operation = "提交订单", exceptionMessage = "提交订单失败")
    public GwarbmsResponse archiveOrders(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] ids = orderIds.split(StringPool.COMMA);
        this.ordersService.archiveOrders(ids);
        return new GwarbmsResponse().success();
    }

    @GetMapping("audit/{ordersIds}")
    @RequiresPermissions("orders:audit")
    @ControllerEndpoint(operation = "审核订单", exceptionMessage = "审核订单失败")
    public GwarbmsResponse auditOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.auditOrders(ids);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{ordersIds}")
    @RequiresPermissions("orders:delete")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除订单失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }

//    @GetMapping("archive/{ordersIds}")
//    @RequiresPermissions("orders:archive")
//    @ControllerEndpoint(operation = "归档订单", exceptionMessage = "归档订单失败")
//    public GwarbmsResponse finishOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
//        String[] ids = ordersIds.split(StringPool.COMMA);
//        this.ordersService.archiveOrders(ids);
//        return new GwarbmsResponse().success();
//    }
}
