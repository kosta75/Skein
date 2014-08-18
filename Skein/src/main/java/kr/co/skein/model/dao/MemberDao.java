package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.skein.model.vo.Authority;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.ProfileCommand;
import kr.co.skein.model.vo.SearchMemberCommand;

public interface MemberDao {

	//사용자 목록(기본정보) 조회
		public List<Member> getMembers(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
		
		//사용자 등록(기본정보)
		public int registerMember(Member member) throws ClassNotFoundException, SQLException;

		//사용자 정보 갱신(기본 계정정보)
		public int updateMemberAccount(Member member) throws ClassNotFoundException, SQLException;
		
		//사용자 권한 등록(기본권한)
		public int createMemberAuthority(Authority authority) throws ClassNotFoundException, SQLException;
		
		//사용자 고유 주소 조회
		public String getPersonalURI(String email) throws ClassNotFoundException, SQLException;
		
		//사용자 정보 조회
		public Member getMemberInfo(String email) throws ClassNotFoundException, SQLException;
		
		//사용자 테마 컬러 등록
		public int updateColorTheme(String colorTheme,String email) throws ClassNotFoundException, SQLException;

		//사용자 테마 컬러 조회
		public String selectColorTheme(String email) throws ClassNotFoundException, SQLException;
		
		//사용자 상세 프로필 조회
		public List<ProfileCommand> getMemberProfiles(String personalURI) throws ClassNotFoundException, SQLException;
		
		//사용자 검색 searchMembers
		public List<SearchMemberCommand> searchMembers(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
		
}
