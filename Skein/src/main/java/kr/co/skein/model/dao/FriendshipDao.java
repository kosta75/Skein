package kr.co.skein.model.dao;

import java.sql.SQLException;

public interface FriendshipDao {

	//친구 추가
	public int addFriends(String email) throws ClassNotFoundException, SQLException;
	
}
