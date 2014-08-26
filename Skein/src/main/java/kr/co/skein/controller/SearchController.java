package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.Member;
import kr.co.skein.model.vo.SearchMemberCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/search/*")
public class SearchController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	//사용자 검색은 search/members , search/friends 두가지로
	@RequestMapping(value="/members", method=RequestMethod.GET)
	public String searchMembers() throws ClassNotFoundException, SQLException{
		return "search.searchMembers";
	}
	
	@RequestMapping(value="/members", method=RequestMethod.POST)
	public String searchMembers(@RequestParam("fullName") String fullName, HttpSession session, Model model) throws ClassNotFoundException, SQLException{
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("INFO : Skein-M006 - 사용자 검색 요청, fullName=" + fullName);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("searchNameValue", fullName);
		
		if (session.getAttribute("SPRING_SECURITY_CONTEXT") != null) {
			System.out.println("INFO : Skein-P102 - 로그인한 사용자 처리");
			SecurityContextImpl sci = (SecurityContextImpl) session.getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			String userName = user.getUsername();
			
			parameters.put("ignoreEmailValue", userName);
			
			Member member = memberDao.getMemberInfo(user.getUsername());
			String colorTheme = memberDao.selectColorTheme(user.getUsername());

			if (colorTheme == null || colorTheme.equals("")) {
				model.addAttribute("colorTheme", "blue");
			} else {
				model.addAttribute("colorTheme", " " + colorTheme);
			}
		}

		List<SearchMemberCommand> list = memberDao.searchMembers(parameters);
		System.out.println("INFO : Skein-M006 - 검색 결과, " + list.size());
		
		model.addAttribute("list", list);
		return "search.searchMembers";
	}
}
