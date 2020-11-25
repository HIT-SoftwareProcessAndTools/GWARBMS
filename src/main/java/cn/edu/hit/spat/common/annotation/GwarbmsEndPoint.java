package cn.edu.hit.spat.common.annotation;

import org.springframework.core.annotation.AliasFor;
import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * @author MrBird
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface GwarbmsEndPoint {
    @AliasFor(annotation = Component.class)
    String value() default "";
}
