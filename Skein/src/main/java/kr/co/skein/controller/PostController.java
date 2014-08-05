package kr.co.skein.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired
	private View jsonView;

	@RequestMapping(value="/postReg", method=RequestMethod.POST)
	public @ResponseBody String postReg(String content, Model model){
		 
		return content + " Add Message";
	}
}
