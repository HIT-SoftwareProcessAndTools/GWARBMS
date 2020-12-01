package cn.edu.hit.spat.system.service;
import cn.edu.hit.spat.system.entity.RetailGoods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author xuqian
 */
public interface IRetailGoodsService extends IService<RetailGoods> {
    /**
     * 通过零售单ID查找关联关系
     *
     * @param orderId 零售单单id
     * @return 关联关系
     */
    String findByOrderId(String orderId);

    /**
     * 通过货品ID查找关联关系
     *
     * @param goodsId 货品id
     * @return 关联关系
     */
    String findByGoodsId(String goodsId);



}
