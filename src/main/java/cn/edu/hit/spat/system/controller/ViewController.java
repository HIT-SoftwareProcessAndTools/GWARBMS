package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.authentication.ShiroHelper;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.utils.DateUtil;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;

import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.Goods;
import cn.edu.hit.spat.system.entity.GoodsDetail;
import cn.edu.hit.spat.system.entity.User;
import cn.edu.hit.spat.system.service.*;

import cn.edu.hit.spat.system.entity.*;

import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author XuJian
 */
@Controller("systemView")
@RequiredArgsConstructor
public class ViewController extends BaseController {

    private final IUserService userService;
    private final ShiroHelper shiroHelper;
    private final IUserDataPermissionService userDataPermissionService;
    /* 新增数据 */
    private final ICustomerService customerService;
    private final IOrdersService ordersService;

    private final IGoodsService goodsService;
    private final IGoodsDetailService goodsDetailService;

    private final IStorageService storageService;
    private final IRecordService recordService;

    @GetMapping("login")
    @ResponseBody
    public Object login(HttpServletRequest request) {
        if (GwarbmsUtil.isAjaxRequest(request)) {
            throw new ExpiredSessionException();
        } else {
            ModelAndView mav = new ModelAndView();
            mav.setViewName(GwarbmsUtil.view("login"));
            return mav;
        }
    }

    @GetMapping("unauthorized")
    public String unauthorized() {
        return GwarbmsUtil.view("error/403");
    }


    @GetMapping("/")
    public String redirectIndex() {
        return "redirect:/index";
    }

    @GetMapping("index")
    public String index(Model model) {
        AuthorizationInfo authorizationInfo = shiroHelper.getCurrentUserAuthorizationInfo();
        User user = super.getCurrentUser();
        User currentUserDetail = userService.findByName(user.getUsername());
        currentUserDetail.setPassword("It's a secret");
        model.addAttribute("user", currentUserDetail);
        model.addAttribute("permissions", authorizationInfo.getStringPermissions());
        model.addAttribute("roles", authorizationInfo.getRoles());
        return "index";
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "layout")
    public String layout() {
        return GwarbmsUtil.view("layout");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "password/update")
    public String passwordUpdate() {
        return GwarbmsUtil.view("system/user/passwordUpdate");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "user/profile")
    public String userProfile() {
        return GwarbmsUtil.view("system/user/userProfile");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "user/avatar")
    public String userAvatar() {
        return GwarbmsUtil.view("system/user/avatar");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "user/profile/update")
    public String profileUpdate() {
        return GwarbmsUtil.view("system/user/profileUpdate");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/user")
    @RequiresPermissions("user:view")
    public String systemUser() {
        return GwarbmsUtil.view("system/user/user");
    }

    /**
     * Modified functions=================================================================================
     * @return
     */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/order")
    @RequiresPermissions("order:view")
    public String systemOrder() {
        return GwarbmsUtil.view("system/order/order");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/order/retail")
    @RequiresPermissions("order:retail")
    public String systemOrderCreate() {
        return GwarbmsUtil.view("system/order/orderCreate");
    }

    /**
     * orders function
     * @author Daijiajia
     */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/order/wholesale")
    @RequiresPermissions("orders:view")
    public String systemOrders() {
        return GwarbmsUtil.view("system/orders/orders");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/order/wholesale/create")
    @RequiresPermissions("orders:create")
    public String systemOrdersCreate() {
        return GwarbmsUtil.view("system/orders/ordersCreate");
    }

    /* 批发销售单详情 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/orders/detail/{ordersId}")
    @RequiresPermissions("orders:view")
    public String systemOrdersDetail(@PathVariable Long ordersId, Model model) {
        resolveOrdersModel(ordersId, model);
        return GwarbmsUtil.view("system/orders/ordersDetail");
    }

    /* 修改批发销售单 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/orders/update/{ordersId}")
    @RequiresPermissions("orders:update")
    public String systemOrdersUpdate(@PathVariable Long ordersId, Model model) {
        resolveOrdersModel(ordersId, model);
        return GwarbmsUtil.view("system/orders/ordersUpdate");
    }

    private void resolveOrdersModel(Long ordersId, Model model) {
        Orders orders = this.ordersService.findById(ordersId);
        model.addAttribute("orders", orders);
    }
    /**
     * =====================================================================================================
     * @return
     */

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/user/add")
    @RequiresPermissions("user:add")
    public String systemUserAdd() {
        return GwarbmsUtil.view("system/user/userAdd");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/user/detail/{username}")
    @RequiresPermissions("user:view")
    public String systemUserDetail(@PathVariable String username, Model model) {
        resolveUserModel(username, model, true);
        return GwarbmsUtil.view("system/user/userDetail");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/user/update/{username}")
    @RequiresPermissions("user:update")
    public String systemUserUpdate(@PathVariable String username, Model model) {
        resolveUserModel(username, model, false);
        return GwarbmsUtil.view("system/user/userUpdate");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/role")
    @RequiresPermissions("role:view")
    public String systemRole() {
        return GwarbmsUtil.view("system/role/role");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/menu")
    @RequiresPermissions("menu:view")
    public String systemMenu() {
        return GwarbmsUtil.view("system/menu/menu");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/dept")
    @RequiresPermissions("dept:view")
    public String systemDept() {
        return GwarbmsUtil.view("system/dept/dept");
    }

    @RequestMapping(GwarbmsConstant.VIEW_PREFIX + "index")
    public String pageIndex() {
        return GwarbmsUtil.view("index");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "404")
    public String error404() {
        return GwarbmsUtil.view("error/404");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "403")
    public String error403() {
        return GwarbmsUtil.view("error/403");
    }

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "500")
    public String error500() {
        return GwarbmsUtil.view("error/500");
    }

    private void resolveUserModel(String username, Model model, Boolean transform) {
        User user = userService.findByName(username);
        String deptIds = userDataPermissionService.findByUserId(String.valueOf(user.getUserId()));
        user.setDeptIds(deptIds);
        model.addAttribute("user", user);
        if (transform) {
            String sex = user.getSex();
            if (User.SEX_MALE.equals(sex)) {
                user.setSex("男");
            } else if (User.SEX_FEMALE.equals(sex)) {
                user.setSex("女");
            } else {
                user.setSex("保密");
            }
        }
        if (user.getLastLoginTime() != null) {
            model.addAttribute("lastLoginTime", DateUtil.getDateFormat(user.getLastLoginTime(), DateUtil.FULL_TIME_SPLIT_PATTERN));
        }
    }

    /**
     * customer function======================================================================================
     * @author XuJian
     */
    /* 客户管理 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/customer")
    @RequiresPermissions("customer:view")
    public String systemCustomer() {
        return GwarbmsUtil.view("system/customer/customer");
    }

    /* 新增客户 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/customer/create")
    @RequiresPermissions("customer:create")
    public String systemCustomerCreate() {
        return GwarbmsUtil.view("system/customer/customerCreate");
    }

    /* 客户详情 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/customer/detail/{customerId}")
    @RequiresPermissions("customer:view")
    public String systemCustomerDetail(@PathVariable Long customerId, Model model) {
        resolveCustomerModel(customerId, model);
        return GwarbmsUtil.view("system/customer/customerDetail");
    }

    /* 修改客户 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/customer/update/{customerId}")
    @RequiresPermissions("customer:update")
    public String systemCustomerUpdate(@PathVariable Long customerId, Model model) {
        resolveCustomerModel(customerId, model);
        return GwarbmsUtil.view("system/customer/customerUpdate");
    }

    private void resolveCustomerModel(Long customerId, Model model) {
        Customer customer = this.customerService.findByCustomerId(customerId);
        model.addAttribute("customer", customer);
    }

    /**
     * goods function======================================================================================
     * @author XuJian
     */
    /* 货品管理 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods")
    @RequiresPermissions("goods:view")
    public String systemGoods() {
        return GwarbmsUtil.view("system/goods/goods");
    }

    /* 新增货品 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods/create")
    @RequiresPermissions("goods:create")
    public String systemGoodsCreate() {
        return GwarbmsUtil.view("system/goods/goodsCreate");
    }

    /* 货品详情 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods/detail/{goodsId}")
    @RequiresPermissions("goods:view")
    public String systemGoodsDetail(@PathVariable Long goodsId, Model model) {
        resolveGoodsWithDetailModel(goodsId, model);
        return GwarbmsUtil.view("system/goods/goodsDetail");
    }

    /* 修改货品 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods/update/{goodsId}")
    @RequiresPermissions("goods:update")
    public String systemGoodsUpdate(@PathVariable Long goodsId, Model model) {
        resolveGoodsModel(goodsId, model);
        return GwarbmsUtil.view("system/goods/goodsUpdate");
    }

    /* 新增货品属性 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods/detailCreate/{goodsId}")
    @RequiresPermissions("goods:create")
    public String systemGoodsAddAttribute(@PathVariable Long goodsId, Model model) {
        resolveGoodsModel(goodsId, model);
        return GwarbmsUtil.view("system/goods/goodsDetailCreate");
    }

    /* 修改货品属性 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/goods/detailUpdate/{goodsDetailId}")
    @RequiresPermissions("goods:update")
    public String systemGoodsDetailUpdate(@PathVariable Long goodsDetailId, Model model) {
        resolveGoodsDetailModel(goodsDetailId, model);
        return GwarbmsUtil.view("system/goods/goodsDetailUpdate");
    }

    private void resolveGoodsDetailModel(Long goodsDetailId, Model model) {
        GoodsDetail goodsDetail = this.goodsDetailService.findByDetailId(goodsDetailId);
        model.addAttribute("goodsDetail", goodsDetail);
    }

    private void resolveGoodsModel(Long goodsId, Model model) {
        Goods goods = this.goodsService.findByGoodsId(goodsId);
        model.addAttribute("goods", goods);
    }

    private void resolveGoodsWithDetailModel(Long goodsId, Model model) {
        Goods goods = this.goodsService.findByGoodsId(goodsId);
        goods.setDetailList(this.goodsDetailService.findByGoodsId(goodsId));
        model.addAttribute("goods", goods);
    }

    /**
     * storage function=============================================================================================
     * @author meizhimin
     */
    /* 仓库总览 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/storage")
    @RequiresPermissions("storage:view")
    public String systemStorage() {
        return GwarbmsUtil.view("system/storage/storage");
    }

    /* 新增仓库 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/storage/create")
    @RequiresPermissions("storage:create")
    public String systemStorageCreate() {
        return GwarbmsUtil.view("system/storage/storageCreate");
    }

    /* 仓库详情 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/storage/detail/{storageId}")
    @RequiresPermissions("storage:view")
    public String systemStorageDetail(@PathVariable Long storageId, Model model) {
        resolveStorageModel(storageId, model);
        return GwarbmsUtil.view("system/storage/storageDetail");
    }

    /* 修改仓库*/
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/storage/update/{storageId}")
    @RequiresPermissions("storage:update")
    public String systemStorageUpdate(@PathVariable Long storageId, Model model) {
        resolveStorageModel(storageId, model);
        return GwarbmsUtil.view("system/storage/storageUpdate");
    }

    private void resolveStorageModel(Long storageId, Model model) {
        Storage storage = this.storageService.findByStorageId(storageId);
        model.addAttribute("storage", storage);
    }

    /**
     * record function=============================================================================================
     * @author meizhimin
     */
    /* 库存记录 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/record")
    @RequiresPermissions("record:view")
    public String systemRecord() {
        return GwarbmsUtil.view("system/record/record");
    }

    /* 新货品入库 */
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/record/create")
    @RequiresPermissions("record:create")
    public String systemRecordCreate() {
        return GwarbmsUtil.view("system/record/recordCreate");
    }

    /* 已有货品入库*/
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/record/update/{recordId}")
    @RequiresPermissions("record:update")
    public String systemRecordUpdate(@PathVariable Long recordId, Model model) {
        resolveRecordModel(recordId, model);
        return GwarbmsUtil.view("system/record/recordUpdate");
    }

    /* 货品出库*/
    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "system/record/out/{recordId}")
    @RequiresPermissions("record:out")
    public String systemRecordOut(@PathVariable Long recordId, Model model) {
        resolveRecordModel(recordId, model);
        return GwarbmsUtil.view("system/record/recordOut");
    }

    private void resolveRecordModel(Long recordId, Model model) {
        Record record = this.recordService.findByRecordId(recordId);
        model.addAttribute("record", record);
    }
}
