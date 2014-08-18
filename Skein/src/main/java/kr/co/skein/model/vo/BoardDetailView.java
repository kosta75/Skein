package kr.co.skein.model.vo;

import java.util.Date;

public class BoardDetailView {
private int boardSeq;
private int boardKindSeq;
private String email;
private String content;
private Date writeDate;
private int groupSeq;
private int publicLevelCode;
private String filename;
private String fullname;
public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}
public int getBoardSeq() {
	return boardSeq;
}
public void setBoardSeq(int boardSeq) {
	this.boardSeq = boardSeq;
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
public int getGroupSeq() {
	return groupSeq;
}
public void setGroupSeq(int groupSeq) {
	this.groupSeq = groupSeq;
}
public int getPublicLevelCode() {
	return publicLevelCode;
}
public void setPublicLevelCode(int publicLevelCode) {
	this.publicLevelCode = publicLevelCode;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}


}
