package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Orders;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Author Daijiajia
 */
public interface IOrdersService extends IService<Orders> {

    /**
     * 通过客户名称查找批发销售单
     *
     * @param customerName 客户姓名
     * @return 批发销售单
     */
    Orders findByName(String customerName);

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
     * 新增订单
     *
     * @param orders
     */
    void createOrders(Orders orders);

    /**
     * 审核订单
     *
     * @param ordersIds
     */
    void auditOrders(String[] ordersIds);

    /**
     * 归档订单
     *
     * @param ordersIds
     */
    void archiveOrders(String[] ordersIds);

    /**
     * 撤销订单
     *
     * @param ordersIds
     */
    void deleteOrders(String[] ordersIds);
}
