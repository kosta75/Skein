package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.dao.MemberDao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value={"/","/index.skein"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		HttpSession session = request.getSession();
		
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null){
			if(session.getAttribute("PersonalURI") == null){
				SecurityContextImpl sci = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
				UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();			
				//System.out.println(user.getUsername());
				//System.out.println(memberDao.getPersonalURI(user.getUsername()));
				session.setAttribute("PersonalURI", memberDao.getPersonalURI(user.getUsername()));
			}
		}
		return "index";
	}
	
}
