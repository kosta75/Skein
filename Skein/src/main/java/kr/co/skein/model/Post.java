package kr.co.skein.model;

import java.util.Date;

public class Post {

	private int boardSeq;
	private String content;
	private Date writeDate;
	private int boardKindSeq;
	private String email;
	private int publicLevelCode;
	
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getBoardKindSeq() {
		return boardKindSeq;
	}
	public void setBoardKindSeq(int boardKindSeq) {
		this.boardKindSeq = boardKindSeq;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPublicLevelCode() {
		return publicLevelCode;
	}
	public void setPublicLevelCode(int publicLevelCode) {
		this.publicLevelCode = publicLevelCode;
	}
	
	
}
