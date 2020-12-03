package cn.edu.hit.spat.system.service;

import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.system.entity.Record;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * created by meizhimin on 2020/12/3
 */
public interface IRecordService extends IService<Record> {

    /**
     * 通过记录 ID查找记录
     *
     * @param recordId 记录 ID
     * @return 记录
     */
    Record findByRecordId(Long recordId);

    /**
     * 查找记录详细信息
     *
     * @param request request
     * @param record 记录对象，用于传递查询条件
     * @return IPage
     */
    IPage<Record> findRecordDetailList(Record record, QueryRequest request);

    /**
     * 通过 ID查找详细信息
     *
     * @param recordId 记录 ID
     * @return 信息
     */
    Record findRecordDetailList(Long recordId);

    /**
     * 新货品入库
     *
     * @param record
     */
    void createRecord(Record record);

    /**
     * 已有货品入库
     *
     * @param record 记录
     */
    void updateRecord(Record record);

    /**
     * 货品出库
     *
     * @param record 记录
     */
    void outRecord(Record record);
}
