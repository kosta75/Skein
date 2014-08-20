package kr.co.skein.model.vo;

public class MemberNotificationCommand extends NotificationCommand{

	private int friendshipNotificationSeq;
	private String friendEmail;
	private int friendshipConfirm;
	
	public int getFriendshipNotificationSeq() {
		return friendshipNotificationSeq;
	}
	public void setFriendshipNotificationSeq(int friendshipNotificationSeq) {
		this.friendshipNotificationSeq = friendshipNotificationSeq;
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
	
	
}
