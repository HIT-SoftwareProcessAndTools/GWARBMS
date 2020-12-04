package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.entity.Storage;
import cn.edu.hit.spat.system.entity.StorageTrans;
import cn.edu.hit.spat.system.mapper.RecordMapper;
import cn.edu.hit.spat.system.service.IRecordService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * created by meizhimin on 2020/12/3
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class RecordServiceImpl extends ServiceImpl<RecordMapper, Record> implements IRecordService {

    @Override
    public Record findByRecordId(Long recordId) {
        return this.baseMapper.findByRecordId(recordId);
    }

    @Override
    public IPage<Record> findRecordDetailList(Record record, QueryRequest request) {
        Page<Record> page = new Page<>(request.getPageNum(), request.getPageSize());
        page.setSearchCount(false);
        page.setTotal(baseMapper.countRecordDetail(record));
        SortUtil.handlePageSort(request, page, "recordId", GwarbmsConstant.ORDER_ASC, false);
        return this.baseMapper.findRecordDetailPage(page, record);
    }

    @Override
    public List<Record> findRecordList(Record record) {
        return this.baseMapper.findRecordDetail(record);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createRecord(Record record) {
        save(record);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRecord(Record record) {
        updateById(record);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void outRecord(Record record) {
        updateById(record);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void transRecord(StorageTrans storageTrans, Long desStorageId) {
        Long number  = storageTrans.getNumber();
        Record sourceRecord = new Record();
        Record desRecord = new Record();
        sourceRecord.setGoodsId(storageTrans.getGoodsId());
        sourceRecord.setStorageName(storageTrans.getSourceStorageName());
        sourceRecord.setGoodsName(storageTrans.getGoodsName());
        desRecord.setGoodsName(storageTrans.getGoodsName());
        desRecord.setGoodsId(storageTrans.getGoodsId());
        desRecord.setStorageName(storageTrans.getDesStorageName());

        List<Record> sourceList = this.baseMapper.findRecordDetail(sourceRecord);
        if (CollectionUtils.isNotEmpty(sourceList) ){
            sourceRecord = sourceList.get(0);
            sourceRecord.setNumber(sourceRecord.getNumber()- number);
        }else{
            throw new GwarbmsException("源记录不存在！");
        }

        List<Record> desList = this.baseMapper.findRecordDetail(desRecord);
        if (CollectionUtils.isNotEmpty(desList) ){
            desRecord = desList.get(0);
            desRecord.setNumber(desRecord.getNumber() + number);
            updateById(desRecord);
            updateById(sourceRecord);
        }else{
            desRecord.setNumber(number);
            desRecord.setStorageId(desStorageId);
            createRecord(desRecord);
            updateById(sourceRecord);
        }
    }
}
