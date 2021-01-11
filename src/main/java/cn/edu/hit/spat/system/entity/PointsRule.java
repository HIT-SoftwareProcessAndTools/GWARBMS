package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author XuJian
 */
@Data
@TableName("t_points_rule")
public class PointsRule implements Serializable  {

    /**
     * 规则 ID
     */
    @TableId(value = "POINTS_RULE_ID", type = IdType.AUTO)
    private Long pointsRuleId;

    /**
     * 付账累计积分是的比例
     */
    @TableField("TO_POINTS")
    private Long toPoints;

    /**
     * 积分兑换余额的比例
     */
    @TableField("TO_BALANCE")
    private Long toBalance;

    public Long getId() {
        return pointsRuleId;
    }
}
