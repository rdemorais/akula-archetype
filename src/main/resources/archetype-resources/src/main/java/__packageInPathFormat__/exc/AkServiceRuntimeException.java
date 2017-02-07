package ${package}.exc;
public class AkServiceRuntimeException extends AkRuntimeException {

	private static final long serialVersionUID = 6120276937379725510L;
	
	public AkServiceRuntimeException(String msg) {
		super(msg);
	}

	public AkServiceRuntimeException(String msg, Throwable cause,
			Object objOnError) {
		super(msg, cause, objOnError);
		this.objOnError = objOnError;
	}

	public AkServiceRuntimeException(String msg, Throwable cause) {
		super(msg, cause);
	}
}