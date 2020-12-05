package cn.edu.hit.spat.others.controller;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author XuJian
 */
@Controller("othersView")
@RequestMapping(GwarbmsConstant.VIEW_PREFIX + "others")
public class ViewController {
    @GetMapping("icon")
    public String gwarbmsIcon() {
        return GwarbmsUtil.view("others/icon");
    }
}
