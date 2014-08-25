package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.Member;

public interface AccountDao {

	//아이디 검색
	public List<String> getAccountEmails(Member member) throws ClassNotFoundException, SQLException;
	
	//내 아이디 검색
	public String getAccountEmail(Member member) throws ClassNotFoundException, SQLException;
	
	//임시비밀번호 변경
	public int updateAccountPassword(Member member) throws ClassNotFoundException, SQLException;
	
	//현재 비밀번호 확인 
	public String getAccountPassword(String email) throws ClassNotFoundException, SQLException;
	
}
