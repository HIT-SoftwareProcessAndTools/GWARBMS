package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Storage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * created by meizhimin on 2020/12/2
 */
public interface IStorageService extends IService<Storage> {

    /**
     * 通过仓库 ID查找仓库
     *
     * @param storageId 仓库 ID
     * @return 仓库
     */
    Storage findByStorageId(Long storageId);

    /**
     * 查找仓库详细信息
     *
     * @param request request
     * @param storage 仓库对象，用于传递查询条件
     * @return IPage
     */
    IPage<Storage> findStorageDetailList(Storage storage, QueryRequest request);
    /**
     * 查找仓库详细信息
     *
     */
    List<Storage> findAllStorage();

    /**
     * 通过传递查询条件查找详细信息
     *
     * @param storage 仓库 ID
     * @return 信息
     */
    List<Storage> findStorageList(Storage storage);

    /**
     * 新增
     *
     * @param storage
     */
    void createStorage(Storage storage);

    /**
     * 删除
     * 只允许删除空仓库
     * @param storageIds 仓库 id数组
     */
    void deleteStorage(String[] storageIds);

    /**
     * 修改
     *
     * @param storage 仓库
     */
    void updateStorage(Storage storage);

}
