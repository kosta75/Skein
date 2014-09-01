package kr.co.skein.model.vo.notification;

public class MemberNotification extends Notification{

	private String notificationSenderName;
	private String notificationSenderURI;
	
	public String getNotificationSenderName() {
		return notificationSenderName;
	}
	public void setNotificationSenderName(String notificationSenderName) {
		this.notificationSenderName = notificationSenderName;
	}
	public String getNotificationSenderURI() {
		return notificationSenderURI;
	}
	public void setNotificationSenderURI(String notificationSenderURI) {
		this.notificationSenderURI = notificationSenderURI;
	}
	
	
}
