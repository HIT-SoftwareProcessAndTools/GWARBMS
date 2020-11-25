package cn.edu.hit.spat.monitor.controller;

import cn.edu.hit.spat.common.annotation.ControllerEndpoint;
import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.utils.DateUtil;
import cn.edu.hit.spat.monitor.endpoint.GwarbmsHttpTraceEndpoint;
import cn.edu.hit.spat.monitor.entity.GwarbmsHttpTrace;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.boot.actuate.trace.http.HttpTrace;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static cn.edu.hit.spat.monitor.endpoint.GwarbmsHttpTraceEndpoint.GwarbmsHttpTraceDescriptor;

/**
 * @author XuJian
 */
@Slf4j
@RestController
@RequestMapping("gwarbms/actuator")
@RequiredArgsConstructor
public class GwarbmsActuatorController {

    private final GwarbmsHttpTraceEndpoint httpTraceEndpoint;

    @GetMapping("httptrace")
    @RequiresPermissions("httptrace:view")
    @ControllerEndpoint(exceptionMessage = "请求追踪失败")
    public GwarbmsResponse httpTraces(String method, String url) {
        GwarbmsHttpTraceDescriptor traces = httpTraceEndpoint.traces();
        List<HttpTrace> httpTraceList = traces.getTraces();
        List<GwarbmsHttpTrace> gwarbmsHttpTraces = new ArrayList<>();
        httpTraceList.forEach(t -> {
            GwarbmsHttpTrace gwarbmsHttpTrace = new GwarbmsHttpTrace();
            gwarbmsHttpTrace.setRequestTime(DateUtil.formatInstant(t.getTimestamp(), DateUtil.FULL_TIME_SPLIT_PATTERN));
            gwarbmsHttpTrace.setMethod(t.getRequest().getMethod());
            gwarbmsHttpTrace.setUrl(t.getRequest().getUri());
            gwarbmsHttpTrace.setStatus(t.getResponse().getStatus());
            gwarbmsHttpTrace.setTimeTaken(t.getTimeTaken());
            if (StringUtils.isNotBlank(method) && StringUtils.isNotBlank(url)) {
                if (StringUtils.equalsIgnoreCase(method, gwarbmsHttpTrace.getMethod())
                        && StringUtils.containsIgnoreCase(gwarbmsHttpTrace.getUrl().toString(), url)) {
                    gwarbmsHttpTraces.add(gwarbmsHttpTrace);
                }
            } else if (StringUtils.isNotBlank(method)) {
                if (StringUtils.equalsIgnoreCase(method, gwarbmsHttpTrace.getMethod())) {
                    gwarbmsHttpTraces.add(gwarbmsHttpTrace);
                }
            } else if (StringUtils.isNotBlank(url)) {
                if (StringUtils.containsIgnoreCase(gwarbmsHttpTrace.getUrl().toString(), url)) {
                    gwarbmsHttpTraces.add(gwarbmsHttpTrace);
                }
            } else {
                gwarbmsHttpTraces.add(gwarbmsHttpTrace);
            }
        });

        Map<String, Object> data = new HashMap<>(2);
        data.put("rows", gwarbmsHttpTraces);
        data.put("total", gwarbmsHttpTraces.size());
        return new GwarbmsResponse().success().data(data);
    }
}
