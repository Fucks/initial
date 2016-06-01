/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.fucks.initial.config.data;

import java.util.Locale;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.core.annotation.Order;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;

/**
 *
 * @author Fucks
 */
@Component
@Order(5)
@Aspect
public class ExceptionPointCut {

    private final Logger LOG = Logger.getLogger(Exception.class);

    //SQLState to duplicated data field.
    public final String DUPLICATED_REGISTER_ERROR = "23505";
    public final String FOREING_KEY_REFERENCED_ERROR = "23503";

    //error messages
    public final String ACCESS_DENIED_EXCEPTION_MESSAGE = "access-denied.error.message";

    @Autowired
    @Qualifier("fieldsMessageSource")
    private MessageSource fieldsMessageSource;

    /**
     *
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around("execution(* br.org.pti.credential.service.*.insert*(..)) || "
            + "execution(* br.org.pti.credential.service.*.update*(..)) || "
            + "execution(* br.org.pti.credential.service.*.save*(..)) || "
            + "execution(* br.org.pti.credential.service.*.remove*(..)) || "
            + "execution(* br.org.pti.credential.service.*.delete*(..))")
    public Object doHandleDataIntegrityViolationException(ProceedingJoinPoint joinPoint) throws Throwable {
        try {
            return joinPoint.proceed();
        } catch (DataIntegrityViolationException exception) {
            if (exception.getMostSpecificCause() instanceof PSQLException) {
                PSQLException currentException = (PSQLException) exception.getMostSpecificCause();

                if (currentException.getSQLState().equals(this.DUPLICATED_REGISTER_ERROR)) {
                    //manipula a string de exception para pegar o nome do campo duplicado e 
                    //gerar uma exception com uma mensagem mais amigavel ao usuário final.
                    int start = currentException.getServerErrorMessage().getDetail().indexOf("Key (") + 5;
                    int end = currentException.getServerErrorMessage().getDetail().indexOf(")=(");

                    String fieldError = currentException.getServerErrorMessage().getDetail().substring(start, end);

                    throw new DataIntegrityViolationException("O campo " + fieldsMessageSource.getMessage(fieldError, null, Locale.getDefault()) + " já existe.");
                }
                if (currentException.getSQLState().equals(this.FOREING_KEY_REFERENCED_ERROR)) {
                    //manipula a string de exception para pegar o nome do campo duplicado e 
                    //gerar uma exception com uma mensagem mais amigavel ao usuário final.
                    int start = currentException.getServerErrorMessage().getDetail().indexOf("table ") + 7;
                    int end = currentException.getServerErrorMessage().getDetail().indexOf("\".");

                    String fieldReference = currentException.getServerErrorMessage().getMessage()
                            .substring(currentException.getServerErrorMessage().getMessage().indexOf("on table \"") + 10,
                                    currentException.getServerErrorMessage().getMessage().indexOf("\" violates"));
                    String fieldReferenceOn = currentException.getServerErrorMessage().getDetail().substring(start, end);

                    throw new DataIntegrityViolationException("Não é possível excluir o <b>" + fieldsMessageSource.getMessage(fieldReference, null, Locale.getDefault()) + "</b> pois o registro ainda é referenciado em <b>'" + fieldsMessageSource.getMessage(fieldReferenceOn, null, Locale.getDefault()) + "'</b>.");
                }
            }
        } catch (AccessDeniedException exception) {
            throw new AccessDeniedException(fieldsMessageSource.getMessage(ACCESS_DENIED_EXCEPTION_MESSAGE, null, Locale.getDefault()));
        } catch (Exception exception) {
            return exception;
        }
        return null;
    }
}
