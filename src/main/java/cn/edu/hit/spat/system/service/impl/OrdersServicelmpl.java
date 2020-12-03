package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.Orders;
import cn.edu.hit.spat.system.mapper.OrdersMapper;
import cn.edu.hit.spat.system.service.IOrdersService;
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
import java.util.Date;
import java.util.List;

/**
 * @Author Daijiajia
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OrdersServicelmpl extends ServiceImpl<OrdersMapper, Orders> implements IOrdersService {
    @Override
    public Orders findById(Long ordersId) {
        return this.baseMapper.findById(ordersId);
    }

    @Override
    public IPage<Orders> findOrdersDetailList(Orders orders, QueryRequest request) {
        if (StringUtils.isNotBlank(orders.getCreateTimeFrom()) &&
                StringUtils.equals(orders.getCreateTimeFrom(), orders.getCreateTimeTo())) {
            orders.setCreateTimeFrom(orders.getCreateTimeFrom() + " 00:00:00");
            orders.setCreateTimeTo(orders.getCreateTimeTo() + " 23:59:59");
        }
        Page<Orders> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countOrdersDetail(orders));
        SortUtil.handlePageSort(request, page, "ordersId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findOrdersDetailPage(page, orders);
    }
    @Override
    public Orders findOrdersDetailList(String customerName) {
        Orders param = new Orders();
        param.setCustomerName(customerName);
        List<Orders> orders = this.baseMapper.findOrdersDetail(param);
        return CollectionUtils.isNotEmpty(orders) ? orders.get(0) : null;
    }

    @Override
    public Orders findOrdersDetailList(Long ordersId) {
        Orders param = new Orders();
        param.setOrdersId(ordersId);
        List<Orders> orders = this.baseMapper.findOrdersDetail(param);
        return CollectionUtils.isNotEmpty(orders) ? orders.get(0) : null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrders(Orders orders) {
        orders.setCreateTime(new Date());
        orders.setPricepaid((double) 0);
        orders.setStatus(Orders.STATUS_SAVED);
        save(orders);
    }

    //提交
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void submitOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updatestateById(id,Orders.STATUS_AUDITING);
        }
    }

    //审核
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void auditOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updatestateById(id,Orders.STATUS_PAYING);
        }
    }

    //收款
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void payOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updatestateById(id,Orders.STATUS_VALID);
        }
    }

    //退货
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void returnOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updatestateById(id,Orders.STATUS_RETURNED);
        }
    }

    //删除
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrders(String[] orderIds){
        List<String> list = Arrays.asList(orderIds);
        for(String id:list){
            this.baseMapper.deleteById(id);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrders(Orders orders) {
        // 更新销售单
        orders.setCreateTime(orders.getCreateTime());
        updateById(orders);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void payoneOrders(String id) {
        // 销售单分期收款
        Long ordersId=Long.valueOf(id);
        Orders orders=findById(ordersId);
        Double price=orders.getPricepaid()+orders.getOrdersprice()/orders.getOrdersperiod();
        this.baseMapper.updatepricepaidById(String.valueOf(id),price);
    }
}
