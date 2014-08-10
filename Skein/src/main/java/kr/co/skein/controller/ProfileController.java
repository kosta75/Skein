package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.model.Member;
import kr.co.skein.model.MemberAuthority;
import kr.co.skein.model.MemberProfile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/{personalURI}")
	@Transactional
	public String userProfile(@PathVariable String personalURI, Model model) throws ClassNotFoundException, SQLException{
		/*
		 * 비로그인 사용자의 프로필 페이지 접근을 위한 컨트롤러
		 * www.domain.com/email 과 같은 형식으로 요청이 들어올 경우
		 * 도메인 이후의 문자열을 사용자의 이메일 혹은 특정 주소로 인식하여 연결시킨다.
		 * 만일 email/ 과 같은 문자열에 대해서는 에러를 발생시킨다. 
		 */
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println(personalURI);
		if(!personalURI.endsWith("/")){
			//model.addAttribute("name", customURI);
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("personalURI", personalURI);
			MemberProfile memberProfile = (MemberProfile) memberDao.getMemberProfile(parameters);
			model.addAttribute("memberProfile", memberProfile);
			
			return "profile.view";
		}else{
			return "error.incorrect";
		}
	}
	
	@RequestMapping("/profile")
	public String view(){
		return "profile.view";
	}
	
	@RequestMapping("/{personalURI}/account/certification/{certificationText}")
	public String memberCertification(@PathVariable String personalURI,@PathVariable String certificationText, Model model) throws ClassNotFoundException, SQLException{
		
		/*
		 * certificationResult
		 * 1 : 계정 등록 승인
		 * 2 : 계정 휴면 해제 승인 
		 * 3 : 계정 재등록 승인
		 * 11 : 이미 승인된 계정
		 * 88 : 폐쇄된 계정 인증 요청 
		 * 90 : 잘못된 인증 요청
		 * 99 : 인증 실패 
		 */
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-P009 - 계정인증요청, personalURI="+ personalURI + ",certificationText=" + certificationText);
		System.out.println("INFO : Skein-P010 - 계정인증처리 시작");
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "personalURI");
		parameters.put("searchValue", personalURI);
		
		
		List<Member> members = memberDao.getMembers(parameters);
		if(members.size() > 0){
			
			System.out.println("INFO : Skein-U008 - 계정 인증");
			Member member = members.get(0);
			if(member.getIsLockedOut() != 1){
				System.out.println("INFO : Skein-P010 - 계정폐쇄여부, isLockedOut=" + member.getIsLockedOut());
				if(member.getIsDropedOut() != 1){
					System.out.println("INFO : Skein-P012 - 계정탈퇴여부, isDropedOut=" + member.getIsDropedOut());
					if(member.getIsDomranted() !=1){
						System.out.println("INFO : Skein-P016 - 계정휴면여부, isDropedOut=" + member.getIsDropedOut());
						if(member.getIsApproved() !=1){
							System.out.println("INFO : Skein-P016 - 계정승인여부, isApproved=" + member.getIsApproved());
							if(certificationText.equals(member.getCertificationText())){
								System.out.println("INFO : Skein-P017 - 신규 계정 인증 확인");
								member.setIsApproved(1);
								memberDao.updateMemberAccount(member);
								memberDao.createMemberAuthority(new MemberAuthority("ROLE_USER", member.getEmail()));
								
								System.out.println("INFO : Skein-U019 - 계정 인증이 정상적으로 처리 되었습니다.");
								model.addAttribute("certificationResult", 1); //certificationResult : 1, 계정 등록 승인
								return "profile.accountSetting";
							}else{
								model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
								return "error.incorrectCertification";
							}
						}else{
							System.out.println("INFO : Skein-P016 - 계정승인여부, isApproved=" + member.getIsApproved());
							System.out.println("INFO : Skein-U019 - 이미 승인된 계정입니다.");
							model.addAttribute("certificationResult", 11); //certificationResult : 11, 이미 승인된 계정 
							return "profile.accountSetting";
						}
					}else{
						System.out.println("INFO : Skein-P016 - 계정휴면여부, isDropedOut=" + member.getIsDropedOut());
						if(certificationText.equals(member.getCertificationText())){
							System.out.println("INFO : Skein-P017 - 계정 휴면 해제 인증 확인");
							System.out.println("INFO : Skein-P018 - 계정 휴면 해제 처리");
							member.setIsDomranted(0);
							member.setIsApproved(1);
							memberDao.updateMemberAccount(member);
							
							model.addAttribute("certificationResult", 2); //certificationResult : 2, 계정 휴면 해제 승인 
							return "profile.accountSetting";
						}else{
							model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
							model.addAttribute("member", member);
							return "error.incorrectCertification";
						}
					}
				}else{
					System.out.println("INFO : Skein-P012 - 계정탈퇴여부, isDropedOut=" + member.getIsDropedOut());
					System.out.println("INFO : Skein-P013 - 계정 재등록 인증 처리");
					if(certificationText.equals(member.getCertificationText())){
						System.out.println("INFO : Skein-P014 - 계정 재등록 인증 확인");
						System.out.println("INFO : Skein-U008 - 이전 데이터 복원을 위해 경로를 이동합니다.");
						
						model.addAttribute("certificationResult", 3); //certificationResult : 3, 계정 재등록 승인
						model.addAttribute("member", member);
						return "post.restoreProcess";
						/*member.setIsDropedOut(0);
						member.setIsDomranted(0);
						member.setIsApproved(1);*/
					}else{
						model.addAttribute("certificationResult", 99); //certificationResult : 99, 인증 실패
						model.addAttribute("member", member);
						return "error.incorrectCertification";
					}
				}
			}else{
				System.out.println("INFO : Skein-P010 - 계정폐쇄여부, isLockedOut=" + member.getIsLockedOut());
				System.out.println("INFO : Skein-U008 - 폐쇄된 계정에 대한 인증 요청입니다.");
				System.out.println("INFO : Skein-P011 - 계정인증처리 종료");
				
				model.addAttribute("certificationResult", 88); //certificationResult : 99, 폐쇄된 계정 인증 요청
				return "error.incorrectCertification";
			}
			
		}else{
			System.out.println("INFO : Skein-U008 - 올바르지 않은 인증 요청입니다.");
			model.addAttribute("certificationResult", 90); //certificationResult : 90, 잘못된 인증 요청
			return "error.incorrectCertification";
		}
	}
}
