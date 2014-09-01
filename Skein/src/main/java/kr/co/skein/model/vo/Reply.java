package kr.co.skein.model.vo;

public class Reply extends Member {
	private String profileinfo;
	public String getProfileinfo() {
		return profileinfo;
	}
	public void setProfileinfo(String profileinfo) {
		this.profileinfo = profileinfo;
	}
	private int rownum;
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	private String replySeq;
	private String boardSeq;
	private String email;
	private String replyContent;
	private int isActivated;
	
	public String getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(String replySeq) {
		this.replySeq = replySeq;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getIsActivated() {
		return isActivated;
	}
	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
	}
}
