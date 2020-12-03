package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Storage;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

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

    // TODO 返回新html，以展示各个仓库包含的内容
    /**
     * 查找货品详细信息
     *
     * @param request request
     * @param storage 货品对象，用于传递查询条件
     * @return IPage
     */
    IPage<Storage> findStorageDetailList(Storage storage, QueryRequest request);
    // TODO
    /**
     * 通过 ID查找详细信息
     *
     * @param storageId 仓库 ID
     * @return 信息
     */
    Storage findStorageDetailList(Long storageId);

    /**
     * 新增
     *
     * @param storage
     */
    void createStorage(Storage storage);

    /**
     * 删除
     * 只允许删除空仓库
     * @param storageId 仓库 id数组
     */
    void deleteStorage(String storageId);

    /**
     * 修改
     *
     * @param storage 仓库
     */
    void updateStorage(Storage storage);

}
