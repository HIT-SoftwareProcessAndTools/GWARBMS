package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.*;
import cn.edu.hit.spat.system.mapper.OrdersMapper;
import cn.edu.hit.spat.system.service.*;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import net.sf.jsqlparser.expression.LongValue;
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

    private final IGoodsService goodsService;
    private final IRecordService recordService;
    private final ICustomerService customerService;

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

    //新增
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createOrders(Orders orders) {
        orders.setCreateTime(new Date());
        orders.setPricepaid((double) 0);
        orders.setStatus(Orders.STATUS_SAVED);
        save(orders);
        return orders.getOrdersId();
    }

    //提交
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void submitOrders(String[] ordersIds){
        for(String id:ordersIds){
            Orders o = this.baseMapper.findById(Long.valueOf(id));
            if(o.getStorehouse()==null || o.getOrdersaddress()==null || o.getOrdersperiod()==null)
                throw new GwarbmsException("选中订单中包含未完整填写信息的订单！");
            if(o.getStatus().equals("4"))
                throw new GwarbmsException("选中订单中包含已退货的订单！");
            if(!o.getStatus().equals("0"))
                throw new GwarbmsException("选中订单中包含已提交的订单！");
            this.baseMapper.updatestateById(id,Orders.STATUS_AUDITING);
        }
    }

    //审核
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void auditOrders(String[] ordersIds){
        for(String id:ordersIds){
            Orders o = this.baseMapper.findById(Long.valueOf(id));
            if(o.getStatus().equals("0"))
                throw new GwarbmsException("选中订单中包含未提交订单！");
            if(!o.getStatus().equals("1"))
                throw new GwarbmsException("选中订单中包含已审核！");
            if(recordService.resetbyGoodsIdandStorage(o.getGoodsId(),o.getStorehouse(),o.getGoodsNum())==0)
                throw new GwarbmsException("选中订单中存在货品库存不足的订单！");
            Customer customer=customerService.findByCustomerPhone(Long.valueOf(o.getCustomerPhone()));
            if(customer.getVip().equals("1")){
                customer.setPoints(customerService.calcNewPointsWhenPay(customer.getId(),o.getOrdersprice().longValue()));
                customerService.updateCustomer(customer);
            }
            this.baseMapper.updatestateById(id,Orders.STATUS_PAYING);
        }
    }

    //收款
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void payOrders(String[] ordersIds){
        for(String id:ordersIds){
            Orders o = this.baseMapper.findById(Long.valueOf(id));
            if(o.getStatus().equals("4"))
                throw new GwarbmsException("选中订单中包含已退货的订单！");
            if(!o.getStatus().equals("2") && !o.getStatus().equals("3"))
                throw new GwarbmsException("选中订单中包含未审核的订单！");
            if(!o.getOrdersprice().equals(o.getPricepaid()))
                throw new GwarbmsException("选中订单中包含收款未完成的订单！");
            this.baseMapper.updatestateById(id,Orders.STATUS_VALID);
        }
    }

    //退货
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void returnOrders(String[] ordersIds){
        for(String id:ordersIds){
            Long ordersId=Long.valueOf(id);
            Orders o=findById(ordersId);
            if(!o.getStatus().equals("2") && !o.getStatus().equals("3") && !o.getStatus().equals("4"))
                throw new GwarbmsException("选中订单中包含未审核的订单,可直接删除！");
            this.baseMapper.updatestateById(id,Orders.STATUS_RETURNED);
            Record rec=recordService.findByGoods(o.getGoodsId());
            rec.setNumber(rec.getNumber()+o.getGoodsNum());
            recordService.updateRecord(rec);
        }
    }

    //删除
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrders(String[] ordersIds){
        for(String id:ordersIds){
            Long ordersId=Long.valueOf(id);
            Orders orders=findById(ordersId);
            if(!orders.getStatus().equals("0") && !orders.getStatus().equals("1"))
                throw new GwarbmsException("选中订单中包含已审核过的订单！");
            this.baseMapper.deleteById(id);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrders(Orders orders) {
        // 修改销售单
        if(orders.getGoodsId()!=null){
        Goods goods=goodsService.findByGoodsId(orders.getGoodsId());
        if(goods==null)
            throw new GwarbmsException("该货品ID不存在！");
        if(!goods.getName().equals(orders.getGoodsName()))
            throw new GwarbmsException("该货品ID与货品名不对应！");
        if(orders.getGoodsNum()!=null){
            orders.setOrdersprice(goods.getWholesalePrice()*orders.getGoodsNum());
            orders.setOrdersprofile((goods.getWholesalePrice()-goods.getPurchasePrice())*orders.getGoodsNum());
        }
        orders.setCreateTime(orders.getCreateTime());
        orders.setGoodsName(goods.getName());}
        updateById(orders);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void payoneOrders(String id) {
        // 销售单分期收款
        Long ordersId=Long.valueOf(id);
        Orders orders=findById(ordersId);
        if(!orders.getStatus().equals("2"))
            throw new GwarbmsException("请确认该订单处于收款状态！");
        if(orders.getPricepaid().equals(orders.getOrdersprice()))
            throw new GwarbmsException("该订单已收取全部款项");
        Double price=orders.getPricepaid()+orders.getOrdersprice()/orders.getOrdersperiod();
        this.baseMapper.updatepricepaidById(id,price);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void paywithCount(String id) {
        // 销售单使用账户余额分期收款
        payoneOrders(id);
        Long ordersId=Long.valueOf(id);
        Orders o=findById(ordersId);
        Customer customer=customerService.findByCustomerPhone(Long.valueOf(o.getCustomerPhone()));
        if(!customer.getVip().equals("1")){
            throw new GwarbmsException("该客户非会员客户，只支持现金支付");
        }
        double money=o.getOrdersprice()/o.getOrdersperiod();
        customer.setBalance(customer.getBalance()- (long)money);
        customerService.updateCustomer(customer);
    }
}
