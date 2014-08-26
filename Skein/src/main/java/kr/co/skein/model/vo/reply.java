package kr.co.skein.model.vo;

public class reply extends Member {
private String replySeq;
private String boardSeq;
private String email;
private String replyContent;
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


}
