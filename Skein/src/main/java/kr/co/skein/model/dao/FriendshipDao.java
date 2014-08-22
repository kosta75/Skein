package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.FriendshipListCommand;

public interface FriendshipDao {

	//친구 추가
	public int addFriends(String email, String friendEmail) throws ClassNotFoundException, SQLException;
	
	//친구 페이지 
		public List<FriendshipListCommand> getFriendList(String email, int startNum, int endNum) throws ClassNotFoundException, SQLException;

}
