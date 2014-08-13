package kr.co.skein.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private EmailSender emailSender;

	@RequestMapping("/login")
	public String login(){
		return "joinus.login";
	}
	
	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public String registerMember(){
		return "joinus.registerMember";
	}
	
	@RequestMapping(value="/registerMember", method=RequestMethod.POST)
	public String registerMember(Member member) throws Exception{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-P001 - 회원등록처리 시작");
		//1. form 유효성 검사
		
		
		//2. 등록된 계정 여부
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchKey", "email");
		parameters.put("searchValue", member.getEmail());
		
		List<Member> members = memberDao.getMembers(parameters);
		System.out.println("INFO : Skein-P002 - 사용자 조회, param=email,value="+member.getEmail());
		System.out.println("INFO : Skein-P003 - 사용자 조회 결과 : size="+members.size());
		if(members.size() == 0){
			System.out.println("INFO : Skein-U001 - 등록된 사용자가 없습니다. 신규 계정으로 등록합니다.");
			System.out.println("INFO : Skein-P004 - 사용자 계정 정보 초기 설정");
			member.setIsLockedOut(0);
			member.setIsDropedOut(0);
			member.setIsDomranted(0);
			member.setIsApproved(0);
			
			//2-1. 계정정보 주입
			member.setFullName(member.getLastName() + member.getFirstName());
			System.out.println("INFO : Skein-P005 - 사용자 고유 주소 생성 및 주입, fullName=" + member.getFullName());

			//3. PersonalURI(사용자 고유 주소) 생성
			String email = member.getEmail();
			String personalURI = email.substring(0, email.indexOf("@"));

			Map<String, String> param2 = new HashMap<String, String>();
			parameters.put("searchKey", "customURI");
			parameters.put("searchValue", personalURI);

			int size = memberDao.getMembers(param2).size(); 
			if(size > 0){
				personalURI = personalURI + "" + size;
			}	
			member.setPersonalURI(personalURI);
			System.out.println("INFO : Skein-P006 - 사용자 고유 주소 생성 및 주입, personalURI=" + member.getPersonalURI());
			
			//4. CertificationText(계정인증문자) 생성
			// ----------------------------------------------------------------- >>>>>>>>>>>>> 수정해야할 부분
			String certificationText = "a2b7a8c9d9e0b8e0a0f0e6a3";
			member.setCertificationText(certificationText);
			System.out.println("INFO : Skein-P007 - 계정인증코드 생성 및 주입, certificationText=" + member.getCertificationText());
			
			//사용자 입력 값 확인
			member.toString();
			
			//5. 사용자 정보 입력
			int result = memberDao.registerMember(member);
			if(result > 0){
				System.out.println("INFO : Skein-U003 - 신규계정등록에 성공하였습니다.");
				emailSender.SendEmail("univcss@gmail.com", member.getEmail(), "신규 계정 인증 메일!", "http://localhost:8080/skein/"+personalURI + "/account/certification/check/" + member.getCertificationText());
			}else{
				System.out.println("INFO : Skein-U004 - 신규계정등록에 실패하였습니다.");
			}
		}else{
			System.out.println("INFO : Skein-U002 - 이미 등록된 계정입니다.");
			member = members.get(0);
			if(member.getIsDropedOut() != 0){
				System.out.println("INFO : Skein-U004 - 탈퇴 계정입니다.");
				System.out.println("INFO : Skein-P008 - 계정 재등록 처리 진행");
				
				//4. CertificationText(계정인증문자) 생성
				// ----------------------------------------------------------------- >>>>>>>>>>>>> 수정해야할 부분
				String certificationText = "a2b7a8c9d9e0b8e0a0f0e6a3";
				member.setCertificationText(certificationText);
				System.out.println("INFO : Skein-P007 - 계정인증코드 생성 및 주입, certificationText=" + member.getCertificationText());
				
				//사용자 입력 값 확인
				member.toString();
				
				int result = memberDao.updateMemberAccount(member);
				if(result > 0){
					System.out.println("INFO : Skein-U005 - 계정 재등록에 성공하였습니다.");
					emailSender.SendEmail("univcss@gmail.com", member.getEmail(), "재등록 인증 메일!", "http://localhost:8080/skein/"+member.getPersonalURI() + "/account/certification/check/" + member.getCertificationText());
				}else{
					System.out.println("INFO : Skein-U006 - 계정 재등록에 실패하였습니다.");
				}
			}
		}
		System.out.println("INFO : Skein-U007 - 회원가입 처리 진행을 종료합니다.");
		
		return "redirect:/";
	}
}