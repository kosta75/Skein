package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.dao.PostDao;
import kr.co.skein.model.HistoryPost;
import kr.co.skein.model.Member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired
	private View jsonView;
	
	@Autowired
	private SqlSession sqlSession;
	

	/*@RequestMapping(value="/postReg", method=RequestMethod.POST)
	public @ResponseBody String postReg(String content, Model model){
		
		return content + " Add Message";
	}*/
	
	@RequestMapping(value="/postReg", method=RequestMethod.POST)
	@Transactional
	public String postReg(HistoryPost historyPost, HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException{
		PostDao postDao = sqlSession.getMapper(PostDao.class);
		HttpSession session = request.getSession();
		
		String email = "";
		
		if(session.getAttribute("SPRING_SECURITY_CONTEXT") != null){
			SecurityContextImpl sci = (SecurityContextImpl) request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
			UserDetails user = (UserDetails) sci.getAuthentication().getPrincipal();
			email = user.getUsername();
		}
		
		//HistoryPost historyPost = new HistoryPost();
		
		/*private int boardSeq;
		private String content;
		private Date writeDate;
		private int boardKindSeq;
		private String email;
		private int publicLevelCode;
		private int historySeq;
		private Date startDate;
		private Date endDate;
		private String feeling;
		private String weather;
		private int isImportant;
		private int isShare;
		private String keyword;
		private String place;
		private int groupSeq;*/
		
		//historyPost.setBoardSeq(1); //set 안해도 됨
		//historyPost.setContent(content);
		historyPost.setBoardKindSeq(2); //set 해주어야 됨
		//historyPost.setHistorySeq(1);  //set 안해도 됨
		historyPost.setEmail(email); //set 해야 함
		//historyPost.setPublicLevelCode(1); //set 해야 함
		
		historyPost.setFeeling("기분 좋음");
		historyPost.setWeather("비오는날");
		historyPost.setIsImportant(0);
		historyPost.setIsShare(0);
		historyPost.setKeyword("키워드");
		historyPost.setPlace("장소");
		//historyPost.setGroupSeq(1); //set 안해도 됨
		
		//DB에 저장되는 순서!
		//1. Board 테이블에 최초 글 생성!
		//2. History 테이블에서 Board 테이블에서 생긴 식별번호 참조
		//3. 참조한 글 번호를 이용해서 추가정보 입력
		postDao.postReg(historyPost);
		int boardSeq = postDao.getMaxNumberOfPost();
		historyPost.setBoardSeq(boardSeq);
		postDao.historyPostReg(historyPost);
		
		
		//model.addAttribute("post", historyPost);
		model.addAttribute("post", postDao.getHistoryPost(boardSeq));
		return "redirect:/";
	}
	
	@RequestMapping(value="/morePost", method=RequestMethod.GET)
	public View morePost(ModelMap model){
		Member member = new Member();
		member.setEmail("Test");
		model.addAttribute("member", member);
		return jsonView;
	}
}
