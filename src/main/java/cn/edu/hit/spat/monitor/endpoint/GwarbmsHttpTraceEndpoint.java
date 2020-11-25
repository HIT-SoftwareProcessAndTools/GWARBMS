package cn.edu.hit.spat.monitor.endpoint;

import cn.edu.hit.spat.common.annotation.GwarbmsEndPoint;
import org.springframework.boot.actuate.trace.http.HttpTrace;
import org.springframework.boot.actuate.trace.http.HttpTraceRepository;

import java.util.List;

/**
 * @author MrBird
 */
@GwarbmsEndPoint
public class GwarbmsHttpTraceEndpoint {

    private final HttpTraceRepository repository;

    public GwarbmsHttpTraceEndpoint(HttpTraceRepository repository) {
        this.repository = repository;
    }

    public GwarbmsHttpTraceDescriptor traces() {
        return new GwarbmsHttpTraceDescriptor(this.repository.findAll());
    }

    public static final class GwarbmsHttpTraceDescriptor {

        private final List<HttpTrace> traces;

        private GwarbmsHttpTraceDescriptor(List<HttpTrace> traces) {
            this.traces = traces;
        }

        public List<HttpTrace> getTraces() {
            return this.traces;
        }
    }
}
