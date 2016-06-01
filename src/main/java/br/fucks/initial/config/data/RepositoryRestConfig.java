package br.fucks.initial.config.data;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 10/11/2015
 */
@Configuration
public class RepositoryRestConfig extends RepositoryRestMvcConfiguration {

    @Override
    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.setPageParamName("page")
                .setDefaultPageSize(8)
                .setLimitParamName("limit")
                .setSortParamName("sort");
    }
}
