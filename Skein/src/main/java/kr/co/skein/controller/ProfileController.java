package kr.co.skein.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.ProfileDao;
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

//프로필 수정시에 사용할 컨트롤러
@Controller
@RequestMapping("/profile/*")
public class ProfileController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public View updateProfileInfo(ProfileCommand command, Model model) throws ClassNotFoundException, SQLException{
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		System.out.println(command.getEmail());
		if(profileDao.countProfiles(command) > 0){
			profileDao.updateProfile(command);
		}else{
			profileDao.insertProfile(command);
		}

		return jsonView;
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public View deleteProfileInfo(ProfileCommand command, Model model) throws ClassNotFoundException, SQLException{
		ProfileDao profileDao = sqlSession.getMapper(ProfileDao.class);
		if(profileDao.deleteProfile(command) > 0){
			model.addAttribute("result", "success");
		}
		return jsonView;
	}
}
