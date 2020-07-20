package com.dto;

public class LoginDto {
	
	private String id;
	private String name;
	private String pw;
	private String email;
	private String role;
	
	
	public LoginDto() {
		super();
	}


	public LoginDto(String id, String name, String pw, String email, String role) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.role = role;
	}



	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}
	

	
	
	
}
