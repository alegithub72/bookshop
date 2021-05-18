package com.alek.mvcjquery.model.libri;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.google.gson.annotations.Expose;

public class Edizione {
	

	@Expose
	private String editore;
	@Expose
	private long id;


	public Edizione(long id, String editore) {
		super();
		this.editore = editore;
		this.id = id;
	}


	public Edizione(long id) {
		super();
		this.id = id;
	}

	
	

	
	
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}




	public String getEditore() {
		return editore;
	}
	public void setEditore(String editore) {
		this.editore = editore;
	}

} 
