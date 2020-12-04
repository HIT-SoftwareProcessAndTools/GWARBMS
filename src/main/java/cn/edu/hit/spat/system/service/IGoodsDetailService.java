package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.GoodsDetail;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author XuJian
 */
public interface IGoodsDetailService extends IService<GoodsDetail> {

    /**
     * 通过货品信息 ID查找货品信息
     *
     * @param goodsDetailId 货品信息 ID
     * @return 货品信息
     */
    GoodsDetail findByDetailId(Long goodsDetailId);

    /**
     * 通过货品 ID查找货品信息
     *
     * @param goodsId 货品 ID
     * @return 货品信息
     */
    List<GoodsDetail> findByGoodsId(Long goodsId);

    /**
     * 查找货品详细信息
     *
     * @param request request
     * @param goodsDetail 货品详情对象，用于传递查询条件
     * @return IPage
     */
    IPage<GoodsDetail> findGoodsDetailList(GoodsDetail goodsDetail, QueryRequest request);

    /**
     * 新增
     *
     * @param goodsDetail
     */
    void createGoodsDetail(GoodsDetail goodsDetail);

    /**
     * 删除
     *
     * @param goodsDetailIds 货品信息 id数组
     */
    void deleteGoodsDetail(String[] goodsDetailIds);

    /**
     * 删除
     *
     * @param goodsIds 货品 id数组
     */
    void deleteGoodsDetailByGoodsIds(String[] goodsIds);

    /**
     * 修改
     *
     * @param goodsDetail 货品信息
     */
    void updateGoodsDetail(GoodsDetail goodsDetail);
}
