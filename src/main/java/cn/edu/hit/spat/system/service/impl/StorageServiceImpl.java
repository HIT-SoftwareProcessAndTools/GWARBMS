package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.mapper.StorageMapper;
import cn.edu.hit.spat.system.service.IStorageService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * created by meizhimin on 2020/12/2
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class StorageServiceImpl extends ServiceImpl<StorageMapper, Storage> implements IStorageService {

    @Override
    public Storage findByStorageId(Long storageId) {
        return this.baseMapper.findByStorageId(storageId);
    }

    @Override
    public IPage<Storage> findStorageDetailList(Storage storage, QueryRequest request) {
        Page<Storage> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countStorageDetail(storage));
        SortUtil.handlePageSort(request, page, "storageId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findStorageDetailPage(page, storage);
    }
    @Override
    public List<Storage> findAllStorage() {
        return this.baseMapper.findStorageDetail(new Storage());
    }
    @Override
    public List<Storage> findStorageList(Storage storage) {
        return this.baseMapper.findStorageDetail(storage);
    }
    
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createStorage(Storage storage) {
        save(storage);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteStorage(String[] storageIds) {
        List<String> list = Arrays.asList(storageIds);
        this.removeByIds(list);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateStorage(Storage storage) {
        updateById(storage);
    }

}

