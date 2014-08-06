package kr.co.skein.controller;

import java.util.Date;

import kr.co.skein.model.HistoryPost;
import kr.co.skein.model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	/*@RequestMapping(value="/postReg", method=RequestMethod.POST)
	public @ResponseBody String postReg(String content, Model model){
		
		return content + " Add Message";
	}*/
	
	@RequestMapping(value="/postReg", method=RequestMethod.POST)
	public View postReg(String content, Model model){
		HistoryPost historyPost = new HistoryPost();
		
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
		historyPost.setBoardSeq(1);
		historyPost.setContent(content);
		historyPost.setBoardKindSeq(1);
		historyPost.setHistorySeq(1);
		historyPost.setFeeling("기분 좋음");
		historyPost.setWeather("비오는날");
		historyPost.setIsImportant(0);
		historyPost.setIsShare(0);
		historyPost.setKeyword("키워드");
		historyPost.setPlace("장소");
		historyPost.setGroupSeq(1);
		
		//DB에 저장되는 순서!
		//1. Board 테이블에 최초 글 생성!
		//2. History 테이블에서 Board 테이블에서 생긴 식별번호 참조
		
		
		model.addAttribute("post", historyPost);
		return jsonView;
	}
	
	@RequestMapping(value="/morePost", method=RequestMethod.GET)
	public View morePost(ModelMap model){
		Member member = new Member();
		member.setEmail("Test");
		model.addAttribute("member", member);
		return jsonView;
	}
}
