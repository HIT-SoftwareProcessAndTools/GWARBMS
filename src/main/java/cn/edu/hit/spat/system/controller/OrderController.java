package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Order;
import cn.edu.hit.spat.system.entity.User;
import cn.edu.hit.spat.system.service.IOrderService;
import cn.edu.hit.spat.system.service.IUserService;
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
 * @author XuJian
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("order")
public class OrderController extends BaseController {

    private final IOrderService orderService;
    private final IUserService userService;

    @GetMapping("{orderId}")
    public Order getOrder(@NotBlank(message = "{required}") @PathVariable Long orderId) {
        return this.orderService.findOrderDetailList(orderId);
    }

    @GetMapping("list/{username}")
    @RequiresPermissions("order:view")
    public GwarbmsResponse orderList(Order order, QueryRequest request,
                                  @NotBlank(message = "{required}") @PathVariable String username) {
        Map<String, Object> dataTable;
        User user = userService.findByName(username);
        if ("81".equals(user.getRoleId())) //此处埋下一个坑
            dataTable = getDataTable(this.orderService.findOrderDetailListWithUserId(order, request, user.getUserId()));
        else dataTable = getDataTable(this.orderService.findOrderDetailList(order, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("order:create")
    @ControllerEndpoint(operation = "新增订单", exceptionMessage = "新增订单失败")
    public GwarbmsResponse createOrder(@Valid Order order) {
        this.orderService.createOrder(order);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{orderIds}")
    @RequiresPermissions("order:archive")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除订单失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] ids = orderIds.split(StringPool.COMMA);
        this.orderService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }


    @PostMapping("update")
    @RequiresPermissions("order:approve")
    @ControllerEndpoint(operation = "修改订单", exceptionMessage = "修改订单失败")
    public GwarbmsResponse updateOrder(@Valid Order order) {
        if (order.getOrderId() == null) {
            throw new GwarbmsException("订单号为空");
        }
        if(orderService.findByOrderId(order.getOrderId()).getStatus().equals("已归档"))
            throw new GwarbmsException("订单已归档");
        this.orderService.updateOrder(order);
        return new GwarbmsResponse().success();
    }

    @PostMapping("managerApprove/{orderIds}")
    @RequiresPermissions("order:approve:manager")
    @ControllerEndpoint(operation = "经理审批订单", exceptionMessage = "审批订单失败")
    public GwarbmsResponse managerApproveOrder(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] idsArray = orderIds.split(StringPool.COMMA);
        Long[] ids = new Long[idsArray.length];
        for(int i=0; i<idsArray.length; i++){
            Long id = Long.valueOf(idsArray[i]);
            if (this.orderService.findByOrderId(id).getStatus().equals("待审核"))
                ids[i] = id;
            else throw new GwarbmsException("选中订单含有非待审核状态订单");
        }
        this.orderService.statusChange("已审核", ids);
        return new GwarbmsResponse().success();
    }

    @PostMapping("accountingApprove/{orderIds}")
    @RequiresPermissions("order:approve:accounting")
    @ControllerEndpoint(operation = "财务审批订单", exceptionMessage = "审批订单失败")
    public GwarbmsResponse accountingApproveOrder(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] idsArray = orderIds.split(StringPool.COMMA);
        Long[] ids = new Long[idsArray.length];
        for(int i=0; i<idsArray.length; i++){
            Long id = Long.valueOf(idsArray[i]);
            if (this.orderService.findByOrderId(id).getStatus().equals("已审核"))
                ids[i] = id;
            else throw new GwarbmsException("选中订单含有非已审核状态订单");
        }
        this.orderService.statusChange("已付款", ids);
        return new GwarbmsResponse().success();
    }

    @PostMapping("salesApprove/{orderIds}")
    @RequiresPermissions("order:approve:sales")
    @ControllerEndpoint(operation = "销售审批订单", exceptionMessage = "审批订单失败")
    public GwarbmsResponse salesApproveOrder(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] idsArray = orderIds.split(StringPool.COMMA);
        Long[] ids = new Long[idsArray.length];
        for(int i=0; i<idsArray.length; i++){
            Long id = Long.valueOf(idsArray[i]);
            if (this.orderService.findByOrderId(id).getStatus().equals("已付款"))
                ids[i] = id;
            else throw new GwarbmsException("选中订单含有非已付款状态订单");
        }
        this.orderService.statusChange("已交付", ids);
        return new GwarbmsResponse().success();
    }

    @PostMapping("archive/{orderIds}")
    @RequiresPermissions("order:archive")
    @ControllerEndpoint(operation = "归档订单", exceptionMessage = "归档订单失败")
    public GwarbmsResponse archiveOrder(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] idsArray = orderIds.split(StringPool.COMMA);
        Long[] ids = new Long[idsArray.length];
        for(int i=0; i<idsArray.length; i++){
            Long id = Long.valueOf(idsArray[i]);
            if (this.orderService.findByOrderId(id).getStatus().equals("已交付"))
                ids[i] = id;
            else throw new GwarbmsException("选中订单含有非已交付状态订单");
        }
        this.orderService.statusChange("已归档", ids);
        return new GwarbmsResponse().success();
    }
}
