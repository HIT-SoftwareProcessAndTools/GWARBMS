package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.Storage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * created by meizhimin on 2020/12/2
 */
public interface StorageMapper extends BaseMapper<Storage> {

    /**
     * 通过仓库ID查找仓库
     *
     * @param storageId
     * @return
     */
    Storage findByStorageId(Long storageId);

    /**
     * 通过仓库名查找仓库
     *
     * @param storageName
     * @return
     */
    Storage findByStorageName(String storageName);
    
    /**
     * 查找仓库详细信息
     *
     * @param page 分页对象
     * @param storage 仓库对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Storage> findStorageDetailPage(Page<T> page, @Param("storage") Storage storage);

    long countStorageDetail(@Param("storage") Storage storage);

    /**
     * 查找仓库详细信息
     *
     * @param storage 仓库对象，用于传递查询条件
     * @return List<Storage>
     */
    List<Storage> findStorageDetail(@Param("storage") Storage storage);

    /**
     * 查找仓库详细信息--精确查找
     *
     * @param storage 仓库对象，用于传递查询条件
     * @return List<Storage>
     */
    List<Storage> findExactStorageDetail(@Param("storage") Storage storage);

    /**
     * 查找仓库详细信息--模糊查找
     *
     * @param storage 仓库对象，用于传递查询条件
     * @return List<Storage>
     */
    List<Storage> findStoragesDetail(@Param("storage") Storage storage);
}
