package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author XuJian
 */
public interface OrderMapper extends BaseMapper<Order> {

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
     * @param page 分页对象
     * @param order 订单对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Order> findOrderDetailPage(Page<T> page, @Param("order") Order order);

    long countOrderDetail(@Param("order") Order order);

    /**
     * 查找订单详细信息
     *
     * @param order 订单对象，用于传递查询条件
     * @return List<Order>
     */
    List<Order> findOrderDetail(@Param("order") Order order);

    /**
     * 查找当掐登录用户订单详细信息
     *
     * @param page 分页对象
     * @param order 订单对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Order> findOrderDetailPageWithUserId(Page<T> page, @Param("order") Order order, Long userId);

    /**
     * 查找掐登录用户订单详细信息
     *
     * @param order 订单对象，用于传递查询条件
     * @return List<Order>
     */
    List<Order> findOrderDetailWithUserId(@Param("order") Order order, Long userId);

    long countOrderDetailWithUserId(@Param("order") Order order, Long userId);
}
