package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.authentication.ShiroRealm;
import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.utils.Md5Util;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.*;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.mapper.OrderMapper;
import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IOrderService;
import cn.edu.hit.spat.system.service.IRecordService;
import cn.edu.hit.spat.system.service.IRetailGoodsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Console;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


/**
 * @author MrBird
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements IOrderService {

    private final ShiroRealm shiroRealm;
    private final IRetailGoodsService retailGoodsService;
    private  final IGoodsService goodsService;
    private final IRecordService recordService;

    @Override
    public Order findByName(String customername) {
        return this.baseMapper.findByName(customername);
    }
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
    public Order findOrderDetailList(String customerName) {
        Order param = new Order();
        param.setCustomerName(customerName);
        List<Order> order = this.baseMapper.findOrderDetail(param);
        return CollectionUtils.isNotEmpty(order) ? order.get(0) : null;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrder(Order order) {
        order.setOrderPrice(getprice(order.getRetailGoodsList()));
        order.setCreateTime(new Date());
        save(order);
        for (RetailGoods rg: order.getRetailGoodsList()){
            rg.setOrderId(order.getId());
            if (!(rg.getType().equals("售") || rg.getType().equals("折") || rg.getType().equals("赠")))
                throw new GwarbmsException("存在非法销售类型！");
            Record record = new Record(); //构造查询条件
            record.setGoodsId(rg.getGoodsId());
            record.setStorageId(new Long(1));
            List<Record> records = this.recordService.findRecordList(record);
            if (records == null)
                throw new GwarbmsException(rg.getGoodsName() + "在门店没有库存!");
            else {
                record = records.get(0);
                if (record.getNumber() < rg.getNumber())
                    throw new GwarbmsException(rg.getGoodsName() + "在门店库存不足！");
                else {
                    record.setNumber(record.getNumber() - rg.getNumber());
                    this.recordService.updateRecord(record);
                }
            }
        }
        retailGoodsService.createRetailGoods(order.getRetailGoodsList());
    }

    private Double getprice(List<RetailGoods> retailGoodsList) {
        Double sum = 0.0;
        for (RetailGoods rg: retailGoodsList){
            if (rg.getType().equals("售"))
                sum += rg.getRetailPrice() * rg.getNumber();
            else if (rg.getType().equals("折"))
                sum += rg.getRetailPrice() * rg.getNumber() * rg.getDiscount();
        }
        return sum;
    }

    private List<String> findgoodsName(String[] goodsIds) {
        List<String> goodsNames = new ArrayList<>();
        Arrays.stream(goodsIds).forEach(goodsId -> {
            Goods newgood = goodsService.findByGoodsId(Long.valueOf(goodsId));
            goodsNames.add(newgood.getName());
        });
        return goodsNames;
    }

    private void setRetailandGoods(Order order, String[] goodsIds) {
        List<RetailGoods> retailandGoods = new ArrayList<>();
        Arrays.stream(goodsIds).forEach(goodsId -> {
            RetailGoods permission = new RetailGoods();
            permission.setGoodsId(Long.valueOf(goodsId));
            permission.setOrderId(order.getOrderId());
            retailandGoods.add(permission);
        });
        retailGoodsService.saveBatch(retailandGoods);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteOrders(String[] orderIds) {
        List<String> list = Arrays.asList(orderIds);
        // 删除订单
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateOrder(Order order) {
        updateById(order);

    }


}
