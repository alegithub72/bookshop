package com.alek.mvcjquery.model.libri;

import com.google.gson.annotations.Expose;

public class Autore {
	
	
	
	@Expose
	private String nome;
	@Expose
	private String cognome;
	@Expose
	private String qualifica;
	@Expose
	private long id;
	
	
	public Autore(long id) {
		super();
		this.id = id;
	}

	public Autore(long id,String nome, String cognome, String qualifica) {
		super();
		this.id=id;
		this.nome = nome;
		this.cognome = cognome;
		this.qualifica = qualifica;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getQualifica() {
		return qualifica;
	}
	public void setQualifica(String qualifica) {
		this.qualifica = qualifica;
	}
	
}
