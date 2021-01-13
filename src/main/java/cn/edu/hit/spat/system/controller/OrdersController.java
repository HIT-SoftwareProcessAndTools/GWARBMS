package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.Orders;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.service.ICustomerService;
import cn.edu.hit.spat.system.service.IOrdersService;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
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
    private final ICustomerService customerService;
    private final IStorageService storageService;

    @GetMapping("{customername}")
    public Orders getOrders(@NotBlank(message = "{required}") @PathVariable String customername) {
        return this.ordersService.findOrdersDetailList(customername);
    }

    @GetMapping("{ordersId}")
    public Orders getOrders(@NotBlank(message = "{required}") @PathVariable Long ordersId) {
        return this.ordersService.findOrdersDetailList(ordersId);
    }

    @GetMapping("list")
    @RequiresPermissions("orders:view")
    public GwarbmsResponse ordersList(Orders orders, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.ordersService.findOrdersDetailList(orders, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @GetMapping("getDesStorage/{storehouse}")
    public List<Storage> DesStorageList(@PathVariable String storehouse) {
        return this.storageService.findAllStorage(storehouse);
    }

    @PostMapping("update")
    @RequiresPermissions("orders:update")
    @ControllerEndpoint(operation = "修改销售单", exceptionMessage = "修改销售单失败")
    public GwarbmsResponse updateOrders(@Valid Orders orders) {
        this.ordersService.updateOrders(orders);
        return new GwarbmsResponse().success();
    }

    @GetMapping("create/{customerId}")
    @RequiresPermissions("customer:create")
    @ControllerEndpoint(operation = "新增订单", exceptionMessage = "新增订单失败")
    public GwarbmsResponse createOrders(@NotBlank(message = "{required}") @PathVariable String customerId , Model model) {
        System.out.println(customerId);
        Orders orders=new Orders();
        Customer customer=customerService.findByCustomerId(Long.valueOf(customerId));
        orders.setCustomerName(customer.getName());
        orders.setCustomerPhone(customer.getPhone().toString());
        this.ordersService.createOrders(orders);
        return new GwarbmsResponse().success();
    }

    @GetMapping("payone/{ordersId}")
    @RequiresPermissions("orders:payone")
    @ControllerEndpoint(operation = "分期付款", exceptionMessage = "本期收款失败")
    public GwarbmsResponse payoneOrders(@NotBlank(message = "{required}") @PathVariable String ordersId) {
        this.ordersService.payoneOrders(ordersId);
        return new GwarbmsResponse().success();
    }

    @GetMapping("paywithCount/{ordersId}")
    @RequiresPermissions("orders:payone")
    @ControllerEndpoint(operation = "分期付款", exceptionMessage = "本期收款失败")
    public GwarbmsResponse paywithCount(@NotBlank(message = "{required}") @PathVariable String ordersId) {
        this.ordersService.paywithCount(ordersId);
        return new GwarbmsResponse().success();
    }

    @GetMapping("submit/{ordersIds}")
    @RequiresPermissions("orders:submit")
    @ControllerEndpoint(operation = "提交订单", exceptionMessage = "提交订单失败")
    public GwarbmsResponse archiveOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.submitOrders(ids);
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

    @GetMapping("pay/{ordersIds}")
    @RequiresPermissions("orders:pay")
    @ControllerEndpoint(operation = "收款完毕", exceptionMessage = "收款失败")
    public GwarbmsResponse payOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.payOrders(ids);
        return new GwarbmsResponse().success();
    }

    @GetMapping("return/{ordersIds}")
    @RequiresPermissions("orders:return")
    @ControllerEndpoint(operation = "订单退货", exceptionMessage = "退货失败")
    public GwarbmsResponse returnOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.returnOrders(ids);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{ordersIds}")
    @RequiresPermissions("orders:delete")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String ordersIds) {
        String[] ids = ordersIds.split(StringPool.COMMA);
        this.ordersService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }
}
