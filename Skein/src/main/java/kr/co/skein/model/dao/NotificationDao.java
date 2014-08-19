package kr.co.skein.model.dao;

import java.sql.SQLException;

import kr.co.skein.model.vo.FriendshipNotificationCommand;
import kr.co.skein.model.vo.NotificationCommand;

public interface NotificationDao {
	
	//사용자 알림 등록
	public int notificationReg(NotificationCommand command) throws ClassNotFoundException, SQLException;
	
	//가장 큰 사용자알림 식별번호 얻기 
	public int getNotificationMaxSequence() throws ClassNotFoundException, SQLException;

	//친구 알림 등록
	public int friendshipNotificationReg(FriendshipNotificationCommand command) throws ClassNotFoundException, SQLException;
	
	//가장 큰 친구 알림 식별번호 얻기
	public int getFriendshipNotificationMaxSequence() throws ClassNotFoundException, SQLException;
}
