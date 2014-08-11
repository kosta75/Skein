package kr.co.skein.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value={"/","/index.skein"}, method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		
		
		System.out.println("INFO : Skein-P101 - 서비스 접속 요청");
		/*if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null){
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			if(session.getAttribute("PersonalURI") == null){
				System.out.println("INFO : Skein-P103 - 사용자 진입 요청에 관한 처리");
				String personalURI = memberDao.getPersonalURI(user.getUsername());
				session.setAttribute("PersonalURI", personalURI);
				System.out.println("INFO : Skein-I102 - 사용자 고유주소 조회. personalURI=" + personalURI);	
			}else{
				System.out.println("INFO : Skein-I101 - 현재 유효한 접속이 존재합니다. user=" + user);
			}
		}*/
		return "index";
	}
}
