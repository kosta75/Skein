package kr.co.skein.model;

public class FriendshipNotification extends Notification {

	/*FriendshipNotificationSeq NUMBER NOT NULL,  친구알림식별번호 
	NotificationSeq NUMBER NOT NULL,  사용자알림번호 
	Email VARCHAR2(127) NOT NULL,  이메일 
	FriendEmail VARCHAR2(127) NOT NULL,  친구이메일 
	FriendshipConfirm INT  친구신청확인 */
	
	private int friendshipNotificationSeq;
	private int friendshipConfirm;
	private String friendEmail;
	
	public int getFriendshipNotificationSeq() {
		return friendshipNotificationSeq;
	}
	public void setFriendshipNotificationSeq(int friendshipNotificationSeq) {
		this.friendshipNotificationSeq = friendshipNotificationSeq;
	}
	public int getFriendshipConfirm() {
		return friendshipConfirm;
	}
	public void setFriendshipConfirm(int friendshipConfirm) {
		this.friendshipConfirm = friendshipConfirm;
	}
	public String getFriendEmail() {
		return friendEmail;
	}
	public void setFriendEmail(String friendEmail) {
		this.friendEmail = friendEmail;
	}
	
	
	
}
