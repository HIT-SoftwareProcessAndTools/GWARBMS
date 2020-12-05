package cn.edu.hit.spat.monitor.controller;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author MrBird
 */
@Controller("monitorView")
@RequestMapping(GwarbmsConstant.VIEW_PREFIX + "monitor")
@RequiredArgsConstructor
public class ViewController {

    @GetMapping("online")
    @RequiresPermissions("online:view")
    public String online() {
        return GwarbmsUtil.view("monitor/online");
    }

}
