package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.GoodsDetail;
import cn.edu.hit.spat.system.mapper.GoodsDetailMapper;
import cn.edu.hit.spat.system.service.IGoodsDetailService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
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
public class GoodsDetailServiceImpl extends ServiceImpl<GoodsDetailMapper, GoodsDetail> implements IGoodsDetailService {

    @Override
    public GoodsDetail findByDetailId(Long goodsDetailId) {
        return this.baseMapper.findByGoodsDetailId(goodsDetailId);
    }

    @Override
    public List<GoodsDetail> findByGoodsId(Long goodsId) {
        List<GoodsDetail> goodsDetails = this.baseMapper.findByGoodId(goodsId);
        return CollectionUtils.isNotEmpty(goodsDetails) ? goodsDetails : null;
    }

    @Override
    public IPage<GoodsDetail> findGoodsDetailList(GoodsDetail goodsDetail, QueryRequest request) {
        Page<GoodsDetail> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countGoodsDetail(goodsDetail));
        SortUtil.handlePageSort(request, page, "goodsDetailId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findGoodsDetailPage(page, goodsDetail);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createGoodsDetail(GoodsDetail goodsDetail) {
        GoodsDetail findInfo = new GoodsDetail();
        findInfo.setGoodsId(goodsDetail.getGoodsId());
        findInfo.setGoodsAttribute(goodsDetail.getGoodsAttribute());
        List<GoodsDetail> goodsDetails = this.baseMapper.findGoodsDetail(findInfo);
        if (CollectionUtils.isNotEmpty(goodsDetails)) {
            goodsDetail.setGoodsDetailId(goodsDetails.get(0).getGoodsDetailId());
            updateGoodsDetail(goodsDetail);
        }
        else
            save(goodsDetail);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteGoodsDetail(String[] goodsDetailIds) {
        List<String> list = Arrays.asList(goodsDetailIds);
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteGoodsDetailByGoodsIds(String[] goodsIds) {
        List<String> list = new ArrayList<>();
        for (String goodsId: goodsIds){
            List<GoodsDetail> goodsDetails = this.findByGoodsId(Long.parseLong(goodsId));
            if (goodsDetails == null){
                continue;
            }
            for (GoodsDetail goodsDetail: goodsDetails){
                list.add(goodsDetail.getGoodsDetailId().toString());
            }
        }
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateGoodsDetail(GoodsDetail goodsDetail) {
        if (goodsDetail.getGoodsAttributeValue() == null || goodsDetail.getGoodsAttributeValue().equals(""))
            deleteGoodsDetail(goodsDetail.getGoodsDetailId().toString().split(StringPool.COMMA));
        else
            updateById(goodsDetail);
    }
}
