package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.Order;
import cn.edu.hit.spat.system.entity.RetailGoods;
import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IOrderService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;
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
    private final IGoodsService goodsService;
    /**
     * 根据客户信息查看零售销售单
     * @param customername
     * @return
     */
    @GetMapping("{customername}")
    public Order getOrder(@NotBlank(message = "{required}") @PathVariable String customername) {
        return this.orderService.findOrderDetailList(customername);
    }

    /**
     * 查看零售销售单详细信息，只有销售人员可以查看订单详细信息。需要配置权限user:view"
     * @param order 订单编号
     * @param request
     * @return
     */
    @GetMapping("list")
    @RequiresPermissions("order:view")
    public GwarbmsResponse orderList(Order order, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.orderService.findOrderDetailList(order, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    /**
     * 新增零售销售单，零售销售单不用审核。 销售人员拥有权限order:retail
     * @param message 销售单对象
     * @return
     */
    @PostMapping
    @RequiresPermissions("order:retail")
    @ControllerEndpoint(operation = "新增零售单", exceptionMessage = "新增零售单失败")
    public GwarbmsResponse addOrder(@Valid String customerName, @Valid String customerPhone, @Valid String message) {
        Order order = new Order();
        order.setCustomerName(customerName);
        order.setCustomerPhone(customerPhone);
        List<RetailGoods> retailGoodsList = new ArrayList<>();
        String[] messages = message.split(StringPool.SEMICOLON);
        System.out.println(messages.length);
        for (int i=1; i<messages.length; i++){
            String[] goods = messages[i].split(StringPool.COMMA);
            RetailGoods retailGoods = new RetailGoods();
            if (goods[1].equals("") || goods[2].equals("") || goods[3].equals("")){
                throw new GwarbmsException("必填字段不能为空");
            }
            retailGoods.setGoodsId(Long.valueOf(goods[0]));
            retailGoods.setNumber(Long.valueOf(goods[1]));
            System.out.println(4554133);
            System.out.println(goods[1]);
            Long number = Long.valueOf(goods[1]);
            if(number <= 0){
                throw new GwarbmsException(goods[4]+"的货品数量必须>0");
            }
            retailGoods.setType(goods[2]);

            retailGoods.setDiscount(Double.valueOf(goods[3]));
            Double discount = Double.valueOf(goods[3]);
            if(discount > 1 || discount < 0){
                throw new GwarbmsException(goods[4]+"的折扣必须在0到1之间");
            }
            retailGoods.setGoodsName(goods[4]);
            retailGoods.setRetailPrice(Double.valueOf(goods[5]));
            retailGoodsList.add(retailGoods);
        }
        order.setRetailGoodsList(retailGoodsList);
        this.orderService.createOrder(order);
        return new GwarbmsResponse().success();
    }

    /**
     * 删除零售单 零售销售单只能由销售人员进行删除，销售人员拥有权限order:delete。
     * @param orderIds 销售单编号
     * @return
     */
    @GetMapping("delete/{userIds}")
    @RequiresPermissions("order:delete")
    @ControllerEndpoint(operation = "删除订单", exceptionMessage = "删除订单失败")
    public GwarbmsResponse deleteOrders(@NotBlank(message = "{required}") @PathVariable String orderIds) {
        String[] ids = orderIds.split(StringPool.COMMA);
        this.orderService.deleteOrders(ids);
        return new GwarbmsResponse().success();
    }

    /**
     * 修改零售销售单，零售销售单只能由销售人员进行修改。销售人员有order:update 权限
     * @param order 销售单对象
     * @return
     */
    @PostMapping("update")
    @RequiresPermissions("order:update")
    @ControllerEndpoint(operation = "修改订单", exceptionMessage = "修改订单失败")
    public GwarbmsResponse updateOrder(@Valid Order order) {
        if (order.getOrderId() == null) {
            throw new GwarbmsException("订单ID为空");
        }
        this.orderService.updateOrder(order);
        return new GwarbmsResponse().success();
    }

    @GetMapping("getAllGoods")
    public List<Goods> GoodsList() {
        Goods goods = new Goods();
        return this.goodsService.findGoods(goods);
    }
}
