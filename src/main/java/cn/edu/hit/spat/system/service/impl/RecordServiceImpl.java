package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.utils.Md5Util;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.*;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.mapper.RecordMapper;
import cn.edu.hit.spat.system.service.IRecordService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * created by meizhimin on 2020/12/3
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class RecordServiceImpl extends ServiceImpl<RecordMapper, Record> implements IRecordService {
    private final GoodsServiceImpl goodsService;

    @Override
    public Record findByRecordId(Long recordId) {
        return this.baseMapper.findByRecordId(recordId);
    }
    @Override
    public Record findByGoods(Long goodsId) {
        return this.baseMapper.findByGoods(goodsId);
    }

    @Override
    public List<Record> findByStorageId(Long storageId) {
        List<Record> records = this.baseMapper.findByStorageId(storageId);
        return CollectionUtils.isNotEmpty(records) ? records : null;
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
    public void resetbyGoodsId(String[] goodsIds){
        Arrays.stream(goodsIds).forEach(goodsId -> {
            Record record = new Record();
            record.setGoodsId(Long.valueOf(goodsId));
            List<Record> records = this.baseMapper.findRecordDetail(record);
//            Record rec = this.baseMapper.findByGoods(Long.valueOf(goodsId));
            for (Record rec: records) {
                if (rec.getStorageId() == 1) {
                    Long i = rec.getNumber() - 1;
                    rec.setNumber(i);
//                    this.baseMapper.update(rec, new LambdaQueryWrapper<Record>().eq(Record::getGoodsId, Long.valueOf(goodsId)));
                    updateById(rec);
                }
            }
        });
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int resetbyGoodsIdandStorage(Long goodsId,String storage,Long num){
        Record rec = this.baseMapper.findByGoodsandStorage(goodsId,storage);
        if(rec.getNumber()<num)
            return 0;
        Long i=rec.getNumber()-num;
        rec.setNumber(i);
        updateRecord(rec);
        return 1;
    }

    @Override
    public void computerValue() {
        Record record = new Record();
        List<Record> recordList = this.findRecordList(record);
        for(Record x : recordList){
            Long goodsId = x.getGoodsId();
            Double price;
            Goods tarGoods = goodsService.findByGoodsId(goodsId);
            price = tarGoods.getPurchasePrice();
            x.setValue(price*x.getNumber());
            updateById(x);
        }
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
            desRecord.setValue(0.0);
            createRecord(desRecord);
            updateById(sourceRecord);
        }
    }

    @Override
    public void deleteRecord(Record record) {
        this.removeById(record.getId());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRecordByStorageIds(String[] storageIds) {
        List<String> list = new ArrayList<>();
        for (String storageId: storageIds){
            List<Record> records = this.findByStorageId(Long.parseLong(storageId));
            if (records == null){
                continue;
            }
            for (Record record: records){
                list.add(record.getRecordId().toString());
            }
        }
        this.removeByIds(list);
    }
}
