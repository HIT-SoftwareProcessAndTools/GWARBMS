package cn.edu.hit.spat.system.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * created by meizhimin on 2020/12/4
 */
@Data
public class StorageTrans {
    @TableField(exist = false)
    private Long goodsId;

    @TableField(exist = false)
    private String goodsName;

    @TableField(exist = false)
    private String sourceStorageName;

    @TableField(exist = false)
    private String desStorageName;

    @TableField(exist = false)
    private Long number;

}
