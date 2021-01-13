package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.RetailGoods;
import cn.edu.hit.spat.system.entity.UserDataPermission;
import cn.edu.hit.spat.system.mapper.RetailGoodsMapper;
import cn.edu.hit.spat.system.mapper.UserDataPermissionMapper;
import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IRetailGoodsService;
import cn.edu.hit.spat.system.service.IUserDataPermissionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xuqian
 */
@Service("RetailGoodsService")
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class RetailGoodsServiceImpl extends ServiceImpl<RetailGoodsMapper, RetailGoods> implements IRetailGoodsService {

    private final IGoodsService goodsService;

    @Override
    public List<RetailGoods> findByOrderId(Long orderId) {
        List<RetailGoods> retailGoodsList = this.baseMapper.findByOrderId(orderId);
        for (RetailGoods rg: retailGoodsList){
            Goods goods = goodsService.findByGoodsId(rg.getGoodsId());
            rg.setGoodsName(goods.getName());
            rg.setRetailPrice(goods.getRetailPrice());
        }
        return retailGoodsList;
    }

    @Override
    public String findByGoodsId(String goodsId) {
        LambdaQueryWrapper<RetailGoods> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(RetailGoods::getGoodsId, goodsId);
        return this.baseMapper.selectList(wrapper).stream().map(permission -> String.valueOf(permission.getOrderId())).collect(Collectors.joining(StringPool.COMMA));
    }

    @Override
    public void createRetailGoods(List<RetailGoods> retailGoodsList) {
        for (RetailGoods rg: retailGoodsList)
            save(rg);
    }
}
