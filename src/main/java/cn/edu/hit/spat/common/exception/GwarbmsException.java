package cn.edu.hit.spat.common.exception;

/**
 * FEBS系统内部异常
 *
 * @author MrBird
 */
public class GwarbmsException extends RuntimeException  {

    private static final long serialVersionUID = -994962710559017255L;

    public GwarbmsException(String message) {
        super(message);
    }
}
