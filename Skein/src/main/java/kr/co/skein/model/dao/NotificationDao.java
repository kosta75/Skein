package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.NotificationAllCommand;
import kr.co.skein.model.vo.NotificationCommand;
import kr.co.skein.model.vo.NotificationCountCommand;
import kr.co.skein.model.vo.ReplyNotificationCommand;
import kr.co.skein.model.vo.notification.FriendshipNotification;

import kr.co.skein.model.vo.notification.ReplyNotification;
import kr.co.skein.model.vo.notification.ShareNotification;

import kr.co.skein.model.vo.notification.MemberNotification;


public interface NotificationDao {
	
	//친구 알림 등록
	public int friendshipNotificationReg(FriendshipNotificationCommand friendshipNotificationCommand) throws ClassNotFoundException, SQLException;
	
	//댓글 알림 등록
	public int replyNotificationReg(ReplyNotificationCommand replyNotificationCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 알림 조회
	public List<NotificationCountCommand> getNotifications(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 친구 알림 조회
	public List<FriendshipNotificationCommand> getFriendshipNotification(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 알림 목록 조회
	public List<NotificationAllCommand> getNotificationAllList(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 알림 목록 조회-(카테고리별 검색)
	public List<NotificationAllCommand> getNotificationListSort(String email, String alramSeq) throws ClassNotFoundException, SQLException;
	
	//알림 조회
	public FriendshipNotificationCommand getFriendshipNotificationByNotificationSeq(int notificationSeq) throws ClassNotFoundException, SQLException;
	
	//알림 조회
	public List<FriendshipNotificationCommand> getFriendshipNotificationBoth(String email, String friendEmail) throws ClassNotFoundException, SQLException;
	
	//친구 알림 수정
	public int updateFriendshipNotification(FriendshipNotificationCommand friendshipNotificationCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 알림 수정
	public int updateNotification(NotificationCommand notificationCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 알림 삭제
	public int deleteNotification(int notificationSeq) throws ClassNotFoundException, SQLException;
	
	//모든 알림 읽음
	public int allNotificationRead(String email) throws ClassNotFoundException, SQLException;
	
	
	
	

	
	public List<FriendshipNotification> getFriendshipNotifications(String email) throws ClassNotFoundException, SQLException;
	public List<ReplyNotification> getReplyNotifications(String email) throws ClassNotFoundException, SQLException;
	public List<ShareNotification> getShareNotifications(String email) throws ClassNotFoundException, SQLException;
	
	

	public List<MemberNotification> getMemberNotificationList(String email) throws ClassNotFoundException, SQLException;
	public FriendshipNotification getFriendshipNotificationDetail(int notificationSeq) throws ClassNotFoundException, SQLException;

}
