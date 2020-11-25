package cn.edu.hit.spat.generator.controller;

import cn.edu.hit.spat.common.entity.GwarbmsConstant;
import cn.edu.hit.spat.common.utils.GwarbmsUtil;
import cn.edu.hit.spat.generator.entity.GeneratorConfig;
import cn.edu.hit.spat.generator.service.IGeneratorConfigService;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author XuJian
 */
@Controller("generatorViews")
@RequestMapping(GwarbmsConstant.VIEW_PREFIX + "generator")
@RequiredArgsConstructor
public class ViewController {

    private final IGeneratorConfigService generatorConfigService;

    @GetMapping("generator")
    @RequiresPermissions("generator:view")
    public String generator() {
        return GwarbmsUtil.view("generator/generator");
    }

    @GetMapping("configure")
    @RequiresPermissions("generator:configure:view")
    public String generatorConfigure(Model model) {
        GeneratorConfig generatorConfig = generatorConfigService.findGeneratorConfig();
        model.addAttribute("config", generatorConfig);
        return GwarbmsUtil.view("generator/configure");
    }
}
