package cn.edu.hit.spat;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author XuJian
 */
@EnableAsync
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("cn.edu.hit.spat.*.mapper")
public class GWARBMSApp {

    public static void main(String[] args) {
        new SpringApplicationBuilder(GWARBMSApp.class)
                .web(WebApplicationType.SERVLET)
                .run(args);
    }
}
