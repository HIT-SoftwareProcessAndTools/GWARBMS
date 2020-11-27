package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Order;
import cn.edu.hit.spat.system.mapper.OrderMapper;
import cn.edu.hit.spat.system.service.IOrderService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
 * @author XuJian
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    @Override
    public Order findByOrderId(Long orderId) {
        return this.baseMapper.findByOrderId(orderId);
    }

    @Override
    public IPage<Order> findOrderDetailList(Order order, QueryRequest request) {
        if (StringUtils.isNotBlank(order.getCreateTimeFrom()) &&
                StringUtils.equals(order.getCreateTimeFrom(), order.getCreateTimeTo())) {
            order.setCreateTimeFrom(order.getCreateTimeFrom() + " 00:00:00");
            order.setCreateTimeTo(order.getCreateTimeTo() + " 23:59:59");
        }
        Page<Order> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countOrderDetail(order));
        SortUtil.handlePageSort(request, page, "orderId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findOrderDetailPage(page, order);
    }

    @Override
    public IPage<Order> findOrderDetailListWithUserId(Order order, QueryRequest request, Long userId) {
        if (StringUtils.isNotBlank(order.getCreateTimeFrom()) &&
                StringUtils.equals(order.getCreateTimeFrom(), order.getCreateTimeTo())) {
            order.setCreateTimeFrom(order.getCreateTimeFrom() + " 00:00:00");
            order.setCreateTimeTo(order.getCreateTimeTo() + " 23:59:59");
        }
        Page<Order> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countOrderDetailWithUserId(order, userId));
        SortUtil.handlePageSort(request, page, "orderId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findOrderDetailPageWithUserId(page, order, userId);
    }

    @Override
    public Order findOrderDetailList(Long orderId) {
        Order param = new Order();
        param.setOrderId(orderId);
        List<Order> orders = this.baseMapper.findOrderDetail(param);
        return CollectionUtils.isNotEmpty(orders) ? orders.get(0) : null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrder(Order order) {
        order.setCreateTime(new Date());
        save(order);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrders(String[] orderIds) {
        List<String> list = Arrays.asList(orderIds);
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrder(Order order) {
        updateById(order);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void statusChange(String status, Long[] orderIds){
        Arrays.stream(orderIds).forEach(orderId -> {
            Order order = new Order();
            order.setStatus(status);
            this.baseMapper.update(order, new LambdaQueryWrapper<Order>().eq(Order::getOrderId, orderId));
        });
    }
}
