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
@TableName("t_storage")
public class Storage implements Serializable {

    private static final long serialVersionUID = -4352868070794165001L;
    /**
     * 仓库 ID
     */
    @TableId(value = "storage_id", type = IdType.AUTO)
    private Long storageId;

    /**
     * 仓库名
     */
    @TableField("storage_name")
    private String storageName;


    public Long getId() {
        return storageId;
    }
}
