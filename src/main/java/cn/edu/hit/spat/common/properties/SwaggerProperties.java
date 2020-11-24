package cn.edu.hit.spat.common.properties;

import lombok.Data;

/**
 * @author XuJian
 */
@Data
public class SwaggerProperties {
    private String basePackage;
    private String title;
    private String description;
    private String version;
    private String author;
    private String url;
    private String email;
    private String license;
    private String licenseUrl;
}
