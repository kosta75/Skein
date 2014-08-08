package kr.co.skein.model;

public class NotificationForm {

	/*NotificationFormCode NUMBER NOT NULL,  알림형식코드 
	NotificationFormName VARCHAR2(127) NOT NULL  알림형식이름*/ 
	private int notificationFormCode;
	private String notificationFormName;
	
	public int getNotificationFormCode() {
		return notificationFormCode;
	}
	public void setNotificationFormCode(int notificationFormCode) {
		this.notificationFormCode = notificationFormCode;
	}
	public String getNotificationFormName() {
		return notificationFormName;
	}
	public void setNotificationFormName(String notificationFormName) {
		this.notificationFormName = notificationFormName;
	}
	
	
}
