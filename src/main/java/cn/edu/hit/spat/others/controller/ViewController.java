package cn.edu.hit.spat.others.controller;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author MrBird
 */
@Controller("othersView")
@RequestMapping(GwarbmsConstant.VIEW_PREFIX + "others")
public class ViewController {

    @GetMapping("gwarbms/form")
    @RequiresPermissions("gwarbms:form:view")
    public String gwarbmsForm() {
        return GwarbmsUtil.view("others/gwarbms/form");
    }

    @GetMapping("gwarbms/form/group")
    @RequiresPermissions("gwarbms:formgroup:view")
    public String gwarbmsFormGroup() {
        return GwarbmsUtil.view("others/gwarbms/formGroup");
    }

    @GetMapping("gwarbms/tools")
    @RequiresPermissions("gwarbms:tools:view")
    public String gwarbmsTools() {
        return GwarbmsUtil.view("others/gwarbms/tools");
    }

    @GetMapping("gwarbms/icon")
    @RequiresPermissions("gwarbms:icons:view")
    public String gwarbmsIcon() {
        return GwarbmsUtil.view("others/gwarbms/icon");
    }

    @GetMapping("gwarbms/others")
    @RequiresPermissions("others:gwarbms:others")
    public String gwarbmsOthers() {
        return GwarbmsUtil.view("others/gwarbms/others");
    }

    @GetMapping("apex/line")
    @RequiresPermissions("apex:line:view")
    public String apexLine() {
        return GwarbmsUtil.view("others/apex/line");
    }

    @GetMapping("apex/area")
    @RequiresPermissions("apex:area:view")
    public String apexArea() {
        return GwarbmsUtil.view("others/apex/area");
    }

    @GetMapping("apex/column")
    @RequiresPermissions("apex:column:view")
    public String apexColumn() {
        return GwarbmsUtil.view("others/apex/column");
    }

    @GetMapping("apex/radar")
    @RequiresPermissions("apex:radar:view")
    public String apexRadar() {
        return GwarbmsUtil.view("others/apex/radar");
    }

    @GetMapping("apex/bar")
    @RequiresPermissions("apex:bar:view")
    public String apexBar() {
        return GwarbmsUtil.view("others/apex/bar");
    }

    @GetMapping("apex/mix")
    @RequiresPermissions("apex:mix:view")
    public String apexMix() {
        return GwarbmsUtil.view("others/apex/mix");
    }

    @GetMapping("map")
    @RequiresPermissions("map:view")
    public String map() {
        return GwarbmsUtil.view("others/map/gaodeMap");
    }

    @GetMapping("eximport")
    @RequiresPermissions("others:eximport:view")
    public String eximport() {
        return GwarbmsUtil.view("others/eximport/eximport");
    }

    @GetMapping("eximport/result")
    public String eximportResult() {
        return GwarbmsUtil.view("others/eximport/eximportResult");
    }

    @GetMapping("datapermission")
    public String dataPermissionTest() {
        return GwarbmsUtil.view("others/datapermission/test");
    }
}
