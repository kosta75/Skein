package kr.co.skein.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.FriendshipNotification;
import kr.co.skein.model.Notification;

public interface NotificationDao {

	public List<Notification> getNotificationList(String personalURI) throws ClassNotFoundException, SQLException;
	
	public int friendshipNotificationReg(FriendshipNotification friendshipNotification) throws ClassNotFoundException, SQLException;	
}
