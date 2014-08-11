package kr.co.skein.model.dao;

import java.sql.SQLException;

import kr.co.skein.model.vo.HistoryCommand;

public interface BoardDao {

	//히스토리 게시물 등록
	public int historyReg(HistoryCommand historyCommand) throws ClassNotFoundException, SQLException;
}
