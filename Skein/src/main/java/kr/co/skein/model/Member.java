package kr.co.skein.model;

import java.util.Date;

public class Member {

	private String email;
	private String lastName;
	private String firstName;
	private String fullName;
	private String password;
	private Date birthday;
	private Date createDate; //SYSDATE
	private Date lastLoginDate; //null, 로그인 할 때 SYSDATE
	private int enabled; //default 1
	private int closed;//default 0
	private String personalURI;
	private Date lastPasswordChangedDate;//null, 비밀번호 변경시 SYSDATE
	private int failedPasswordAttemptCount;//default 0
		
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

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public int getClosed() {
		return closed;
	}

	public void setClosed(int closed) {
		this.closed = closed;
	}

	public String getPersonalURI() {
		return personalURI;
	}

	public void setPersonalURI(String personalURI) {
		this.personalURI = personalURI;
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

	public void viewDefaultData(){
		System.out.println("{email:"+this.email+",lastName:"+this.lastName+",firstName:"+this.firstName+",fullName:"+this.fullName+",password:"+this.password+"}");
	}
	
	@Override
	public String toString() {
		System.out.println("email: "+this.email);
		System.out.println("lastName: "+this.lastName);
		System.out.println("firstName: "+this.firstName);
		System.out.println("fullName: "+this.fullName);
		System.out.println("password: "+this.password);
		System.out.println("birthday: "+this.birthday);
		System.out.println("createDate: "+this.createDate);
		System.out.println("lastLoginDate: "+this.lastLoginDate);
		System.out.println("enabled: "+this.enabled);
		System.out.println("closed: "+this.closed);
		System.out.println("personalURI: "+this.personalURI);
		System.out.println("lastPasswordChangedDate: "+this.lastPasswordChangedDate);
		System.out.println("failedPasswordAttemptCount: "+this.failedPasswordAttemptCount);

	/*	private String email;
		private String lastName;
		private String firstName;
		private String fullName;
		private String password;
		private Date birthday;
		private Date createDate;
		private Date lastLoginDate;
		private int enabled;
		private int closed;
		private Date lastPasswordChangedDate;
		private int failedPasswordAttemptCount;*/
		return "{email:"+this.email+",lastName:"+this.lastName+",firstName:"+this.firstName+",fullName:"+this.fullName+",password:"+this.password+"}";
	}
	
	
	
	
	
}
