package kr.co.skein.model.vo;


public class FriendshipListCommand {

	private String friendEmail;
	private String fullname;
	private String birthday;
	private String personaluri;
	private String profileImageFileName;
	private String publicEmail;
	public String getFriendEmail() {
		return friendEmail;
	}
	public void setFriendEmail(String friendEmail) {
		this.friendEmail = friendEmail;
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
	public String getProfileImageFileName() {
		return profileImageFileName;
	}
	public void setProfileImageFileName(String profileImageFileName) {
		this.profileImageFileName = profileImageFileName;
	}
	public String getPublicEmail() {
		return publicEmail;
	}
	public void setPublicEmail(String publicEmail) {
		this.publicEmail = publicEmail;
	}

}
