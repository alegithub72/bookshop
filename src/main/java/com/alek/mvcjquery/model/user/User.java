package com.alek.mvcjquery.model.user;

import com.alek.mvcjquery.controller.servlet.service.BookshopServletJSONRicercaBook;
import com.google.gson.annotations.Expose;

public class User {
	
	
	@Expose
	int id;
	@Expose
	String name;
	@Expose
	String surname;
	
	String pass;
	@Expose
	String email;
	@Expose
	Profile profile;
	@Expose
	String ricercaURL;
	@Expose
	String startRow;
	
	@Expose
	String ricercaPage;
	

	public User(int id, int profileid, String name, String surname,String pass, String email) {
		super();
		this.id = id;
		this.profile = new Profile(profileid);
		this.name = name;
		this.pass = pass;
		this.email = email;
		this.surname=surname;
		this.startRow="1";
		this.ricercaPage=""+BookshopServletJSONRicercaBook.PAGE;

	}
	
	
	
	
	public String getSurname() {
		return surname;
	}




	public void setSurname(String surname) {
		this.surname = surname;
	}




	public String getStartRow() {
		return startRow;
	}




	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}




	public String getRicercaPage() {
		return ricercaPage;
	}




	public void setRicercaPage(String ricercaPage) {
		this.ricercaPage = ricercaPage;
	}




	public String getRicercaURL() {
		return ricercaURL;
	}




	public void setRicercaURL(String ricercaURL) {
		this.ricercaURL = ricercaURL;
	}




	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
	
	

}
