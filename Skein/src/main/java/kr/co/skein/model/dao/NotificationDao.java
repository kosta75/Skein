package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.NotificationCommand;
import kr.co.skein.model.vo.NotificationCountCommand;

public interface NotificationDao {
	
	//친구 알림 등록
	public int friendshipNotificationReg(FriendshipNotificationCommand friendshipNotificationCommand) throws ClassNotFoundException, SQLException;

	//사용자 알림 조회
	public List<NotificationCountCommand> getNotifications(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 친구 알림 조회
	public List<FriendshipNotificationCommand> getFriendshipNotification(String email)  throws ClassNotFoundException, SQLException;
	
	//사용자 알림 목록 조회
}
