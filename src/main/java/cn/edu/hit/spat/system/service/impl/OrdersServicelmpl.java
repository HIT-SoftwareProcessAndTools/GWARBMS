package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Orders;
import cn.edu.hit.spat.system.mapper.OrdersMapper;
import cn.edu.hit.spat.system.service.IOrdersService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
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
    public Orders findByName(String customerName) {
        return null;
    }

    @Override
    public IPage<Orders> findOrdersDetailList(Orders orders, QueryRequest request) {
        return null;
    }

    @Override
    public Orders findOrdersDetailList(String customerName) {
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrders(Orders orders) {
        orders.setCreateTime(new Date());
        orders.setStatus(Orders.STATUS_SAVED);
        save(orders);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void auditOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updateById(id,Orders.STATUS_AUDITING);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void archiveOrders(String[] ordersIds){
        List<String> list = Arrays.asList(ordersIds);
        for(String id:list){
            this.baseMapper.updateById(id,Orders.STATUS_VALID);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrders(String[] orderIds){
        List<String> list = Arrays.asList(orderIds);
        for(String id:list){
            this.baseMapper.deleteById(id);
        }
    }
}
