package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Order;
import cn.edu.hit.spat.system.entity.RetailGoods;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author Xuqian
 * 零售销售单操作
 */
public interface IOrderService extends IService<Order> {

    /**
     * 通过客户名称查找销售单
     *
     * @param customerName 客户姓名
     * @return 零售销售单
     */
    Order findByName(String customerName);

    /**
     * 通过订单编号查找零售单
     * @param orderId
     * @return
     */
    Order findByOrderId(Long orderId);
    /**
     * 查找销售单详细信息
     *
     * @param request request
     * @param order   销售单对象，用于传递查询条件
     * @return IPage
     */
    IPage<Order> findOrderDetailList(Order order, QueryRequest request);

    /**
     * 通过客户名查找销售单详细信息
     *
     * @param customerName 客户名
     * @return 销售单信息
     */
    Order findOrderDetailList(String customerName);



    /**
     * 新增零售销售单
     *
     * @param Order order 零售销售单对象
     */
    void createOrder(Order order);

    /**
     * 删除零售销售单
     *
     * @param orderIds 零售销售单id数组
     */
    void deleteOrders(String[] orderIds);

    /**
     * 修改零售销售单
     *
     * @param Order order 零售销售单对象
     */
    void updateOrder(Order order);




}
