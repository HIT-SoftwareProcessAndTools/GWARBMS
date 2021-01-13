package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author Xuqian
 */
@Data
@TableName("t_retail_goods")
public class RetailGoods implements Serializable{

    private static final long serialVersionUID = -5200596408874170216L;
    /**
     * 零售单ID
     */
    @TableField("order_id")
    private Long orderId;

    /**
     * 商品ID
     */
    @TableField("goods_id")
    private Long goodsId;

    /**
     * 商品数量
     */
    @TableField("number")
    private Long number;

    /**
     * 销售类型，0销售，1赠送，2打折
     */
    @TableField("type")
    private String type;

    /**
     * 折扣系数
     */
    @TableField("discount")
    private Long discount;

    /**
     * 商品名称
     */
    @TableField(exist = false)
    private String goodsName;

    /**
     * 商品价格
     */
    @TableField(exist = false)
    private String retailPrice;
}
