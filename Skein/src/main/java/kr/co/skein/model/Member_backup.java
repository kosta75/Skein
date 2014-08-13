package kr.co.skein.model;

import java.util.Date;

public class Member_backup {

	private String email;
	private String lastName;
	private String firstName;
	private String fullName;
	private String password;
	private Date birthday;
	private Date createDate; //SYSDATE
	private Date lastLoginDate; //null, 로그인 할 때 SYSDATE
	private int enabled; //default 1
	private int isApproved;//default 0
	private int isLockedOut;//default 0
	private int isDomranted;//default 0
	private int isDropedOut;//default 0
	
	private String personalURI;
	private Date lastPasswordChangedDate;//null, 비밀번호 변경시 SYSDATE
	private int failedPasswordAttemptCount;//default 0
		


	
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
