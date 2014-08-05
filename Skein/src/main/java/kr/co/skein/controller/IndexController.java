package kr.co.skein.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	@RequestMapping(value={"/","/index.skein"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request) {

		return "index";
	}
	
	@RequestMapping("/*")
	public String userProfile(HttpServletRequest request, Model model){
		/*
		 * 비로그인 사용자의 프로필 페이지 접근을 위한 컨트롤러
		 * www.domain.com/email 과 같은 형식으로 요청이 들어올 경우
		 * 도메인 이후의 문자열을 사용자의 이메일 혹은 특정 주소로 인식하여 연결시킨다.
		 * 만일 email/ 과 같은 문자열에 대해서는 에러를 발생시킨다. 
		 */
		
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String customURI = requestURI.substring(contextPath.length()+1);
		System.out.println(request.getContextPath() + " / " + request.getRequestURI());
		System.out.println(customURI);
		if(!customURI.endsWith("/")){
			model.addAttribute("name", customURI);
			return "profile.view";
		}else{
			return "error.incorrect";
		}
		 
		
		
	}
	
}
