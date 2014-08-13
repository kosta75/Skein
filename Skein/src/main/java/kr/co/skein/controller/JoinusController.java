package kr.co.skein.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.model.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
    private EmailSender emailSender;

	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public String registerMember(){
		return "joinus.registerMember";
	}
	
	@RequestMapping(value="/registerMember", method=RequestMethod.POST)
	public String registerMember(Member member) throws Exception{
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
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
			String certificationText = "a2b7a8c9d9e0b8e0a0f0e6a3";
			member.setCertificationText(certificationText);
			System.out.println("INFO : Skein-P007 - 계정인증코드 생성 및 주입, certificationText=" + member.getCertificationText());
			
			//사용자 입력 값 확인
			member.toString();
			
			//5. 사용자 정보 입력
			int result = memberDao.registerMember(member);
			if(result > 0){
				System.out.println("INFO : Skein-U003 - 신규계정등록에 성공하였습니다.");
				emailSender.SendEmail("univcss@gmail.com", member.getEmail(), "신규 계정 인증 메일!", "http://localhost:8080/skein/"+personalURI + "/account/certification/" + member.getCertificationText());
			}else{
				System.out.println("INFO : Skein-U004 - 신규계정등록에 실패하였습니다.");
			}
		}else{
			System.out.println("INFO : Skein-U002 - 이미 등록된 계정입니다.");
			member = members.get(0);
			if(member.getIsDropedOut() != 0){
				System.out.println("INFO : Skein-U004 - 탈퇴 계정입니다.");
				System.out.println("INFO : Skein-P008 - 계정 재등록 처리 진행");
				
				//사용자 입력 값 확인
				member.toString();
				
				int result = memberDao.updateMemberAccount(member);
				if(result > 0){
					System.out.println("INFO : Skein-U005 - 계정 재등록에 성공하였습니다.");
					emailSender.SendEmail("univcss@gmail.com", member.getEmail(), "재등록 인증 메일!", "http://localhost:8080/skein/"+member.getPersonalURI() + "/account/certification/" + member.getCertificationText());
				}else{
					System.out.println("INFO : Skein-U006 - 계정 재등록에 실패하였습니다.");
				}
			}
		}
		System.out.println("INFO : Skein-U007 - 회원가입 처리 진행을 종료합니다.");
		
		return "redirect:/";
	}
	
	
/*	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public String sendCertificationText(HttpSession session){
		
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null){
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
		}
		
		return "redirect:/";
	}*/
	
	@RequestMapping(value="/notApprovedAccept", method=RequestMethod.GET)
	public String notApprovedAccept(HttpServletRequest request,HttpSession session, Model model){
		System.out.println("INFO : Skein-P020 - 로그인 인증 예외 처리");
		if(session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION") != null){
			DisabledException exception = (DisabledException) session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
			String message = exception.getMessage();
			if(message.equals("User is disabled")){
				System.out.println("INFO : Skein-U020 - 인증되지 않은 계정입니다.");
				model.addAttribute("LOGIN_ERROR_CODE", 1);
			}else{
				model.addAttribute("LOGIN_ERROR_CODE", 0);
			}	        
		}
		return "joinus.login";
	}
	//sendCertificationText
	
	/*@InitBinder
	protected void initBinder(WebDataBinder binder){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}*/
	
	
	/*@Transactional
	public String createMember(@RequestParam("year") int year,@RequestParam("month") int month,@RequestParam("date") int date, Member member, HttpServletRequest request) throws Exception{
		
		 * set 해야할 데이터
		 * fullName : lastName + firstName
		 * birthday
		 *  - 생일을 적은 년, 월, 일 값의 검증이 선행되어야 한다.
		 *  - 검증은 따로 클래스를 만들거나, 아무튼 방법 만들어서 사용!
		 * 
		 * Member
		 
		
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		if(memberDao.getMember(member.getEmail()) != null){
			System.out.println("INFO : Skein-E001 : 이미 존재하는 회원입니다.");
			return "joinus.registerMember";
		}else{
			//1. 사용자 등록
			//2. 사용자 권한 등록
			//사용자가 제대로 등록되지 않거나, 사용자 권한이 제대로 등록되지 않으면 Rollback
			
			//Member 클래스 Set
			String lastName = member.getLastName();
			String firstName = member.getFirstName();
			
			//new CustomFormChecker().check(year, month, date);
			
			member.setFullName(lastName+firstName);
			
			System.out.println(member.toString());
			System.out.println("year: " + year);
			System.out.println("month: " + month);
			System.out.println("date: " + date);
			
			//사용자 고유주소 생성하기
			String email = member.getEmail();
			String personalURI = email.substring(0, email.indexOf("@"));
			member.setPersonalURI(personalURI);
			System.out.println(personalURI);
			
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("personalURI", personalURI);

			int countOfPersonalURI = memberDao.getCountOfPersonalURI(parameters);
			if(countOfPersonalURI > 0){
				member.setPersonalURI(personalURI + countOfPersonalURI);
			}
			
			memberDao.memberReg(member);
			memberDao.createMemberAuthority(new MemberAuthority("ROLE_USER", member.getEmail()));
			
			Email sendEmail = new Email();
			
			String reciver = "shd456@naver.com"; //받을사람의 이메일입니다.
	        String subject = "이메일 제목";
	        String content = "이메일 내용입니다.";
	         
	        sendEmail.setReciver(reciver);
	        sendEmail.setSubject(subject);
	        sendEmail.setContent(content);
	        emailSender.SendEmail(sendEmail);
	        
			
			emailSender.SendEmail("univcss@gmail.com", "shd456@naver.com", "Title", "Test Content");
			System.out.println("클래스 : Email을 전송하였습니다.");
			
			
			System.out.println("INFO : Skein-I001 : 회원등록이 정상적으로 이루어졌습니다");
			return "redirect:/";
		}
		
	}*/
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "joinus.login";
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost(String email, String password, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("email", email);
		parameters.put("password", password);
		
		if(memberDao.validMember(parameters) > 0){
			System.out.println("INFO : Skein-I002 : 정상적으로 로그인을 진행합니다.");
			System.out.println(memberDao.getPersonalURI(email));
			return "redirect:/j_spring_security_check?j_username=" + email + "&j_password=" + password;
		}else{
			System.out.println("INFO : Skein-E002 : 로그인 입력 정보가 올바르지 않습니다.");
			return "joinus.login";
		}
	}*/
}
