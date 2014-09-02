package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.FriendshipList;
import kr.co.skein.model.vo.FriendshipListCommand;

public interface FriendshipDao {

	//친구 추가
	public int addFriends(String email, String friendEmail) throws ClassNotFoundException, SQLException;
	
	//친구 페이지 
	public List<FriendshipListCommand> getFriendList(String email, int startNum, int endNum) throws ClassNotFoundException, SQLException;
	
	//친구 페이지
	public List<FriendshipList> getFriendshipList(String email, int startNum, int endNum) throws ClassNotFoundException, SQLException;
	
	//친구 삭제
	public int deleteFriendship(String email, String friendEmail) throws ClassNotFoundException, SQLException;

	//친구 여부 확인
	public int isFriend(String email, String friendEmail) throws ClassNotFoundException, SQLException;
	
	//share 친구 불러오기 
	public List<FriendshipListCommand> getAllFriendList(String email) throws ClassNotFoundException, SQLException;
}
