package cn.edu.hit.spat.others.mapper;

import cn.edu.hit.spat.common.annotation.DataPermission;
import cn.edu.hit.spat.others.entity.DataPermissionTest;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * @author MrBird
 */
@DataPermission(methods = {"selectPage"})
public interface DataPermissionTestMapper extends BaseMapper<DataPermissionTest> {

}
