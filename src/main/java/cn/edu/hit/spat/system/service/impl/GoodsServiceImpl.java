package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.mapper.GoodsMapper;
import cn.edu.hit.spat.system.service.IGoodsService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author XuJian
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {

    @Override
    public Goods findByGoodsId(Long goodsId) {
        return this.baseMapper.findByGoodsId(goodsId);
    }

    @Override
    public IPage<Goods> findGoodsDetailList(Goods goods, QueryRequest request) {
        Page<Goods> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countGoodsDetail(goods));
        SortUtil.handlePageSort(request, page, "goodsId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findGoodsDetailPage(page, goods);
    }

    @Override
    public Goods findGoodsDetailList(Long goodsId) {
        Goods param = new Goods();
        param.setGoodsId(goodsId);
        List<Goods> orders = this.baseMapper.findGoodsDetail(param);
        return CollectionUtils.isNotEmpty(orders) ? orders.get(0) : null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createGoods(Goods goods) {
        save(goods);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteGoods(String goodsId) {
        List<String> list = new ArrayList<>();
        list.add(goodsId);
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateGoods(Goods goods) {
        updateById(goods);
    }
    
}
