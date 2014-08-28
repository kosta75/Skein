package kr.co.skein.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
@RequestMapping("/share/*")
public class ShareController {
	
	@Autowired
	private View jsonView;
	
	
	//개인기록 게시물 등록
	@RequestMapping(value="/shareDo", method=RequestMethod.POST)
	public View upload(@RequestParam("checked") String[] checked, Model model) throws ClassNotFoundException, SQLException{
			
			for(int i=0; i< checked.length; i++){
				System.out.println(checked[i]);
			}
			
		return jsonView;
	}
	
}
