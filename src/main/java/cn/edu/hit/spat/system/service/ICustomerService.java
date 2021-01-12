package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.PointsRule;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

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
     * 通过客户联系方式查找客户
     *
     * @param phone 客户联系方式
     * @return 客户
     */
    Customer findByCustomerPhone(Long phone);

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
     * @param customer 客户 ID
     * @return 客户信息
     */
    List<Customer> findCustomerList(Customer customer);

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

    /**
     * 会员充值
     *
     * @param customer customer
     */
    void chargeCustomer(Customer customer);

    /**
     * 积分兑换
     *
     * @param customer customer
     */
    void exchangeCustomer(Customer customer);

    /**
     * 计算结账时新的会员积分，但不更新数据库
     * @param customerId 会员ID
     * @param payMoney 付款的金额
     * @return 新的会员积分
     */
    Long calcNewPointsWhenPay(Long customerId, Long payMoney);
}
