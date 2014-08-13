package kr.co.skein.controller;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class NotificationController {

	@Autowired
	private View jsonView;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping
	public View getNotificationList(String personalURI) throws ClassNotFoundException, SQLException{
		return jsonView;
	}
}
