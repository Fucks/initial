package br.fucks.initial.config.security.securityschema;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 *
 * @author Wellington Felipe Fucks
 *
 * @version 1.0
 * @since 1.0, 17/11/2015
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(value = {ElementType.FIELD})
public @interface PermissionMapping {

    /**
     *
     * @return
     */
    public String group();

    /**
     *
     * @return
     */
    public String[] dependencies() default {};
}
