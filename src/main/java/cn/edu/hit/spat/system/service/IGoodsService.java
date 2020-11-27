package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Goods;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author XuJian
 */
public interface IGoodsService extends IService<Goods> {

    /**
     * 通过货品 ID查找货品
     *
     * @param goodsId 货品 ID
     * @return 货品
     */
    Goods findByGoodsId(Long goodsId);

    /**
     * 查找货品详细信息
     *
     * @param request request
     * @param goods 货品对象，用于传递查询条件
     * @return IPage
     */
    IPage<Goods> findGoodsDetailList(Goods goods, QueryRequest request);

    /**
     * 通过 ID查找详细信息
     *
     * @param goodsId 货品 ID
     * @return 信息
     */
    Goods findGoodsDetailList(Long goodsId);

    /**
     * 新增
     *
     * @param goods
     */
    void createGoods(Goods goods);

    /**
     * 删除
     *
     * @param goodsId 车辆 id数组
     */
    void deleteGoods(String goodsId);

    /**
     * 修改车辆
     *
     * @param goods 车辆
     */
    void updateGoods(Goods goods);

    /**
     * 出售车辆
     *
     * @param goodsIds
     */
    void saleGoodss(Long[] goodsIds);
}