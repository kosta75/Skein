package kr.co.skein.model.vo;


public class FriendshipNotificationCommand extends NotificationCommand{

	private String friendEmail;
	private int friendshipConfirm;
	
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
