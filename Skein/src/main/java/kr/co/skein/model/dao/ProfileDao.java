package kr.co.skein.model.dao;

import java.sql.SQLException;

import kr.co.skein.model.vo.ProfileCommand;

public interface ProfileDao {

	public int updateProfile(ProfileCommand command) throws ClassNotFoundException, SQLException;
}
