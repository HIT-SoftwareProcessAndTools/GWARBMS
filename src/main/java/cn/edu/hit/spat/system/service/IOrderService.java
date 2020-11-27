package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Order;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author MrBird
 */
public interface IOrderService extends IService<Order> {

    /**
     * 通过客户名称查找用户
     *
     * @param customerName 客户姓名
     * @return 订单
     */
    Order findByName(String customerName);

    /**
     * 查找订单详细信息
     *
     * @param request request
     * @param order    订单对象，用于传递查询条件
     * @return IPage
     */
    IPage<Order> findOrderDetailList(Order order, QueryRequest request);

    /**
     * 通过客户名查找订单详细信息
     *
     * @param customerName 客户名
     * @return 订单信息
     */
    Order findOrderDetailList(String customerName);



    /**
     * 新增订单
     *
     * @param Order order
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
     * @param Order user
     */
    void updateOrder(Order order);




}
