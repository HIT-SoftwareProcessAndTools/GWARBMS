package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Daijiajia
 * 批发销售单表
 */
@Data
@TableName("t_order_wholesale")
public class Orders implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;

    /**
     * 订单状态：已保存，待提交
     */
    public static final String STATUS_SAVED = "0";
    /**
     * 订单状态：已提交，待审核
     */
    public static final String STATUS_AUDITING = "1";
    /**
     * 订单状态：已审核，收款中
     */
    public static final String STATUS_PAYING = "2";
    /**
     * 订单状态：收款完毕，已归档
     */
    public static final String STATUS_VALID = "3";
    /**
     * 订单状态：退货
     */
    public static final String STATUS_RETURNED = "4";

    /**
     * 批发销售单 ID
     */
    @TableId(value = "orders_id", type = IdType.AUTO)
    private Long ordersId;

    /**
     * 客户姓名
     */
    @TableField("customer_name")
    private String customerName;

    /**
     * 客户手机号码
     */
    @TableField("customer_phone")
    private String customerPhone;

    /**
     * 货品 ID
     */
    @TableField("goods_id")
    private Long goodsId;

    /**
     * 货品数量
     */
    @TableField("goods_num")
    private Long goodsNum;

    /**
     * 订单价格
     */
    @TableField("orders_price")
    private Double ordersprice;

    /**
     * 订单已收金额
     */
    @TableField("price_paid")
    private Double pricepaid;

    /**
     * 订单分期数
     */
    @TableField("orders_period")
    private Double ordersperiod;

    /**
     * 状态 0待审核 1审核中 2归档
     */
    @TableField("status")
    private String status;

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 收货地址
     */
    @TableField("orders_address")
    private String ordersaddress;

    /**
     * 发货仓库
     */
    @TableField("storehouse")
    private String storehouse;

    @TableField(exist = false)
    private String createTimeFrom;

    @TableField(exist = false)
    private String createTimeTo;
}
