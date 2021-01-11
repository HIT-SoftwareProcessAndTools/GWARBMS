package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.system.entity.PointsRule;
import cn.edu.hit.spat.system.mapper.PointsRuleMapper;
import cn.edu.hit.spat.system.service.IPointsRuleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author XuJian
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class PointsRuleServiceImpl extends ServiceImpl<PointsRuleMapper, PointsRule> implements IPointsRuleService {

    @Override
    public List<PointsRule> findPointsRuleList(PointsRule pointsRule) {
        return this.baseMapper.findPointsRuleList(pointsRule);
    }

    @Override
    public void updatePointsRule(PointsRule pointsRule) {
        updateById(pointsRule);
    }
}
