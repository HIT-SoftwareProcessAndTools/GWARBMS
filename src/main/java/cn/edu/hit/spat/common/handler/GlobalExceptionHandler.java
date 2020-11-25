package cn.edu.hit.spat.common.handler;

import cn.edu.hit.spat.common.entity.GwarbmsResponse;
import cn.edu.hit.spat.common.exception.GwarbmsException;
import cn.edu.hit.spat.common.exception.FileDownloadException;
import cn.edu.hit.spat.common.exception.LimitAccessException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.session.ExpiredSessionException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Path;
import java.util.List;
import java.util.Set;

/**
 * @author XuJian
 */
@Slf4j
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public GwarbmsResponse handleException(Exception e) {
        log.error("系统内部异常，异常信息", e);
        return new GwarbmsResponse().code(HttpStatus.INTERNAL_SERVER_ERROR).message("系统内部异常");
    }

    @ExceptionHandler(value = GwarbmsException.class)
    public GwarbmsResponse handleGwarbmsException(GwarbmsException e) {
        log.error("系统错误", e);
        return new GwarbmsResponse().code(HttpStatus.INTERNAL_SERVER_ERROR).message(e.getMessage());
    }

    /**
     * 统一处理请求参数校验(实体对象传参-form)
     *
     * @param e BindException
     * @return GwarbmsResponse
     */
    @ExceptionHandler(BindException.class)
    public GwarbmsResponse validExceptionHandler(BindException e) {
        StringBuilder message = new StringBuilder();
        List<FieldError> fieldErrors = e.getBindingResult().getFieldErrors();
        for (FieldError error : fieldErrors) {
            message.append(error.getField()).append(error.getDefaultMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        return new GwarbmsResponse().code(HttpStatus.BAD_REQUEST).message(message.toString());
    }

    /**
     * 统一处理请求参数校验(普通传参)
     *
     * @param e ConstraintViolationException
     * @return GwarbmsResponse
     */
    @ExceptionHandler(value = ConstraintViolationException.class)
    public GwarbmsResponse handleConstraintViolationException(ConstraintViolationException e) {
        StringBuilder message = new StringBuilder();
        Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
        for (ConstraintViolation<?> violation : violations) {
            Path path = violation.getPropertyPath();
            String[] pathArr = StringUtils.splitByWholeSeparatorPreserveAllTokens(path.toString(), ".");
            message.append(pathArr[1]).append(violation.getMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        return new GwarbmsResponse().code(HttpStatus.BAD_REQUEST).message(message.toString());
    }

    /**
     * 统一处理请求参数校验(json)
     *
     * @param e ConstraintViolationException
     * @return GwarbmsResponse
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public GwarbmsResponse handlerMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        StringBuilder message = new StringBuilder();
        for (FieldError error : e.getBindingResult().getFieldErrors()) {
            message.append(error.getField()).append(error.getDefaultMessage()).append(",");
        }
        message = new StringBuilder(message.substring(0, message.length() - 1));
        log.error(message.toString(), e);
        return new GwarbmsResponse().code(HttpStatus.BAD_REQUEST).message(message.toString());
    }

    @ExceptionHandler(value = LimitAccessException.class)
    public GwarbmsResponse handleLimitAccessException(LimitAccessException e) {
        log.error("LimitAccessException", e);
        return new GwarbmsResponse().code(HttpStatus.TOO_MANY_REQUESTS).message(e.getMessage());
    }

    @ExceptionHandler(value = UnauthorizedException.class)
    public GwarbmsResponse handleUnauthorizedException(UnauthorizedException e) {
        log.error("UnauthorizedException, {}", e.getMessage());
        return new GwarbmsResponse().code(HttpStatus.FORBIDDEN).message(e.getMessage());
    }

    @ExceptionHandler(value = AuthenticationException.class)
    public GwarbmsResponse handleAuthenticationException(AuthenticationException e) {
        log.error("AuthenticationException, {}", e.getMessage());
        return new GwarbmsResponse().code(HttpStatus.INTERNAL_SERVER_ERROR).message(e.getMessage());
    }

    @ExceptionHandler(value = AuthorizationException.class)
    public GwarbmsResponse handleAuthorizationException(AuthorizationException e){
        log.error("AuthorizationException, {}", e.getMessage());
        return new GwarbmsResponse().code(HttpStatus.UNAUTHORIZED).message(e.getMessage());
    }


    @ExceptionHandler(value = ExpiredSessionException.class)
    public GwarbmsResponse handleExpiredSessionException(ExpiredSessionException e) {
        log.error("ExpiredSessionException", e);
        return new GwarbmsResponse().code(HttpStatus.UNAUTHORIZED).message(e.getMessage());
    }

    @ExceptionHandler(value = FileDownloadException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public void handleFileDownloadException(FileDownloadException e) {
        log.error("FileDownloadException", e);
    }
}
