package kr.co.skein.model.vo.notification;

import kr.co.skein.model.vo.MemberBoardCommand;

public class ShareNotification extends Notification{

	private String boardSeq;
	private String senderEmail;
	private int shareConfirm;
	private int shareType;
	
	private MemberBoardCommand memberBoardCommand;
	private String profileImageFileName;
	
	
	
	public String getProfileImageFileName() {
		return profileImageFileName;
	}
	public void setProfileImageFileName(String profileImageFileName) {
		this.profileImageFileName = profileImageFileName;
	}
	public MemberBoardCommand getMemberBoardCommand() {
		return memberBoardCommand;
	}
	public void setMemberBoardCommand(MemberBoardCommand memberBoardCommand) {
		this.memberBoardCommand = memberBoardCommand;
	}
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	public int getShareConfirm() {
		return shareConfirm;
	}
	public void setShareConfirm(int shareConfirm) {
		this.shareConfirm = shareConfirm;
	}
	public int getShareType() {
		return shareType;
	}
	public void setShareType(int shareType) {
		this.shareType = shareType;
	}
	
}
