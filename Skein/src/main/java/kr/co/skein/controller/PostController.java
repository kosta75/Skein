package kr.co.skein.controller;

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
		
		historyPost.setContent(content);
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
