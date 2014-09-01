package kr.co.skein.model.vo.notification;

import java.util.List;

import kr.co.skein.model.vo.profile.MemberProfile;

public class FriendshipNotification extends Notification {

	private String friendEmail;
	private int friendshipConfirm;
	private List<MemberProfile> memberProfileList;
	
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
	public List<MemberProfile> getMemberProfileList() {
		return memberProfileList;
	}
	public void setMemberProfileList(List<MemberProfile> memberProfileList) {
		this.memberProfileList = memberProfileList;
	}
}
