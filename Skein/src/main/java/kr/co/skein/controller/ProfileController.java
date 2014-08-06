package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.skein.dao.MemberDao;
import kr.co.skein.model.MemberProfile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/*")
	public String userProfile(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException{
		/*
		 * 비로그인 사용자의 프로필 페이지 접근을 위한 컨트롤러
		 * www.domain.com/email 과 같은 형식으로 요청이 들어올 경우
		 * 도메인 이후의 문자열을 사용자의 이메일 혹은 특정 주소로 인식하여 연결시킨다.
		 * 만일 email/ 과 같은 문자열에 대해서는 에러를 발생시킨다. 
		 */
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String customURI = requestURI.substring(contextPath.length()+1);
		System.out.println(request.getContextPath() + " / " + request.getRequestURI());
		System.out.println(customURI);
		if(!customURI.endsWith("/")){
			//model.addAttribute("name", customURI);
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("personalURI", customURI);
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
}
