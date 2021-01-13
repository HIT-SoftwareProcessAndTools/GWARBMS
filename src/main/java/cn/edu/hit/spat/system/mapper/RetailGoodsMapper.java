package cn.edu.hit.spat.system.mapper;
import cn.edu.hit.spat.system.entity.RetailGoods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author xuqian
 * @author XuJian
 */
public interface RetailGoodsMapper extends BaseMapper<RetailGoods> {

    List<RetailGoods> findByOrderId(Long orderId);
}
