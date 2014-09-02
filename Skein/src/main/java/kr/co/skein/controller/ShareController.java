package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.model.dao.FriendshipDao;
import kr.co.skein.model.vo.BaseMemberInfo;
import kr.co.skein.model.vo.FriendshipListCommand;
import kr.co.skein.model.vo.ShareInfo;

import org.apache.ibatis.session.SqlSession;



import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/share/*")
public class ShareController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonView;
	
	
	@RequestMapping(value="/sharefriendlist", method = RequestMethod.POST)
	public View getFriendList(HttpSession session, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("INFO : Skein-F003 - 친구 목록 더 불러오기," );
		
		System.out.println("들어옴");
		BaseMemberInfo baseMemberInfo = (BaseMemberInfo) session.getAttribute("BASE_MEMBER_INFO");
		FriendshipDao friendshipDao = sqlSession.getMapper(FriendshipDao.class);

		System.out.println("이메일"+baseMemberInfo.getEmail());
		List<FriendshipListCommand> list = friendshipDao.getAllFriendList(baseMemberInfo.getEmail());
		System.out.println();
		model.addAttribute("list", list);
		
		for(int i =0; i< list.size(); i++){
			System.out.println("이름 :" +list.get(i).getFullname());
		}
		
		return jsonView;
	}
	
	
	//최종 공유 확인 버튼 눌렀을때 실행 
	@RequestMapping(value="/shareDo", method = RequestMethod.POST)

	public View shareDo(HttpServletRequest request,HttpSession session, Model model) throws ClassNotFoundException, SQLException, JSONException {
		
		System.out.println("INFO : Skein-F003 - 게시물 친구에게 공유하기," );
		String data = request.getParameter("json");
		JSONObject obj = new JSONObject(data);
		
		List<String> board = null;
		List<String> friend = null;
		
		
		for(int i=0; i< obj.getJSONArray("board").length(); i++){
			board.add(i, obj.getJSONArray("board").get(i).toString());
		}
		for(int i=0; i< obj.getJSONArray("friend").length(); i++){
			friend.add(i, obj.getJSONArray("friend").get(i).toString());
		}
		
		
		
		
		return jsonView;
	}
	
	
}
