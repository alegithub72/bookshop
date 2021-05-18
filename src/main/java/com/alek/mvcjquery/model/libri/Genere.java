package com.alek.mvcjquery.model.libri;

import com.google.gson.annotations.Expose;

public class Genere {
	@Expose
	public int id;
	@Expose
	public String tipologia;
	
	
	
	public Genere(int id, String tipologia) {
		super();
		this.id = id;
		this.tipologia = tipologia;
	}


	public Genere(int id) {
		super();
		this.id = id;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipologia() {
		return tipologia;
	}
	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	
	
	

}
