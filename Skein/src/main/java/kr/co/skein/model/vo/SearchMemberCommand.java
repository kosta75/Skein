package kr.co.skein.model.vo;

public class SearchMemberCommand {
	
	
	private String fullName;
	private String personalURI;
	private int isFriend;
	private String profileInfo;
	
	public String getProfileInfo() {
		return profileInfo;
	}
	public void setProfileInfo(String profileInfo) {
		this.profileInfo = profileInfo;
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
	public int getIsFriend() {
		return isFriend;
	}
	public void setIsFriend(int isFriend) {
		this.isFriend = isFriend;
	}

	
	
}
