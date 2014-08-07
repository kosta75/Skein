package kr.co.skein.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.PublicLevel;

public interface PublicLevelDao {
	
	public List<PublicLevel> getPublicLevelList() throws ClassNotFoundException, SQLException;
}
