package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Goods;

import cn.edu.hit.spat.system.entity.GoodsDetail;
import cn.edu.hit.spat.system.entity.Record;
import cn.edu.hit.spat.system.service.IGoodsDetailService;

import cn.edu.hit.spat.system.service.IGoodsService;
import cn.edu.hit.spat.system.service.IRecordService;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * @author XuJian
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("goods")
public class GoodsController extends BaseController {

    private final IGoodsService goodsService;
    private final IGoodsDetailService goodsDetailService;
    private final IRecordService recordService;

    @GetMapping
    public GwarbmsResponse getAllGoods(Goods goods) {
        return new GwarbmsResponse().success().data(goodsService.findGoods(goods));
    }


    @GetMapping("{goodsId}")
    public Goods getGoods(@NotBlank(message = "{required}") @PathVariable Long goodsId) {
        return this.goodsService.findGoodsDetailList(goodsId);
    }

    @GetMapping("list")
    @RequiresPermissions("goods:view")
    public GwarbmsResponse goodsList(Goods goods, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.goodsService.findGoodsDetailList(goods, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("goods:create")
    @ControllerEndpoint(operation = "新增货品", exceptionMessage = "新增货品失败")
    public GwarbmsResponse createGoods(@Valid Goods goods) {
//        Goods tar = new Goods();
//        tar.setName(goods.getName());
//        // 查询货品名是否已经存在
//        List<Goods> goodsList = this.goodsService.findGoods(tar);
//        if(CollectionUtils.isNotEmpty(goodsList)){
//            throw new GwarbmsException("该货品名已经存在，请重新输入！");
//        }
        this.goodsService.createGoods(goods);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("goods:update")
    @ControllerEndpoint(operation = "修改货品", exceptionMessage = "修改货品失败")
    public GwarbmsResponse updateGoods(@Valid Goods goods) {
        if (goods.getGoodsId() == null) {
            throw new GwarbmsException("货品ID为空");
        }
//        // 查询货品名是否已经存在
//        List<Goods> goodsList = this.goodsService.findByName(goods.getName());
//        if(CollectionUtils.isNotEmpty(goodsList)){
//            throw new GwarbmsException("该货品名已经存在，请重新输入！");
//        }
        // 更新货品信息
        this.goodsService.updateGoods(goods);
        // 更新对应的record信息
        Record record = new Record();
        record.setGoodsId(goods.getId());
        List<Record> recordList = this.recordService.findRecordList(record);
        for(Record x : recordList){
            x.setGoodsName(goods.getName());
            this.recordService.updateRecord(x);
        }
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{goodsIds}")
    @RequiresPermissions("goods:delete")
    @ControllerEndpoint(operation = "删除货品", exceptionMessage = "删除货品失败")
    public GwarbmsResponse deleteGoods(@NotBlank(message = "{required}") @PathVariable String goodsIds) {
        String[] ids = goodsIds.split(StringPool.COMMA);
        this.goodsService.deleteGoods(ids);
        this.goodsDetailService.deleteGoodsDetailByGoodsIds(ids);
        return new GwarbmsResponse().success();
    }

    @GetMapping("detailList/{goodsId}")
    @RequiresPermissions("goods:view")
    public GwarbmsResponse goodsDetailList(@NotBlank(message = "{required}") @PathVariable String goodsId, QueryRequest request) {
        GoodsDetail goodsDetail = new GoodsDetail();
        goodsDetail.setGoodsId(Long.parseLong(goodsId));
        Map<String, Object> dataTable = getDataTable(this.goodsDetailService.findGoodsDetailList(goodsDetail, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping("detailCreate")
    @RequiresPermissions("goods:create")
    @ControllerEndpoint(operation = "添加货品属性", exceptionMessage = "添加属性失败")
    public GwarbmsResponse createGoodsDetail(@Valid GoodsDetail goodsDetail) {
        this.goodsDetailService.createGoodsDetail(goodsDetail);
        return new GwarbmsResponse().success();
    }

    @PostMapping("detailUpdate")
    @RequiresPermissions("goods:update")
    @ControllerEndpoint(operation = "修改货品属性", exceptionMessage = "修改货品属性失败")
    public GwarbmsResponse updateGoodsDetail(@Valid GoodsDetail goodsDetail) {
        if (goodsDetail.getGoodsDetailId() == null) {
            throw new GwarbmsException("货品属性ID为空");
        }
        this.goodsDetailService.updateGoodsDetail(goodsDetail);
        return new GwarbmsResponse().success();
    }

    @GetMapping("detailDelete/{goodsDetailId}")
    @RequiresPermissions("goods:delete")
    @ControllerEndpoint(operation = "删除货品属性", exceptionMessage = "删除货品属性失败")
    public GwarbmsResponse deleteGoodsDetail(@NotBlank(message = "{required}") @PathVariable String goodsDetailId) {
        this.goodsDetailService.deleteGoodsDetail(goodsDetailId.split(StringPool.COMMA));
        return new GwarbmsResponse().success();
    }
}
