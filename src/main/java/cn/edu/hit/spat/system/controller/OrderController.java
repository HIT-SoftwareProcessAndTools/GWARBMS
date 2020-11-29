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
 * @author Xuqian
 * 零售订单控制
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("order")
public class OrderController extends BaseController {

    private final IOrderService orderService;

    /**
     * 根据客户信息查看零售销售单
     * @param customername
     * @return
     */
    @GetMapping("{customername}")
    public Order getUser(@NotBlank(message = "{required}") @PathVariable String customername) {
        return this.orderService.findOrderDetailList(customername);
    }


    /**
     * 查看零售销售单详细信息，只有销售人员可以查看订单详细信息。需要配置权限user:view"
     * @param order 订单编号
     * @param request
     * @return
     */
    @GetMapping("list")
    @RequiresPermissions("user:view")
    public GwarbmsResponse orderList(Order order, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.orderService.findOrderDetailList(order, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    /**
     * 新增零售销售单，零售销售单不用审核。 销售人员拥有权限user:add
     * @param order 销售单对象
     * @return
     */
    @PostMapping
    @RequiresPermissions("user:add")
    @ControllerEndpoint(operation = "新增订单", exceptionMessage = "新增订单失败")
    public GwarbmsResponse addUser(@Valid Order order) {
        this.orderService.createOrder(order);
        return new GwarbmsResponse().success();
    }

    /**
     * 删除零售单 零售销售单只能由销售人员进行删除，销售人员拥有权限user:delete。
     * @param orderIds 销售单编号
     * @return
     */
    @GetMapping("delete/{userIds}")
    @RequiresPermissions("user:delete")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除订单失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] ids = orderIds.split(StringPool.COMMA);
        this.orderService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }

    /**
     * 修改零售销售单，零售销售单只能由销售人员进行修改。销售人员有user:update 权限
     * @param order 销售单对象
     * @return
     */
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
