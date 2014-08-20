package kr.co.skein.controller;

import kr.co.skein.model.dao.TestDao;
import kr.co.skein.model.vo.TestCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test/*")
public class TestController {
	
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String writeTest(){
		return "test.test";
	}
	
	@RequestMapping(value="/test", method=RequestMethod.POST)
	public String writeTest(TestCommand command, Model model){
		
		TestDao testDao = sqlSession.getMapper(TestDao.class);
		
		return "test.test";
	}
	
}
