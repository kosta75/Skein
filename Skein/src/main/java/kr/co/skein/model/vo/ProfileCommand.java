package kr.co.skein.model.vo;

public class ProfileCommand {

	private String profileSeq;
	private int profileCode;
	private String profileInfo;
	private int publicLevelCode;
	private String email;
	
	public String getProfileSeq() {
		return profileSeq;
	}
	public void setProfileSeq(String profileSeq) {
		this.profileSeq = profileSeq;
	}
	public int getProfileCode() {
		return profileCode;
	}
	public void setProfileCode(int profileCode) {
		this.profileCode = profileCode;
	}
	public String getProfileInfo() {
		return profileInfo;
	}
	public void setProfileInfo(String profileInfo) {
		this.profileInfo = profileInfo;
	}
	public int getPublicLevelCode() {
		return publicLevelCode;
	}
	public void setPublicLevelCode(int publicLevelCode) {
		this.publicLevelCode = publicLevelCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
