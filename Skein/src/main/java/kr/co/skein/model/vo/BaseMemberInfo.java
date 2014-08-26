package kr.co.skein.model.vo;

import java.util.Date;

public class BaseMemberInfo {

	private String email;
	private String personalURI;
	private String colorTheme;
	private Date birthday;
	private String fullName;
	private String lastName;
	private String firstName;
	private String profileImageFileName;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPersonalURI() {
		return personalURI;
	}
	public void setPersonalURI(String personalURI) {
		this.personalURI = personalURI;
	}
	public String getColorTheme() {
		return colorTheme;
	}
	public void setColorTheme(String colorTheme) {
		this.colorTheme = colorTheme;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getProfileImageFileName() {
		return profileImageFileName;
	}
	public void setProfileImageFileName(String profileImageFileName) {
		this.profileImageFileName = profileImageFileName;
	}
}
