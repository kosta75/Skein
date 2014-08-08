package kr.co.skein.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.skein.model.Member;
import kr.co.skein.model.MemberAuthority;
import kr.co.skein.model.MemberProfile;

public interface MemberDao {
		
	//사용자 목록(기본정보) 조회
	public List<Member> getMembers(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
	
	//사용자 등록(기본정보)
	public int registerMember(Member member) throws ClassNotFoundException, SQLException;

	//사용자 정보 갱신(기본 계정정보)
	public int updateMemberAccount(Member member) throws ClassNotFoundException, SQLException;
	
	//사용자 권한 등록(기본권한)
	public int createMemberAuthority(MemberAuthority memberAuthority) throws ClassNotFoundException, SQLException;
	
	
	
	
	
	
	
	
	//전체 사용자 수 조회
	public int getTotalCount() throws ClassNotFoundException, SQLException;
		
	//사용자 등록 여부 조회
	public int isRegisteredMember(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 로그인 정보 확인 - Security 사용 하지 않을 경우를 위해 작성
	public int validMember(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
	
	//사용자 고유 주소 조회
	public String getPersonalURI(String email) throws ClassNotFoundException, SQLException;
	
	//사용자(1명) 조회
	//public Member getMember(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 등록(INSERT)
	
	
	//사용자 권한 등록(INSERT)
	//public int createMemberAuthority(MemberAuthority memberAuthority) throws ClassNotFoundException, SQLException;
	
	//사용자 고유 주소 수 조회 - 사용자 고유 주소 생성을 위해 사용된다.
	public int getCountOfPersonalURI(Map<String, String> parameters) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 조회
	public Member getMemberProfile (Map<String, String> parameters) throws ClassNotFoundException, SQLException;
	
	public int memberProfileReg(MemberProfile memberProfile) throws ClassNotFoundException, SQLException;

}
