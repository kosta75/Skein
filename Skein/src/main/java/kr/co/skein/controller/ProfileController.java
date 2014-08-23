package kr.co.skein.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.MemberDao;
import kr.co.skein.model.vo.ProfileCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public View updateProfileInfo(ProfileCommand command, Model model,HttpSession session) throws ClassNotFoundException, SQLException{
	
		
	
		return jsonView;
	

	}
}
