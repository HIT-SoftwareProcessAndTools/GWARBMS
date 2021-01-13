package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.wuwenze.poi.annotation.ExcelField;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author XuQian
 * 零售销售单表
 */
@Data
@TableName("t_order_retail")
public class Order implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;

    /**
     * 零售销售单 ID
     */
    @TableId(value = "order_id", type = IdType.AUTO)
    private Long orderId;


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
     * 零售销售单价格
     */
    @TableField("order_price")
    private Double orderPrice;

    /**
     * 订单商品项
     */
    @TableField(exist = false)
    private List<RetailGoods> retailGoodsList;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    @TableField(exist = false)
    private String createTimeFrom;

    @TableField(exist = false)
    private String createTimeTo;

    public Long getId() {
        return orderId;
    }

}
