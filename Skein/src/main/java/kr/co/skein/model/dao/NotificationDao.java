package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.NotificationAllCommand;
import kr.co.skein.model.vo.NotificationCommand;
import kr.co.skein.model.vo.NotificationCountCommand;
import kr.co.skein.model.vo.ReplyNotificationCommand;

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
	
}
