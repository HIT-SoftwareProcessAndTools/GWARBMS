package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.mapper.CustomerMapper;
import cn.edu.hit.spat.system.service.ICustomerService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
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

    @Override
    public Customer findByCustomerId(Long customerId) {
        return this.baseMapper.findByCustomerId(customerId);
    }

    @Override
    public IPage<Customer> findCustomerDetailList(Customer customer, QueryRequest request) {
        if (StringUtils.isNotBlank(customer.getPurchasingDateFrom()) &&
                StringUtils.equals(customer.getPurchasingDateFrom(), customer.getPurchasingDateTo())) {
            customer.setPurchasingDateFrom(customer.getPurchasingDateFrom() + " 00:00:00");
            customer.setPurchasingDateTo(customer.getPurchasingDateTo() + " 23:59:59");
        }
        Page<Customer> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countCustomerDetail(customer));
        SortUtil.handlePageSort(request, page, "customerId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findCustomerDetailPage(page, customer);
    }

    @Override
    public Customer findCustomerDetailList(Long customerId) {
        Customer param = new Customer();
        param.setCustomerId(customerId);
        List<Customer> customers = this.baseMapper.findCustomerDetail(param);
        return CollectionUtils.isNotEmpty(customers) ? customers.get(0) : null;
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
}
