package ${package}.exc;
public class AkRuntimeException extends RuntimeException{

	private static final long serialVersionUID = -624075139510025583L;
	
	/**
	 * Armazena o objeto envolvido no erro
	 */
	public Object objOnError = null;
	
	public AkRuntimeException(String msg) {
		super(msg);
	}
	
	public AkRuntimeException(String msg, Throwable cause, Object objOnError) {
		super(msg, cause);
	}
	
	public AkRuntimeException(String msg, Throwable cause) {
		super(msg, cause);
	}
	
	public Object getObjOnError() {
		return objOnError;
	}

}