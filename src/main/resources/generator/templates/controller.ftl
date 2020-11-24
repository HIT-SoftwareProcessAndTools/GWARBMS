package cn.edu.hit.spat.system.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;
import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.controller.BaseController;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.entity.QueryRequest;
import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${servicePackage}.I${className}Service;
import com.wuwenze.poi.ExcelKit;
import lombok.extern.slf4j.Slf4j;
import lombok.RequiredArgsConstructor;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * ${tableComment} Controller
 *
 * @author ${author}
 * @date ${date}
 */
@Slf4j
@Validated
@Controller
@RequiredArgsConstructor
public class ${className}Controller extends BaseController {

    private final I${className}Service ${className?uncap_first}Service;

    @GetMapping(GwarbmsConstant.VIEW_PREFIX + "${className?uncap_first}")
    public String ${className?uncap_first}Index(){
        return GwarbmsUtil.view("${className?uncap_first}/${className?uncap_first}");
    }

    @GetMapping("${className?uncap_first}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:list")
    public GwarbmsResponse getAll${className}s(${className} ${className?uncap_first}) {
        return new GwarbmsResponse().success().data(${className?uncap_first}Service.find${className}s(${className?uncap_first}));
    }

    @GetMapping("${className?uncap_first}/list")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:list")
    public GwarbmsResponse ${className?uncap_first}List(QueryRequest request, ${className} ${className?uncap_first}) {
        Map<String, Object> dataTable = getDataTable(this.${className?uncap_first}Service.find${className}s(request, ${className?uncap_first}));
        return new GwarbmsResponse().success().data(dataTable);
    }

    @ControllerEndpoint(operation = "新增${className}", exceptionMessage = "新增${className}失败")
    @PostMapping("${className?uncap_first}")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:add")
    public GwarbmsResponse add${className}(@Valid ${className} ${className?uncap_first}) {
        this.${className?uncap_first}Service.create${className}(${className?uncap_first});
        return new GwarbmsResponse().success();
    }

    @ControllerEndpoint(operation = "删除${className}", exceptionMessage = "删除${className}失败")
    @GetMapping("${className?uncap_first}/delete")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:delete")
    public GwarbmsResponse delete${className}(${className} ${className?uncap_first}) {
        this.${className?uncap_first}Service.delete${className}(${className?uncap_first});
        return new GwarbmsResponse().success();
    }

    @ControllerEndpoint(operation = "修改${className}", exceptionMessage = "修改${className}失败")
    @PostMapping("${className?uncap_first}/update")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:update")
    public GwarbmsResponse update${className}(${className} ${className?uncap_first}) {
        this.${className?uncap_first}Service.update${className}(${className?uncap_first});
        return new GwarbmsResponse().success();
    }

    @ControllerEndpoint(operation = "修改${className}", exceptionMessage = "导出Excel失败")
    @PostMapping("${className?uncap_first}/excel")
    @ResponseBody
    @RequiresPermissions("${className?uncap_first}:export")
    public void export(QueryRequest queryRequest, ${className} ${className?uncap_first}, HttpServletResponse response) {
        List<${className}> ${className?uncap_first}s = this.${className?uncap_first}Service.find${className}s(queryRequest, ${className?uncap_first}).getRecords();
        ExcelKit.$Export(${className}.class, response).downXlsx(${className?uncap_first}s, false);
    }
}
