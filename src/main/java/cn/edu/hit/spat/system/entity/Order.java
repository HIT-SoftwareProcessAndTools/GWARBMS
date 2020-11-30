package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author XuQian
 * 零售销售单表
 */
@Data
@TableName("t_order_single")
public class Order implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;


    /**
     * 零售销售单 ID
     */
    @TableId(value = "ORDER_ID", type = IdType.AUTO)
    private Long orderId;

    /**
     * 销售人员ID。此系统无用
     */
    @TableField("SALES_ID")
    private Long salesId;

    /**
     * 客户姓名
     */
    @TableField("CUSTOMER_NAME")
    private String customerName;

    /**
     * 客户手机号码
     */
    @TableField("CUSTOMER_PHONE")
    private String customerPhone;


    /**
     * 车辆ID，此系统无用
     */
    @TableField("VIHECLE_ID")
    private Long vihecleId;


    /**
     * 零售销售单价格
     */
    @TableField("PRICE")
    private Long price;


    /**
     * 创建时间
     */
    @TableField("CREATE_TIME")
    private Date createTime;

    @TableField(exist = false)
    private String createTimeFrom;

    @TableField(exist = false)
    private String createTimeTo;


    public Long getId() {
        return orderId;
    }
}
