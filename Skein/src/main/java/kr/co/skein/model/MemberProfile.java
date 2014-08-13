package kr.co.skein.model;

public class MemberProfile extends Member {
	
	/*Email VARCHAR2(127) NOT NULL,  이메일 
	Address VARCHAR2(255),  사는곳 
	ProfileImage VARCHAR2(127),  프로필사진 
	OpenEmail VARCHAR2(127),  공개할이메일 
	PhoneNumber VARCHAR2(30),  휴대폰번호 
	StatusComment VARCHAR2(127),  상태글 
	Religion VARCHAR2(127),  종교 
	Politics VARCHAR2(127),  정치성향 
	Language VARCHAR2(127),  언어 
	Blog VARCHAR2(127)  블로그 */
	
	private String address;
	private String profileImage;
	private String openEmail;
	private String phoneNumber;
	private String statusComment;
	private String religion;
	private String politics;
	private String language;
	private String blog;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getOpenEmail() {
		return openEmail;
	}
	public void setOpenEmail(String openEmail) {
		this.openEmail = openEmail;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getStatusComment() {
		return statusComment;
	}
	public void setStatusComment(String statusComment) {
		this.statusComment = statusComment;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getPolitics() {
		return politics;
	}
	public void setPolitics(String politics) {
		this.politics = politics;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getBlog() {
		return blog;
	}
	public void setBlog(String blog) {
		this.blog = blog;
	}
	
	
	
	
}
