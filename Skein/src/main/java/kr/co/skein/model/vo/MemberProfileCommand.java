package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;

public class MemberProfileCommand {

	private String lastName;
	private String firstName;
	private String fullName;
	private Date birthday;
	private List<ProfileCommand> profiles;
	
	
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
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public List<ProfileCommand> getProfiles() {
		return profiles;
	}
	public void setProfiles(List<ProfileCommand> profiles) {
		this.profiles = profiles;
	}
	
	
}
