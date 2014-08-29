package kr.co.skein.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.servlet.view.velocity.VelocityConfig;

@Component
public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private VelocityConfig velocityConfig;

	@Async
	public void SendEmail(String from, String to, String subject, String text, Map<String, Object> model, String formUrl) throws Exception {
		
		MimeMessage message = mailSender.createMimeMessage();
		String mailText = null;
		
		if (StringUtils.isEmpty(from))
			from = "보내는 메일주소";

		if (StringUtils.isNotEmpty(text)) {

			mailText = text;

		} else if (model != null) {
			mailText = VelocityEngineUtils.mergeTemplateIntoString(velocityConfig.getVelocityEngine(), formUrl, "utf-8", model);
		}
		
		try {
			message.setFrom(new InternetAddress(from));
			message.addRecipient(RecipientType.TO, new InternetAddress(to)); //받는 사람 타입 TO, CC, BCC
			message.setSubject(subject);
			message.setText(mailText, "utf-8", "html");
			mailSender.send(message);

		} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
	}
	
	@Async
	public void SendEmail(String from, String to, String subject, Map<String, Object> model, String formUrl) throws FileNotFoundException, URISyntaxException {

		MimeMessage message = mailSender.createMimeMessage();

		String mailText = null;

		if (StringUtils.isEmpty(from))
			from = "보내는 메일주소";

		
		mailText = VelocityEngineUtils.mergeTemplateIntoString(
					velocityConfig.getVelocityEngine(), formUrl, "utf-8", model);
		

		try {
		message.setFrom(new InternetAddress(from));
		message.addRecipient(RecipientType.TO, new InternetAddress(to)); //받는 사람 타입 TO, CC, BCC
		message.setSubject(subject);
		message.setText(mailText, "utf-8", "html");
		mailSender.send(message);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
