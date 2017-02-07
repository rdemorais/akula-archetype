package ${package}.web;

import java.io.Serializable;

public class AkulaResponse implements Serializable{
	
	private static final long serialVersionUID = -6915506512815158566L;

	String msg;
	String status;
	Object obj;
	
	private AkulaResponse(String msg, String status) {
		this.msg = msg;
		this.status = status;
		this.obj = null;
	}
	
	private AkulaResponse(String msg, String status, Object obj) {
		this.msg = msg;
		this.status = status;
		this.obj = obj;
	}
	
	public static AkulaResponse ok() {
		return new AkulaResponse("Ok", "success");
	}
	
	public static AkulaResponse ok(String msg, Object obj) {
		return new AkulaResponse(msg, "success", obj);
	}
	
	public static AkulaResponse ok(Object obj) {
		return new AkulaResponse("Ok", "success", obj);
	}
	
	public static AkulaResponse error(String msg) {
		return new AkulaResponse(msg, "error");
	}
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
}