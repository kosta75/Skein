package kr.co.skein.model.vo.notification;

import java.util.Date;

public class FriendshipNotification {

	private String notificationSeq;
	private String email;
	private String friendEmail;
	private int isRead;
	private Date createDate;
	private int notificationCode;
	private int friendshipConfirm;
	
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
	public String getFriendEmail() {
		return friendEmail;
	}
	public void setFriendEmail(String friendEmail) {
		this.friendEmail = friendEmail;
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
	public int getFriendshipConfirm() {
		return friendshipConfirm;
	}
	public void setFriendshipConfirm(int friendshipConfirm) {
		this.friendshipConfirm = friendshipConfirm;
	}
	
	
}
