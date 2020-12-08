package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.Role;
import cn.edu.hit.spat.system.entity.Storage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

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
     * 通过name查找
     *
     * @param name 货品名字
     * @return 符合条件的所有货品
     */
    List<Goods> findByName(String name);

    /**
     * 新增
     *
     * @param goods
     */
    void createGoods(Goods goods);

    /**
     * 删除
     *
     * @param goodsIds 货品 id数组
     */
    void deleteGoods(String[] goodsIds);

    /**
     * 修改
     *
     * @param goods 货品
     */
    void updateGoods(Goods goods);

    /**
     * 寻找商品所有信息
     * @authoer xuqian
     * @param goods
     * @return
     */
    List<Goods> findGoods(Goods goods);
}
