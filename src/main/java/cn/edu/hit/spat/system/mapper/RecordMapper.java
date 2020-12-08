package cn.edu.hit.spat.system.mapper;

import cn.edu.hit.spat.system.entity.GoodsDetail;
import cn.edu.hit.spat.system.entity.Record;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * created by meizhimin on 2020/12/3
 */
public interface RecordMapper extends BaseMapper<Record> {
    /**
     * 通过记录ID查找记录
     *
     * @param recordId
     * @return
     */
    Record findByRecordId(Long recordId);

    /**
     * 查找记录详细信息
     *
     * @param page 分页对象
     * @param record 记录对象，用于传递查询条件
     * @return Ipage
     */
    <T> IPage<Record> findRecordDetailPage(Page<T> page, @Param("record") Record record);

    long countRecordDetail(@Param("record") Record record);

    /**
     * 查找记录详细信息
     *
     * @param record 记录对象，用于传递查询条件
     * @return List<Record>
     */
    List<Record> findRecordDetail(@Param("record") Record record);

    /**
     * 根据商品ID查找记录
     * @param goodsId
     * @return
     */
    Record findByGoods(Long goodsId);

    /**
     * 根据商品和仓库查找记录
     * @param goodsId
     * @return
     */
    Record findByGoodsandStorage(Long goodsId,String storage);

    /**
     * 查找仓库详细信息
     *
     * @param storageId  仓库ID，用于传递查询条件
     * @return List<Record>
     */
    List<Record> findByStorageId(Long storageId);
}
