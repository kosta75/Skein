package kr.co.skein.model;

public class NotificationKinds extends NotificationForm {

	/*NotificationKindSeq NUMBER NOT NULL,  알림번호 
	NotificationKindName VARCHAR2(127) NOT NULL,  알림이름*/
	private int notificationKindSeq;
	private String notificationKindName;
	
	public int getNotificationKindSeq() {
		return notificationKindSeq;
	}
	public void setNotificationKindSeq(int notificationKindSeq) {
		this.notificationKindSeq = notificationKindSeq;
	}
	public String getNotificationKindName() {
		return notificationKindName;
	}
	public void setNotificationKindName(String notificationKindName) {
		this.notificationKindName = notificationKindName;
	}
	
	
}
