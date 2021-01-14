package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.system.entity.Customer;
import cn.edu.hit.spat.system.entity.PointsRule;
import cn.edu.hit.spat.system.service.ICustomerService;
import cn.edu.hit.spat.system.service.IPointsRuleService;
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
@RequestMapping("customer")
public class CustomerController extends BaseController {

    private final ICustomerService customerService;
    private final IPointsRuleService pointsRuleService;

    @GetMapping("{customerId}")
    public Customer getCustomer(@NotBlank(message = "{required}") @PathVariable Long customerId) {
//        return this.customerService.findCustomerDetailList(customerId);
        return this.customerService.findByCustomerId(customerId);
    }

    @GetMapping("list")
    @RequiresPermissions("customer:view")
    public GwarbmsResponse customerList(Customer customer, QueryRequest request) {
        Map<String, Object> dataTable = getDataTable(this.customerService.findCustomerDetailList(customer, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @GetMapping("list/{customerName}")
    @RequiresPermissions("customer:view")
    public GwarbmsResponse customerList(@PathVariable String customerName, QueryRequest request) {
        Customer customer = new Customer();
        customer.setName(customerName);
        System.out.println(customerName);
        Map<String, Object> dataTable = getDataTable(this.customerService.findCustomerDetailList(customer, request));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @PostMapping
    @RequiresPermissions("customer:create")
    @ControllerEndpoint(operation = "新增客户", exceptionMessage = "新增客户失败")
    public GwarbmsResponse createCustomer(@Valid Customer customer) {
        customer.setVip("0");
        this.customerService.createCustomer(customer);
        return new GwarbmsResponse().success();
    }

    @GetMapping("delete/{customerIds}")
    @RequiresPermissions("customer:delete")
    @ControllerEndpoint(operation = "删除客户", exceptionMessage = "删除客户失败")
    public GwarbmsResponse deleteCustomers(@NotBlank(message = "{required}") @PathVariable String customerIds) {
        String[] ids = customerIds.split(StringPool.COMMA);
        this.customerService.deleteCustomers(ids);
        return new GwarbmsResponse().success();
    }

    @PostMapping("update")
    @RequiresPermissions("customer:update")
    @ControllerEndpoint(operation = "修改客户", exceptionMessage = "修改客户失败")
    public GwarbmsResponse updateCustomer(@Valid Customer customer) {
        if (customer.getCustomerId() == null) {
            throw new GwarbmsException("客户ID为空");
        }
        this.customerService.updateCustomer(customer);
        return new GwarbmsResponse().success();
    }

    @PostMapping("charge")
    @RequiresPermissions("customer:update")
    @ControllerEndpoint(operation = "会员充值", exceptionMessage = "充值失败")
    public GwarbmsResponse chargeCustomer(@Valid Customer customer) {
        if (customer.getCustomerId() == null) {
            throw new GwarbmsException("客户ID为空");
        }
        this.customerService.chargeCustomer(customer);
        return new GwarbmsResponse().success();
    }

    @PostMapping("exchange")
    @RequiresPermissions("customer:update")
    @ControllerEndpoint(operation = "会员积分兑换", exceptionMessage = "兑换失败")
    public GwarbmsResponse exchangeCustomer(@Valid Customer customer) {
        if (customer.getCustomerId() == null) {
            throw new GwarbmsException("客户ID为空");
        }
        this.customerService.exchangeCustomer(customer);
        return new GwarbmsResponse().success();
    }

    @PostMapping("pointsRule")
    @RequiresPermissions("customer:pointsRule")
    @ControllerEndpoint(operation = "设定积分规则", exceptionMessage = "设定失败")
    public GwarbmsResponse updatePointsRule(@Valid PointsRule pointsRule) {
        if (pointsRule.getPointsRuleId() == null) {
            throw new GwarbmsException("规则ID为空");
        }
        this.pointsRuleService.updatePointsRule(pointsRule);
        return new GwarbmsResponse().success();
    }
}
