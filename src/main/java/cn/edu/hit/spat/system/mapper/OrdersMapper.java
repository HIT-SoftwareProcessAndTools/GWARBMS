package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Orders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author Daijiajia
 */
public interface OrdersMapper extends BaseMapper<Orders> {

    /**
     * 通过客户名称查找批发销售单
     *
     * @param customerName 客户姓名
     * @return 批发销售单
     */
    Orders findByName(String customerName);

    /**
     * 查找零售销售单详细信息
     *
     * @param page 分页对象
     * @param orders 销售单对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Orders> findOrdersDetailPage(Page<T> page, @Param("orders") Orders orders);

    long countOrdersDetail(@Param("orders") Orders orders);

    /**
     * 查找零售销售单详细信息
     *
     * @param orders 销售单对象，用于传递查询条件
     * @return List<Orders>
     */
    List<Orders> findOrdersDetail(@Param("orders") Orders orders);

    /**
     * 通过订单ID更新订单状态
     *
     * @param id 订单id
     * @param statusAuditing 更新后的订单状态
     *
     */
    void updateById(String id, String statusAuditing);
}
