package kr.co.skein.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@RequestMapping(value="/registry", method=RequestMethod.POST)
	public String registry(){
		return "redirect:/";
	}
}
