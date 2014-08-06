package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.model.Member;
import kr.co.skein.model.MemberAuthority;
import kr.co.skein.util.CustomFormChecker;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value="/registerMember", method=RequestMethod.GET)
	public String createMember(){
		return "joinus.registerMember";
	}
	
	@RequestMapping(value="/registerMember", method=RequestMethod.POST)
	@Transactional
	public String createMember(@RequestParam("year") int year,@RequestParam("month") int month,@RequestParam("date") int date, Member member, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		/*
		 * set 해야할 데이터
		 * fullName : lastName + firstName
		 * birthday
		 *  - 생일을 적은 년, 월, 일 값의 검증이 선행되어야 한다.
		 *  - 검증은 따로 클래스를 만들거나, 아무튼 방법 만들어서 사용!
		 * 
		 * Member
		 */
		
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
			System.out.println("INFO : Skein-I001 : 회원등록이 정상적으로 이루어졌습니다");
			return "redirect:/";
		}
		
	}
	
	
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
