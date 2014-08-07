package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.dao.PostDao;
import kr.co.skein.model.HistoryPost;

import org.apache.ibatis.session.SqlSession;
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
	public String home(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
		MemberDao memberDao = sqlsession.getMapper(MemberDao.class);
		HttpSession session = request.getSession();
		
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null){
			SecurityContextImpl sci = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			if(session.getAttribute("PersonalURI") == null){
				session.setAttribute("PersonalURI", memberDao.getPersonalURI(user.getUsername()));
			}
			PostDao postDao = sqlsession.getMapper(PostDao.class);
			List<HistoryPost> list = postDao.getHistoryPosts(user.getUsername());
			model.addAttribute("list", list);
		}
		
		
		
		
		return "index";
	}
	
}
