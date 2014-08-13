package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.skein.dao.FriendshipDao;
import kr.co.skein.model.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/friendship/*")
public class FriendshipController {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/searchFriends", method=RequestMethod.POST)
	public View searchFriends(String email, String friendName, Model model) throws ClassNotFoundException, SQLException{
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("email", email);
		parameters.put("friendName", friendName);
		
		List<Member> list = friendshipDao.searchFriends(parameters);
		model.addAttribute("list", list);
		return jsonview;
	}
	
	@RequestMapping(value="/searchMembers", method=RequestMethod.GET)
	public String searchFriends(){
		return "friendship.searchMembers";
	}
	
	@RequestMapping(value="/searchMembers", method=RequestMethod.POST)
	public View searchMembers(String friendName, Model model) throws ClassNotFoundException, SQLException{
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		System.out.println(friendName);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("friendName", friendName);
		
		List<Member> list = friendshipDao.searchMembers(parameters);
		model.addAttribute("list", list);
		return jsonview;
	}
	
	@RequestMapping("/requestFriend")
	public String callFriend(String email, String friendName, Model model){
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);
		//friendshipDao
		//보내야할 알림 정보는?
		//어떤 사람이 보냈는지.
		//
		
		
		return "redirect:/friendship.requestFriend";
	}
}
