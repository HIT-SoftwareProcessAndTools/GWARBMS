package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Customer;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author MrBird
 */
public interface CustomerMapper extends BaseMapper<Customer> {

    /**
     * 通过客户 ID查找客户
     *
     * @param customerId 客户名
     * @return 客户
     */
    Customer findByCustomerId(Long customerId);

    /**
     * 查找客户详细信息
     *
     * @param page 分页对象
     * @param customer 客户对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Customer> findCustomerDetailPage(Page<T> page, @Param("customer") Customer customer);

    long countCustomerDetail(@Param("customer") Customer customer);

    /**
     * 查找客户详细信息
     *
     * @param customer 客户对象，用于传递查询条件
     * @return List<Customer>
     */
    List<Customer> findCustomerDetail(@Param("customer") Customer customer);

    /**
     * 通过客户联系方式查找客户
     *
     * @param phone 客户联系方式
     * @return 客户
     */
    Customer findByCustomerPhone(Long phone);
}
