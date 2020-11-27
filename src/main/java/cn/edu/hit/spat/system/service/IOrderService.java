package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Order;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author XuJian
 */
public interface IOrderService extends IService<Order> {

    /**
     * 通过订单号查找订单
     *
     * @param orderId 订单号
     * @return 订单
     */
    Order findByOrderId(Long orderId);

    /**
     * 查找订单详细信息
     *
     * @param request request
     * @param order    订单对象，用于传递查询条件
     * @return IPage
     */
    IPage<Order> findOrderDetailList(Order order, QueryRequest request);

    /**
     * 根据当前登录用户名查找订单详细信息
     *
     * @param request request
     * @param order    订单对象，用于传递查询条件
     * @return IPage
     */
    IPage<Order> findOrderDetailListWithUserId(Order order, QueryRequest request, Long userId);

    /**
     * 通过订单号查找订单详细信息
     *
     * @param orderId 订单号
     * @return 订单信息
     */
    Order findOrderDetailList(Long orderId);

    /**
     * 新增订单
     *
     * @param order 订单
     */
    void createOrder(Order order);

    /**
     * 删除订单
     *
     * @param orderIds 订单 id数组
     */
    void deleteOrders(String[] orderIds);

    /**
     * 修改订单
     *
     * @param order 订单
     */
    void updateOrder(Order order);

    /**
     * 更改订单状态
     *
     * @param status
     * @param orderIds
     */
    void statusChange(String status, Long[] orderIds);
}
