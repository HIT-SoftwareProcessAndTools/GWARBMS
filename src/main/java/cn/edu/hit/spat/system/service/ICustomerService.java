package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Customer;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author XuJian
 */
public interface ICustomerService extends IService<Customer> {

    /**
     * 通过客户 ID查找客户
     *
     * @param customerId 客户 ID
     * @return 客户
     */
    Customer findByCustomerId(Long customerId);

    /**
     * 查找客户详细信息
     *
     * @param request request
     * @param customer 客户对象，用于传递查询条件
     * @return IPage
     */
    IPage<Customer> findCustomerDetailList(Customer customer, QueryRequest request);

    /**
     * 通过客户 ID查找客户详细信息
     *
     * @param customerId 客户 ID
     * @return 客户信息
     */
    Customer findCustomerDetailList(Long customerId);

    /**
     * 新增客户
     *
     * @param customer customer
     */
    void createCustomer(Customer customer);

    /**
     * 删除客户
     *
     * @param customerIds 客户 id数组
     */
    void deleteCustomers(String[] customerIds);

    /**
     * 修改客户信息
     *
     * @param customer customer
     */
    void updateCustomer(Customer customer);
}
