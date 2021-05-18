package com.alek.mvcjquery.model.libri;

import com.google.gson.annotations.Expose;

public class ErrorResponse {
	@Expose
	String msg;
	@Expose
	String code;
	@Expose
	boolean errore;
	
	public String getMsg() {
		return msg;
	}
	
	
	
	public boolean isErrore() {
		return errore;
	}



	public void setErrore(boolean errore) {
		this.errore = errore;
	}



	public ErrorResponse(String msg, String code) {
		super();
		this.msg = msg;
		this.code = code;
		this.errore=true;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

}
