package kr.co.skein.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.skein.dao.PostDao;
import kr.co.skein.model.HistoryPost;
import kr.co.skein.model.Member;
import kr.co.skein.model.Post;

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
		
		//historyPost.setBoardSeq(1); //set �븞�빐�룄 �맖
		//historyPost.setContent(content);
		historyPost.setBoardKindSeq(2); //set �빐二쇱뼱�빞 �맖
		//historyPost.setHistorySeq(1);  //set �븞�빐�룄 �맖
		historyPost.setEmail(email); //set �빐�빞 �븿
		//historyPost.setPublicLevelCode(1); //set �빐�빞 �븿
		
		historyPost.setFeeling("湲곕텇 醫뗭쓬");
		historyPost.setWeather("鍮꾩삤�뒗�궇");
		historyPost.setIsImportant(0);
		historyPost.setIsShare(0);
		historyPost.setKeyword("�궎�썙�뱶");
		historyPost.setPlace("�옣�냼");
		//historyPost.setGroupSeq(1); //set �븞�빐�룄 �맖
		
		//DB�뿉 ���옣�릺�뒗 �닚�꽌!
		//1. Board �뀒�씠釉붿뿉 理쒖큹 湲� �깮�꽦!
		//2. History �뀒�씠釉붿뿉�꽌 Board �뀒�씠釉붿뿉�꽌 �깮湲� �떇蹂꾨쾲�샇 李몄“
		//3. 李몄“�븳 湲� 踰덊샇瑜� �씠�슜�빐�꽌 異붽��젙蹂� �엯�젰
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
	
	
	@RequestMapping(value="/getHistoryPost", method=RequestMethod.POST)
	public View detailView(Model model,@RequestParam("boardSeq") int boardSeq ) throws ClassNotFoundException, SQLException{
		PostDao postDao = sqlSession.getMapper(PostDao.class);
		HistoryPost post = postDao.getHistoryPost(boardSeq);
		model.addAttribute("post",post);
		
		System.out.println(post.getContent()+post.getFullName()+post.getWriteDate());
		return jsonView;
	}
}
