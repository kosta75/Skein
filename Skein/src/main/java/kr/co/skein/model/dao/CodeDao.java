package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.PublicLevelCommand;

public interface CodeDao {

	//공개범위 코드 조회
	public List<PublicLevelCommand> getPublicLevelCodes() throws ClassNotFoundException, SQLException;
}
