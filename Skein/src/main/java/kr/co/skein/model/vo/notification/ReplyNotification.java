package kr.co.skein.model.vo.notification;

import java.util.Date;

public class ReplyNotification extends Notification{

	private String replySeq;
	
	private String boardSeq;
	private String content;
	
	private String email;
	private String replyContent;
	private int isActivated;
	
	private Date writeDate;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
}
