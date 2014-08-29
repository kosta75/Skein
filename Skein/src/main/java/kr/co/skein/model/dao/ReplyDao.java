package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.Reply;


public interface ReplyDao {
	
	//댓글 알림
	public int insertReply(Reply reply) throws ClassNotFoundException, SQLException;
	
	//댓글 조회
	public List<Reply> selectReply(String boardSeq,int replyStartNum,int replyEndNum) throws ClassNotFoundException, SQLException;
	//댓글 카운트
	public int countReply(int replyCountNum,String boardSeq) throws ClassNotFoundException, SQLException;
}
