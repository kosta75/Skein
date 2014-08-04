package kr.co.skein.dao;

import java.sql.SQLException;

import kr.co.skein.model.Member;

public interface MemberDao {
	
	public int getTotalCount() throws ClassNotFoundException, SQLException;
	
	public Member getMember(String email) throws ClassNotFoundException, SQLException;
	
	public int memberReg(Member member) throws ClassNotFoundException, SQLException;

}
