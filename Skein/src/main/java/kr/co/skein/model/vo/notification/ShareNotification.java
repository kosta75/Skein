package kr.co.skein.model.vo.notification;

import java.util.Date;

public class ShareNotification {

	private String notificationSeq;
	private String email;
	private int isRead;
	private int createDate;
	private int notificationCode;
	private String boardSeq;
	private String ownerEmail;
	private int shareConfirm;
	
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
	public int getCreateDate() {
		return createDate;
	}
	public void setCreateDate(int createDate) {
		this.createDate = createDate;
	}
	public int getNotificationCode() {
		return notificationCode;
	}
	public void setNotificationCode(int notificationCode) {
		this.notificationCode = notificationCode;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getOwnerEmail() {
		return ownerEmail;
	}
	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}
	public int getShareConfirm() {
		return shareConfirm;
	}
	public void setShareConfirm(int shareConfirm) {
		this.shareConfirm = shareConfirm;
	}
	
	
	
	
}
