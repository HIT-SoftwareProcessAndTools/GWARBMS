package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author XuJian
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    /**
     * 通过货品ID查找货品
     *
     * @param goodsId
     * @return
     */
    Goods findByGoodsId(Long goodsId);

    /**
     * 查找货品详细信息
     *
     * @param page 分页对象
     * @param goods 货品对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Goods> findGoodsDetailPage(Page<T> page, @Param("goods") Goods goods);

    long countGoodsDetail(@Param("goods") Goods goods);

    /**
     * 查找货品详细信息
     *
     * @param goods 货品对象，用于传递查询条件
     * @return List<Goods>
     */
    List<Goods> findGoodsDetail(@Param("goods") Goods goods);

}
