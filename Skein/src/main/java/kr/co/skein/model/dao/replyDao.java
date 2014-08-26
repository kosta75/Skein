package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.reply;


public interface replyDao {
	public int insertReply(String boardSeq,String email,String replyContent) throws ClassNotFoundException, SQLException;
	public List<reply> selectReply(String boardSeq) throws ClassNotFoundException, SQLException;
}
