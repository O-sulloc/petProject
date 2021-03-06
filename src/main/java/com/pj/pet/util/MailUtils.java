package com.pj.pet.util;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailUtils {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailUtils(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	//이메일 제목
	public void setSubject(String subject) throws MessagingException{
		messageHelper.setSubject(subject);
	}
	
	//이메일 내용
	public void setText(String htmlContent) throws MessagingException{
		messageHelper.setText(htmlContent,true);
	}
	
	//이메일 발송자
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException{
		messageHelper.setFrom(email, name);
	}
	
	//이메일 수신자
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}

	//이메일 보내기
	public void send() {
		mailSender.send(message);
	}
}
