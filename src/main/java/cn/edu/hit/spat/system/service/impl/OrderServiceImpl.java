package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.authentication.ShiroRealm;
import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
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
        // 保存零售单和商品关联关系
        String[] goodsIds = order.getGoodsId().split(StringPool.COMMA);
        List<String> goodsname = findgoodsName(goodsIds);
        Double price = getprice(goodsIds);
        order.setName(goodsname);
        order.setOrderPrice(price);
        order.setCreateTime(new Date());
        save(order);
        setRetailandGoods(order, goodsIds);
        recordService.resetbyGoodsId(goodsIds);

    }

    private Double getprice(String[] goodsIds) {
        List<Double> p = new ArrayList<>();
        Arrays.stream(goodsIds).forEach(goodsId -> {
            Goods newgood = goodsService.findByGoodsId(Long.valueOf(goodsId));
            p.add(newgood.getRetailPrice());
        });
        System.out.println(p);
        int i=0;
        Double sum = 0.0;
        for(i=0;i< p.size();i++){
            sum = sum +p.get(i);
        }
        System.out.println(sum);
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
