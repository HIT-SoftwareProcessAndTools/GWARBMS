package cn.edu.hit.spat.system.service.impl;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.utils.SortUtil;
import cn.edu.hit.spat.system.entity.Record;
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
    public Record findRecordDetailList(Long recordId) {
        Record param = new Record();
        param.setRecordId(recordId);
        List<Record> orders = this.baseMapper.findRecordDetail(param);
        return CollectionUtils.isNotEmpty(orders) ? orders.get(0) : null;
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

}
