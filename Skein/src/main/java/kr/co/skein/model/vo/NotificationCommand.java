package kr.co.skein.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NotificationCommand {

	private String notificationSeq;
	private String email;
	private int isRead;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	private int notificationCode;
	
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
}
