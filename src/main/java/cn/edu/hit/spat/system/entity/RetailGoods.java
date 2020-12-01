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


}
