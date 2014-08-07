package kr.co.skein.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.HistoryPost;
import kr.co.skein.model.Post;

public interface PostDao {

	public int postReg(Post post) throws ClassNotFoundException, SQLException;
	
	public int getMaxNumberOfPost() throws ClassNotFoundException, SQLException;
	
	public int historyPostReg(HistoryPost post) throws ClassNotFoundException, SQLException;
	
	public HistoryPost getHistoryPost(int boardSeq) throws ClassNotFoundException, SQLException;
	
	public List<HistoryPost> getHistoryPosts(String email) throws ClassNotFoundException, SQLException;
}
