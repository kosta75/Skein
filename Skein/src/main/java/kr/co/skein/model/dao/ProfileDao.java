package kr.co.skein.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.skein.model.vo.profile.MemberProfile;
import kr.co.skein.model.vo.ProfileCommand;

public interface ProfileDao {

	//사용자 프로필 조회
	public List<ProfileCommand> getMemberProfiles(String email) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 존재여부 확인
	public int countProfiles(ProfileCommand profileCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 추가
	public int insertProfile(ProfileCommand profileCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 업데이트
	public int updateProfile(ProfileCommand profileCommand) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 코드로 프로필 조회
	public String getMemberProfileByProfileCode(String personalURI, int profileCode) throws ClassNotFoundException, SQLException;
	
	//사용자 프로필 삭제
	public int deleteProfile(ProfileCommand profileCommand) throws ClassNotFoundException, SQLException;
	
	
	
	//사용자 프로필 조회
	public List<MemberProfile> getMemberProfileList(String email, String isSelf) throws ClassNotFoundException, SQLException;
	
	
}
