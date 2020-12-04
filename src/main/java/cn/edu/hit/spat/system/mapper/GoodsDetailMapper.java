package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.GoodsDetail;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsDetailMapper extends BaseMapper<GoodsDetail> {

    /**
     * 根据货品详情项ID查找货品
     *
     * @param goodsDetailId 货品详情项 ID
     * @return GoodsDetail
     */
    GoodsDetail findByGoodsDetailId(Long goodsDetailId);

    /**
     * 查找货品详细信息
     *
     * @param page 分页对象
     * @param goodsDetail 货品信息对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<GoodsDetail> findGoodsDetailPage(Page<T> page, @Param("goodsDetail") GoodsDetail goodsDetail);

    /**
     * 查找货品详细信息
     *
     * @param goodsId 货品 ID，用于传递查询条件
     * @return List<GoodsDetail>
     */
    List<GoodsDetail> findByGoodId(Long goodsId);

    /**
     * 查找货品详细信息是否存在
     *
     * @param goodsDetail 货品详细信息，用于传递查询条件
     * @return List<GoodsDetail>
     */
    List<GoodsDetail> findGoodsDetail(@Param("goodsDetail") GoodsDetail goodsDetail);

    long countGoodsDetail(@Param("goodsDetail") GoodsDetail goodsDetail);
}
