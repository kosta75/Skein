package kr.co.skein.model.vo;


public class FriendshipListCommand {
	
	/*m.email , m.FULLNAME, m.BIRTHDAY, m.PERSONALURI, p.PROFILECODE*/
	
	
	private String email;
	/*private String friendEmail;*/
	private String fullname;
	private String birthday;
	private String personaluri;
	private String profilecode;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPersonaluri() {
		return personaluri;
	}
	public void setPersonaluri(String personaluri) {
		this.personaluri = personaluri;
	}
	public String getProfilecode() {
		return profilecode;
	}
	public void setProfilecode(String profilecode) {
		this.profilecode = profilecode;
	}
	
	
	
	
	
}
