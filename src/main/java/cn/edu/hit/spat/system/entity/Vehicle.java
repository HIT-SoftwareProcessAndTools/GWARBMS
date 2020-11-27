package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * @author XuJian
 */
@Data
@TableName("vehicletable")
public class Vehicle implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;

    /**
     * 车辆 ID
     */
    @TableId(value = "VEHICLE_ID", type = IdType.AUTO)
    private Long vehicleId;

    /**
     * 车型
     */
    @TableField("TYPE")
    private String type;

    /**
     * 颜色
     */
    @TableField("COLOR")
    private String color;

    /**
     * 车重
     */
    @TableField("DEAD_WEIGHT")
    private Long deadWeight;

    /**
     * 生产日期
     */
    @TableField("MANUFACTURE_DATE")
    private Date manufactureDate;

    /**
     * 最低售价
     */
    @TableField("LOWEST_PRICE")
    private Long lowestPrice;

    /**
     * 状态 0未出售 1已出售
     */
    @TableField("STATUS")
    @NotBlank(message = "{required}")
    private String status;

    /**
     * 剩余保养次数
     */
    @TableField("MAINTENANCE_TIMES")
    private Long maintenanceTimes;

    /* 表示时间范围，在数据库的表中不存在这两项 */
    @TableField(exist = false)
    private String manufactureDateFrom;
    @TableField(exist = false)
    private String manufactureDateTo;

    public Long getId() {
        return vehicleId;
    }
}
