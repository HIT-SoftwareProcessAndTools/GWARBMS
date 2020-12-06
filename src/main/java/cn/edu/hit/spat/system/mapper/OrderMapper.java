package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Xuqain
 */
public interface OrderMapper extends BaseMapper<Order> {

    /**
     * 通过客户名称查找零售销售单
     *
     * @param customerName 客户姓名
     * @return 零售销售单
     */
    Order findByName(String customerName);

    /**
     * 查找零售销售单详细信息
     *
     * @param page 分页对象
     * @param order 销售单对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Order> findOrderDetailPage(Page<T> page, @Param("order") Order order);

    long countOrderDetail(@Param("order") Order order);

    /**
     * 查找零售销售单详细信息
     *
     * @param order 销售单对象，用于传递查询条件
     * @return List<Order>
     */
    List<Order> findOrderDetail(@Param("order") Order order);

    /**
     * 根据订单Id查找信息
     * @param orderId
     * @return
     */
    Order findByOrderId(Long orderId);
}
