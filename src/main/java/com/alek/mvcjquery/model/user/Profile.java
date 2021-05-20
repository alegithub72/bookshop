package com.alek.mvcjquery.model.user;

public class Profile {
	int id;
	String nome;
	
	
	
	
	public Profile(int id, String nome) {
		super();
		this.id = id;
		this.nome = nome;
	}
	public Profile(int profileid) {
		this.id = profileid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	

}
