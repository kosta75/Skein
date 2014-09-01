package kr.co.skein.model.vo;

import java.util.Date;
import java.util.List;


public class FriendshipListCommand {

	private String email;
	private String friendEmail;
	private String fullname;
	private Date birthday;	
	private String personaluri;
	
	private String profileImageFileName;
	private String publicEmail;
	private int publicLevelCodeToEmail;
	
	private List<MemberProfile> memberProfileList;
	
	
	
	
	public List<MemberProfile> getMemberProfileList() {
		return memberProfileList;
	}
	public void setMemberProfileList(List<MemberProfile> memberProfileList) {
		this.memberProfileList = memberProfileList;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
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
	public int getPublicLevelCodeToEmail() {
		return publicLevelCodeToEmail;
	}
	public void setPublicLevelCodeToEmail(int publicLevelCodeToEmail) {
		this.publicLevelCodeToEmail = publicLevelCodeToEmail;
	}
}
