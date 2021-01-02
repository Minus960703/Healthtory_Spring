package com.control.vo;

public class UserVO {
	
	String Id;
	String Password;
	String Name;
	String Phone;
	String Email;
	String Nickname;
	String grade;
	
	public UserVO(String id, String password) {
		Id = id;
		Password = password;
	}
	
	public UserVO(String id, String password, String name, String phone, String email, String nickname) {
		Id = id;
		Password = password;
		Name = name;
		Phone = phone;
		Email = email;
		Nickname = nickname;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getNickname() {
		return Nickname;
	}

	public void setNickname(String nickname) {
		Nickname = nickname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	
}
