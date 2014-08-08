package kr.co.skein.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {

	private String email;
	private String lastName;
	private String firstName;
	private String fullName;
	private String password;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String personalURI;
	
	private int isApproved;//default 0
	private int isLockedOut;//default 0
	private int isDomranted;//default 0
	private int isDropedOut;//default 0
	
	private Date createDate; //SYSDATE
	private Date lastLoginDate; //null, 로그인 할 때 SYSDATE
	private Date lastPasswordChangedDate;//null, 비밀번호 변경시 SYSDATE
	
	private int failedPasswordAttemptCount;//default 0
	private String certificationText;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPersonalURI() {
		return personalURI;
	}

	public void setPersonalURI(String personalURI) {
		this.personalURI = personalURI;
	}

	public int getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(int isApproved) {
		this.isApproved = isApproved;
	}

	public int getIsLockedOut() {
		return isLockedOut;
	}

	public void setIsLockedOut(int isLockedOut) {
		this.isLockedOut = isLockedOut;
	}

	public int getIsDomranted() {
		return isDomranted;
	}

	public void setIsDomranted(int isDomranted) {
		this.isDomranted = isDomranted;
	}

	public int getIsDropedOut() {
		return isDropedOut;
	}

	public void setIsDropedOut(int isDropedOut) {
		this.isDropedOut = isDropedOut;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getLastPasswordChangedDate() {
		return lastPasswordChangedDate;
	}

	public void setLastPasswordChangedDate(Date lastPasswordChangedDate) {
		this.lastPasswordChangedDate = lastPasswordChangedDate;
	}

	public int getFailedPasswordAttemptCount() {
		return failedPasswordAttemptCount;
	}

	public void setFailedPasswordAttemptCount(int failedPasswordAttemptCount) {
		this.failedPasswordAttemptCount = failedPasswordAttemptCount;
	}

	public String getCertificationText() {
		return certificationText;
	}

	public void setCertificationText(String certificationText) {
		this.certificationText = certificationText;
	}

	@Override
	public String toString() {	
		System.out.println("===== 사용자 필수 입력 정보 =====");
		System.out.println("email: "+this.email);
		System.out.println("lastName: "+this.lastName);
		System.out.println("firstName: "+this.firstName);
		System.out.println("password: "+this.password);
		System.out.println("birthday: "+this.birthday);
		System.out.println();
		System.out.println("===== 시스템 설정 정보 =====");
		System.out.println("fullName: "+this.fullName);
		System.out.println("personalURI: "+this.personalURI);
		System.out.println("createDate: "+this.createDate);
		System.out.println("certificationText: "+this.certificationText);
		System.out.println();
		System.out.println("===== 사용자 계정 정보 =====");
		System.out.println("isApproved(계정승인여부): "+this.isApproved);
		System.out.println("isLockedOut(계정폐쇄여부): "+this.isLockedOut);
		System.out.println("isDomranted(계정휴면여부): "+this.isDomranted);
		System.out.println("isDropedOut(계정탈퇴여부): "+this.isDropedOut);
		System.out.println();
		System.out.println("===== 계정 정보 변경 내용 =====");
		System.out.println("lastLoginDate: "+this.lastLoginDate);
		System.out.println("lastPasswordChangedDate: "+this.lastPasswordChangedDate);
		System.out.println("failedPasswordAttemptCount: "+this.failedPasswordAttemptCount);

		return "";
	}

}
