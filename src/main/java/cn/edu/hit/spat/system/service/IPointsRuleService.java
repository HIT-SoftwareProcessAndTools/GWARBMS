package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.system.entity.PointsRule;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface IPointsRuleService extends IService<PointsRule> {

    /**
     * 查找满足条件的规则
     *
     * @param pointsRule  规则查准条件
     * @return
     */
    List<PointsRule> findPointsRuleList(PointsRule pointsRule);

    /**
     * 修改规则
     *
     * @param pointsRule pointsRule
     */
    void updatePointsRule(PointsRule pointsRule);
}
