package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.PointsRule;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author XuJian
 */
public interface PointsRuleMapper extends BaseMapper<PointsRule> {

    /**
     * 查找满足条件的规则
     *
     * @param pointsRule  规则查准条件
     * @return
     */
    List<PointsRule> findPointsRuleList(@Param("pointsRule") PointsRule pointsRule);
}
