package kr.co.skein.model.dao;

import java.sql.SQLException;

public interface ShareDao {

	//공유한 게시물 있는지 확인
	public int hasShareBoard(String shareEmail, int boardSeq) throws ClassNotFoundException, SQLException;
}