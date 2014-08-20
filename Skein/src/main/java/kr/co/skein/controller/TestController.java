package kr.co.skein.controller;

import java.sql.SQLException;

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

	@RequestMapping(value="/reg", method=RequestMethod.GET)
	public String writeTest(){
		return "test.test";
	}
	
	@RequestMapping(value="/reg", method=RequestMethod.POST)
	public String writeTest(TestCommand command, Model model) throws ClassNotFoundException, SQLException{
		
		TestDao testDao = sqlSession.getMapper(TestDao.class);
		System.out.println("INFO : Skein-T501 - 사용자 입력 값 검증, seq=" + command.getSeq() + ", content=" + command.getContent());
		testDao.writeReg(command);
		System.out.println("INFO : Skein-T501 - 변경 된 값 검증, seq=" + command.getSeq());
		return "test.test";
	}
	
}
