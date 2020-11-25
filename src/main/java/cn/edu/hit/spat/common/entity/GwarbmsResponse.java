package cn.edu.hit.spat.common.entity;

import org.springframework.http.HttpStatus;

import java.util.HashMap;

/**
 * @author MrBird
 */
public class GwarbmsResponse extends HashMap<String, Object> {

    private static final long serialVersionUID = -8713837118340960775L;

    public cn.edu.hit.spat.common.entity.GwarbmsResponse code(HttpStatus status) {
        this.put("code", status.value());
        return this;
    }

    public cn.edu.hit.spat.common.entity.GwarbmsResponse message(String message) {
        this.put("message", message);
        return this;
    }

    public cn.edu.hit.spat.common.entity.GwarbmsResponse data(Object data) {
        this.put("data", data);
        return this;
    }

    public cn.edu.hit.spat.common.entity.GwarbmsResponse success() {
        this.code(HttpStatus.OK);
        return this;
    }

    public cn.edu.hit.spat.common.entity.GwarbmsResponse fail() {
        this.code(HttpStatus.INTERNAL_SERVER_ERROR);
        return this;
    }

    @Override
    public cn.edu.hit.spat.common.entity.GwarbmsResponse put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
