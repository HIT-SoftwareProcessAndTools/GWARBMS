package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @author XuJian
 */
@Data
@TableName("t_goods_detail")
public class GoodsDetail {
    /**
     * 货品属性记录 ID
     */
    @TableId(value = "GOODS_DETAIL_ID", type = IdType.AUTO)
    private Long goodsDetailId;

    /**
     * 货品ID
     */
    @TableField("GOODS_ID")
    private Long goodsId;

    /**
     * 属性名
     */
    @TableField("GOODS_ATTRIBUTE")
    private String goodsAttribute;

    /**
     * 属性值
     */
    @TableField("GOODS_ATTRIBUTE_VALUE")
    private String goodsAttributeValue;

    public Long getId() {
        return goodsDetailId;
    }
}
