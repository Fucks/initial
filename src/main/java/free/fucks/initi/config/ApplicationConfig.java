package free.fucks.initi.config;

import free.fucks.initi.config.data.PersistenceConfig;
import free.fucks.initi.config.data.RepositoryRestConfig;
import free.fucks.initi.config.security.MethodSecurityConfig;
import free.fucks.initi.config.security.SecurityConfig;
import free.fucks.initi.config.web.WebMvcConfig;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ResourceBundleMessageSource;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 29/10/2015
 */
@Configuration
@EnableAspectJAutoProxy
@ComponentScan("free.fucks.initi")
@Import({WebMvcConfig.class, PersistenceConfig.class, SecurityConfig.class, RepositoryRestConfig.class, MethodSecurityConfig.class})
public class ApplicationConfig {

    private static final String MESSAGE_SOURCE_BASE_NAME = "i18n/messages";

//    @Bean
//    MessageSource messageSource() {
//        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
//        messageSource.setBasename(MESSAGE_SOURCE_BASE_NAME);
//        messageSource.setUseCodeAsDefaultMessage(true);
//
//        return messageSource;
//    }

    @Bean
    MessageSource fieldsMessageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("i18n/fields");
        messageSource.setUseCodeAsDefaultMessage(true);

        return messageSource;
    }

    @Bean
    PropertySourcesPlaceholderConfigurer propertyPlaceHolderConfigurer() {
        return new PropertySourcesPlaceholderConfigurer();
    }
}
