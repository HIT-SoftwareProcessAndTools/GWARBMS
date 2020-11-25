package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author XuJian
 */
@Data
@TableName("ordertable")
public class Order implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;

    /**
     * 订单 ID
     */
    @TableId(value = "ORDER_ID", type = IdType.AUTO)
    private Long orderId;

    /**
     * 销售人员 ID
     */
    @TableField("SALES_ID")
    private Long salesId;

    /**
     * 客户姓名
     */
    @TableField("CUSTOMER_NAME")
    private String customerName;

    /**
     * 客户电话号码
     */
    @TableField("CUSTOMER_PHONE")
    private String customerPhone;

    /**
     * 车辆 ID
     */
    @TableField("VEHICLE_ID")
    private Long vehicleId;

    /**
     * 售价
     */
    @TableField("PRICE")
    private Long price;

    /**
     * 订单创建时间
     */
    @TableField("CREATE_TIME")
    private Date createTime;

    /**
     * 订单状态
     */
    @TableField("STATUS")
    private String status;

    /* 表示时间范围，在数据库的表中不存在这两项 */
    @TableField(exist = false)
    private String createTimeFrom;
    @TableField(exist = false)
    private String createTimeTo;

    public Long getId() {
        return orderId;
    }
}
