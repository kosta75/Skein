package kr.co.skein.controller;

import kr.co.skein.model.Member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {

	@RequestMapping(value="/registermember", method=RequestMethod.GET)
	public String createMember(){
		return "joinus.createMember";
	}
	
	@RequestMapping(value="/registermember", method=RequestMethod.POST)
	public String createMember(Member member){
		
		return "";
	}
}
