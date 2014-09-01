package kr.co.skein.model.vo;

import java.util.List;

public class FriendshipList {

	private String email;
	private String friendEmail;
	
	private String fullName;	
	private String personalURI;
	
	private List<MemberProfile> memberProfileList;

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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPersonalURI() {
		return personalURI;
	}

	public void setPersonalURI(String personalURI) {
		this.personalURI = personalURI;
	}

	public List<MemberProfile> getMemberProfileList() {
		return memberProfileList;
	}

	public void setMemberProfileList(List<MemberProfile> memberProfileList) {
		this.memberProfileList = memberProfileList;
	}

	
}
