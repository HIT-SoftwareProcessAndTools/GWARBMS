package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * created by meizhimin on 2020/12/2
 */
@Data
@TableName("t_storage_goods")
public class Record implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;
    /**
     * 记录 ID
     */
    @TableId(value = "record_id", type = IdType.AUTO)
    private Long recordId;

    /**
     * 仓库 ID
     */
    @TableField("storage_id")
    private Long storageId;

    /**
     * 仓库名
     */
    @TableField("storage_name")
    private String storageName;

    /**
     * 货品 ID
     */
    @TableField("goods_id")
    private Long goodsId;

    /**
     * 货品名
     */
    @TableField("goods_name")
    private String goodsName;

    /**
     * 货品的库存数量
     */
    @TableField("number")
    private Long number;

    public Long getId() {
        return recordId;
    }
}
