package kr.co.skein.model.vo;

public class Authority {

	private String authority;
	private String email;
	
	public Authority(){}
	
	public Authority(String authority, String email){
		this.authority = authority;
		this.email = email;
	}
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
