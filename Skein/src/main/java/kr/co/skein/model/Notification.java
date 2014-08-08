package kr.co.skein.model;

import java.util.Date;

public class Notification extends NotificationKinds {

	/*>NotificationFormCode NUMBER NOT NULL,  알림형식코드 
	>NotificationFormName VARCHAR2(127) NOT NULL  알림형식이름 
	>NotificationKindSeq NUMBER NOT NULL,  알림번호 
	>NotificationKindName VARCHAR2(127) NOT NULL,  알림이름 
	>NotificationFormCode NUMBER NOT NULL  알림형식코드 
	NotificationSeq NUMBER NOT NULL,  사용자알림번호 
	Email VARCHAR2(127) NOT NULL,  이메일 
	>NotificationKindSeq NUMBER NOT NULL,  알림번호 
	IsRead INT NOT NULL,  읽은알림 
	CreateDate DATE NOT NULL  발생일자 */
	private int notificationSeq;
	private String email;
	private int isRead;
	private Date crateDate;
	
	public int getNotificationSeq() {
		return notificationSeq;
	}
	public void setNotificationSeq(int notificationSeq) {
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
	public Date getCrateDate() {
		return crateDate;
	}
	public void setCrateDate(Date crateDate) {
		this.crateDate = crateDate;
	}
	
	
	
	
}
