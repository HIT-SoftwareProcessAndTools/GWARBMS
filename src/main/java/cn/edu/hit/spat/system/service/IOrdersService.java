package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.Orders;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Author Daijiajia
 */
public interface IOrdersService extends IService<Orders> {

    /**
     * 通过订单ID查找批发销售单
     *
     * @param ordersID 订单ID
     * @return 批发销售单
     */
    Orders findById(Long ordersID);

    /**
     * 查找批发销售单详细信息
     *
     * @param request request
     * @param orders   批发销售单对象，用于传递查询条件
     * @return IPage
     */
    IPage<Orders> findOrdersDetailList(Orders orders, QueryRequest request);

    /**
     * 通过客户名查找批发销售单详细信息
     *
     * @param customerName 客户名
     * @return 批发销售单信息
     */
    Orders findOrdersDetailList(String customerName);

    /**
     * 通过订单ID查找批发销售单详细信息
     *
     * @param ordersId 订单ID
     * @return 批发销售单信息
     */
    Orders findOrdersDetailList(Long ordersId);

    /**
     * 新增订单
     *
     * @param orders 新增的批发订单信息
     */
    Long createOrders(Orders orders);

    /**
     * 提交订单
     *
     * @param ordersIds 提交的批发订单ID
     */
    void submitOrders(String[] ordersIds);

    /**
     * 审核订单
     *
     * @param ordersIds 审核的批发订单ID
     */
    void auditOrders(String[] ordersIds);

    /**
     * 收款订单
     *
     * @param ordersIds 收款的批发订单ID
     */
    void payOrders(String[] ordersIds);

    /**
     * 退货
     *
     * @param ordersIds 退货的批发订单ID
     */
    void returnOrders(String[] ordersIds);

    /**
     * 删除订单
     *
     * @param ordersIds 删除的批发订单ID
     */
    void deleteOrders(String[] ordersIds);

    /**
     * 修改销售单信息
     *
     * @param orders 待修改的批发订单信息
     */
    void updateOrders(Orders orders);

    /**
     * 销售单分期收款
     *
     * @param id 该次分期收款的订单ID
     */
    void payoneOrders(String id);

    /**
     * 销售单使用账户余额分期收款
     *
     * @param id 该次分期收款的订单ID
     */
    void paywithCount(String id);
}
