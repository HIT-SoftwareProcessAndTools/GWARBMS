package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Order;
import cn.edu.hit.spat.system.service.IOrderService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * @author MrBird
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("order")
public class OrderController extends BaseController {

    private final IOrderService orderService;

    @GetMapping("{customername}")
    public Order getUser(@NotBlank(message = "{required}") @PathVariable String customername) {
        return this.orderService.findOrderDetailList(customername);
    }


    @GetMapping("list")
    @RequiresPermissions("user:view")
    public GwarbmsResponse orderList(Order order, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.orderService.findOrderDetailList(order, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("user:add")
    @ControllerEndpoint(operation = "新增订单", exceptionMessage = "新增订单失败")
    public GwarbmsResponse addUser(@Valid Order order) {
        this.orderService.createOrder(order);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{userIds}")
    @RequiresPermissions("user:delete")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除订单失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] ids = orderIds.split(StringPool.COMMA);
        this.orderService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("user:update")
    @ControllerEndpoint(operation = "修改订单", exceptionMessage = "修改订单失败")
    public GwarbmsResponse updateOrder(@Valid Order order) {
        if (order.getOrderId() == null) {
            throw new GwarbmsException("订单ID为空");
        }
        this.orderService.updateOrder(order);
        return new GwarbmsResponse().success();
    }

}
