package kr.co.skein.model.dao;

import java.sql.SQLException;

import kr.co.skein.model.vo.TestCommand;

public interface TestDao {

	public int writeReg(TestCommand command) throws ClassNotFoundException, SQLException;
}
