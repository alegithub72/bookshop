package com.alek.mvcjquery.model.user;

public class User {
	
	
	
	int id;
	String name;
	String pass;
	String email;
	Profile profile;
	

	public User(int id, int profileid, String name, String pass, String email) {
		super();
		this.id = id;
		this.profile = new Profile(profileid);
		this.name = name;
		this.pass = pass;
		this.email = email;

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
