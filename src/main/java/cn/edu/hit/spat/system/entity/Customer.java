package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author XuJian
 */
@Data
@TableName("customertable")
public class Customer implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;

    /**
     * 客户 ID
     */
    @TableId(value = "CUSTOMER_ID", type = IdType.AUTO)
    private Long customerId;

    /**
     * 客户姓名
     */
    @TableField("NAME")
    private String name;

    /**
     * 客户性别
     */
    @TableField("GENDER")
    private String gender;

    /**
     * 联系电话
     */
    @TableField("PHONE")
    private Long phone;

    /**
     * 购车时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("PURCHASING_DATE")
    private Date purchasingDate;

    /**
     * 所购车辆 ID
     */
    @TableId(value = "VEHICLE_ID")
    private Long vehicleId;

    /* 表示时间范围，在数据库的表中不存在这两项 */
    @TableField(exist = false)
    private String purchasingDateFrom;
    @TableField(exist = false)
    private String purchasingDateTo;

    public Long getId() {
        return customerId;
    }
}
