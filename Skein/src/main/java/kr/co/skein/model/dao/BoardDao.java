package kr.co.skein.model.dao;

import java.sql.SQLException;

import kr.co.skein.model.vo.HistoryCommand;
import kr.co.skein.model.vo.Media;

public interface BoardDao {

	//히스토리 게시물 등록
	public int historyReg(HistoryCommand command) throws ClassNotFoundException, SQLException;
	
	//그룹 등록
	public int groupReg(HistoryCommand command) throws ClassNotFoundException, SQLException;
	
	//파일 등록
	public int mediaReg(Media media) throws ClassNotFoundException, SQLException;
}
