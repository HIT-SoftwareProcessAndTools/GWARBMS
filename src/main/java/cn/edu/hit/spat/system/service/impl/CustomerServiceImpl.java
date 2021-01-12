package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.PointsRule;
import cn.edu.hit.spat.system.mapper.CustomerMapper;
import cn.edu.hit.spat.system.service.ICustomerService;
import cn.edu.hit.spat.system.service.IPointsRuleService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

/**
 * @author XuJian
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements ICustomerService {

    private final IPointsRuleService pointsRuleService;

    @Override
    public Customer findByCustomerId(Long customerId) {
        return this.baseMapper.findByCustomerId(customerId);
    }

    @Override
    public IPage<Customer> findCustomerDetailList(Customer customer, QueryRequest request) {
//        if (StringUtils.isNotBlank(customer.getPurchasingDateFrom()) &&
//                StringUtils.equals(customer.getPurchasingDateFrom(), customer.getPurchasingDateTo())) {
//            customer.setPurchasingDateFrom(customer.getPurchasingDateFrom() + " 00:00:00");
//            customer.setPurchasingDateTo(customer.getPurchasingDateTo() + " 23:59:59");
//        }
        Page<Customer> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countCustomerDetail(customer));
        SortUtil.handlePageSort(request, page, "customerId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findCustomerDetailPage(page, customer);
    }

    @Override
    public List<Customer> findCustomerList(Customer customer) {
        List<Customer> customers = this.baseMapper.findCustomerDetail(customer);
        return CollectionUtils.isNotEmpty(customers) ? customers : null;
    }

    @Override
    public Customer findByCustomerPhone(Long phone){
        Customer c=this.baseMapper.findByCustomerPhone(phone);
        System.out.println(c.getName());
        return c;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createCustomer(Customer customer) {
        //customer.setPurchasingDate(new Date());
        save(customer);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteCustomers(String[] customerIds) {
        List<String> list = Arrays.asList(customerIds);
        // 删除客户
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateCustomer(Customer customer) {
        // 更新用户
        updateById(customer);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void chargeCustomer(Customer customer) {
        Customer c = this.baseMapper.findByCustomerId(customer.getCustomerId());
        Long newBalance = c.getBalance() + customer.getBalance();
        c.setBalance(newBalance);
        updateById(c);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void exchangeCustomer(Customer customer) {
        if (customer.getPoints() <= 0)
            throw new GwarbmsException("兑换的积分数量必须大于0！");

        Customer c = this.baseMapper.findByCustomerId(customer.getCustomerId());
        if (c.getPoints() < customer.getPoints())
            throw new GwarbmsException("积分余额不足！");

        PointsRule pointsRule = this.pointsRuleService.findPointsRuleList(new PointsRule()).get(0);
        Long addBalance = customer.getPoints() / pointsRule.getToBalance();
        Long newBalance = c.getBalance() + addBalance;
        Long newPoints = c.getPoints() - addBalance * pointsRule.getToBalance();
        c.setPoints(newPoints);
        c.setBalance(newBalance);
        updateById(c);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long calcNewPointsWhenPay(Long customerId, Long payMoney) {
        if (customerId == null)
            throw new GwarbmsException("客户ID为空");
        PointsRule pointsRule = this.pointsRuleService.findPointsRuleList(new PointsRule()).get(0);
        Long addPoints = payMoney / pointsRule.getToPoints();
        Customer c = this.baseMapper.findByCustomerId(customerId);
        return c.getPoints() + addPoints;
    }
}
