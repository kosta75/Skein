package kr.co.skein.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.skein.model.Member;

public interface FriendshipDao {

	public List<Member> searchMembers(Map<String, String> parameters)  throws ClassNotFoundException, SQLException;
	
	public List<Member> searchFriends(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
}
