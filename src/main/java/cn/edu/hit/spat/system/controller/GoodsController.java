package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.Role;
import cn.edu.hit.spat.system.service.IGoodsService;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
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
        this.goodsService.updateGoods(goods);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{goodsId}")
    @RequiresPermissions("goods:delete")
    @ControllerEndpoint(operation = "删除货品", exceptionMessage = "删除货品失败")
    public GwarbmsResponse deleteGoodss(@NotBlank(message = "{required}") @PathVariable String goodsId) {
        this.goodsService.deleteGoods(goodsId);
        return new GwarbmsResponse().success();
    }
}
