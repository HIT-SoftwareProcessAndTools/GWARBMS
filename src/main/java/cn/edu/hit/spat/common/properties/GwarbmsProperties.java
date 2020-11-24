package cn.edu.hit.spat.common.properties;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

/**
 * @author XuJian
 */
@Data
@SpringBootConfiguration
@PropertySource(value = {"classpath:gwarbms.properties"})
@ConfigurationProperties(prefix = "gwarbms")
public class GwarbmsProperties {

    private ShiroProperties shiro = new ShiroProperties();
    private boolean autoOpenBrowser = true;
    private SwaggerProperties swagger = new SwaggerProperties();

    private int maxBatchInsertNum = 1000;

    private ValidateCodeProperties code = new ValidateCodeProperties();
}
