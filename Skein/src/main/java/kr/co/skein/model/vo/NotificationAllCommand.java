package kr.co.skein.model.vo;

import java.util.Date;

public class NotificationAllCommand {

	private String notificationSeq;
	private String email;
	private int isRead;
	private Date createDate;
	private int notificationCode;

	private String friendEmail;
	private int friendshipConfirm;
	private String boardSeq;
	private String replySeq;
	
	//notification code1
	private String content;
	
	//notification code2
	private String fullName;
	
	//notification code3
	
	//notification code4
	
	//notification code5
	
	//notification code6
	
	
	public String getFullName() {
		return fullName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNotificationSeq() {
		return notificationSeq;
	}

	public void setNotificationSeq(String notificationSeq) {
		this.notificationSeq = notificationSeq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getNotificationCode() {
		return notificationCode;
	}

	public void setNotificationCode(int notificationCode) {
		this.notificationCode = notificationCode;
	}

	public String getFriendEmail() {
		return friendEmail;
	}

	public void setFriendEmail(String friendEmail) {
		this.friendEmail = friendEmail;
	}

	public int getFriendshipConfirm() {
		return friendshipConfirm;
	}

	public void setFriendshipConfirm(int friendshipConfirm) {
		this.friendshipConfirm = friendshipConfirm;
	}

	public String getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getReplySeq() {
		return replySeq;
	}

	public void setReplySeq(String replySeq) {
		this.replySeq = replySeq;
	}
	
	
}
