package kr.co.skein.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.model.Member;
import kr.co.skein.util.CustomFormChecker;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String createMember(@RequestParam("year") int year,@RequestParam("month") int month,@RequestParam("date") int date, Member member, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		/*
		 * set 해야할 데이터
		 * fullName : lastName + firstName
		 * birthday
		 *  - 생일을 적은 년, 월, 일 값의 검증이 선행되어야 한다.
		 *  - 검증은 따로 클래스를 만들거나, 아무튼 방법 만들어서 사용!
		 */
				
		String lastName = member.getLastName();
		String firstName = member.getFirstName();
		
		//new CustomFormChecker().check(year, month, date);
		
		member.setFullName(lastName+firstName);
		
		System.out.println(member.toString());
		System.out.println("year: " + year);
		System.out.println("month: " + month);
		System.out.println("date: " + date);
		
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		
		
		
		String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LedCfgSAAAAAKFaVC8NM209qL-CFiOWd0C7ICXV");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
          System.out.println("Answer was entered correctly!");
          memberDao.memberReg(member);
          return "redirect:/";
        } else {
          System.out.println("Answer is wrong");
          return "joinus.registerMember";
        }
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "joinus.login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost(){
		return "redirect:/";
	}
}
