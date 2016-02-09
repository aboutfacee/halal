package com.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class MailSend {

	public static boolean mailSend(String sendName, String fromMail, String toMail, String subject, String content) {
		boolean flag = true;
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.host", "smtp.worksmobile.com");
		props.put("mail.smtp.auth","true");
//		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.port", "465");
		
		Authenticator auth = new MyAuthentication("hello@leadxworld.com", "gpffhdn2981@");
		Session session = Session.getInstance(props, auth);
		Message msg = new MimeMessage(session);
		
		try {
			//발신자 주소
			msg.setFrom(new InternetAddress(fromMail, sendName));
			
			//수신자주소
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);

		} catch (AddressException e) {
			flag = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			flag = false;
			e.printStackTrace();
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public static boolean mailSendFile(String sendName, String fromMail, String toMail, String subject, String content, String filePath) throws UnsupportedEncodingException, MessagingException {
		boolean flag = true;
		Properties props = new Properties();
		//props.put("mail.transport.protocol", "smtp");
		//props.put("mail.smtp.starttls.enable","true");
		//props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.host", "smtp.worksmobile.com");
		props.put("mail.smtp.port", "465");
		//props.put("mail.smtp.user", "help@todos.co.kr");
		//props.put("mail.smtp.password", "wkdqkr54719@");
		props.put("mail.smtp.auth","true");
		props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.worksmobile.com");
        //props.put("mail.smtp.socketFactory.port", "465");
        //props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
//		Authenticator auth = new MyAuthentication("pms@todos.co.kr", "wkdqkr12#");
//		Session session = Session.getInstance(props, auth);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un = "help@todos.co.kr";
            //String pw = "aemsuk7823@";
            String pw = "wkdqkr3266#";
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
		
		Message msg = new MimeMessage(session);
		
		//발신자 주소
		msg.setFrom(new InternetAddress(fromMail, sendName));
		
		//수신자주소
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
		
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setContent(content, "text/html;charset=euc-kr");
		
		Multipart multipart = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		MimeBodyPart mbp = new MimeBodyPart();
		if(filePath != null && filePath.length()>0){
			File file = new File(filePath);
			FileDataSource fds = new FileDataSource(file);
			mbp.setDataHandler(new DataHandler(fds));
			mbp.setFileName(MimeUtility.encodeText(fds.getName()));
			//첨부파일
			multipart.addBodyPart(mbp);
			//메세지 내용
			mbp1.setContent(content, "text/html;charset=euc-kr");
			multipart.addBodyPart(mbp1);
			
			msg.setContent(multipart);
		}
		
		Transport.send(msg);
		return flag;
		
	}
	
	public boolean mailSendList(String sendName, String fromMail, List toMail, String subject, String content, String filePath) {
		boolean flag = true;
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth","true");
//		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.port", "465");
		
		Authenticator auth = new MyAuthentication("help@todos.co.kr", "wkdqkr3266#");
		Session session = Session.getInstance(props, auth);
		Message msg = new MimeMessage(session);
		
		try {
			//발신자 주소
			msg.setFrom(new InternetAddress(fromMail, sendName));
			
			//수신자주소
			InternetAddress[] address = new InternetAddress[toMail.size()];
			for(int i=0; i<toMail.size(); i++) {
				address[i] = new InternetAddress(toMail.get(i).toString());
			}
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Multipart multipart = new MimeMultipart();
			if(filePath != null && filePath.length()>0){
				//메세지 내용
				MimeBodyPart mbpContent = new MimeBodyPart();
				mbpContent.setContent(content, "text/html;charset=euc-kr");
				multipart.addBodyPart(mbpContent);
				
				String[] fileArray = filePath.split(",");
				for(int i=0; i<fileArray.length; i++) {
					File file = new File(fileArray[i]);
					MimeBodyPart mbp = new MimeBodyPart();
					FileDataSource fds = new FileDataSource(file);
					mbp.setDataHandler(new DataHandler(fds));
					mbp.setFileName(MimeUtility.encodeText(fds.getName()));
					//첨부파일
					multipart.addBodyPart(mbp);
				}
				
				msg.setContent(multipart);
			}
			
			Transport.send(msg);

		} catch (AddressException e) {
			flag = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			flag = false;
			e.printStackTrace();
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public boolean mailSendsCnt(String formMail, List toMail, String subject, String content, int cnt) {
		boolean flag = true;
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth","true");
//		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.port", "465");
		
		Session session = Session.getDefaultInstance(props, null);
		Message msg = new MimeMessage(session);
		
		try {
			//발신자 주소
			msg.setFrom(new InternetAddress(formMail));
			int num = 0;
			for(int i=0; i<toMail.size(); i=i+cnt) {
				
				int result = toMail.size() - num * cnt;
				InternetAddress[] address = null;
				if(result > cnt) {
					//수신자주소
					address = new InternetAddress[cnt];
					for(int j=0; j<cnt; j++) {
						address[j] = new InternetAddress((String)((HashMap)toMail.get(i+j)).get("email"));
					}
				} else {
					//수신자주소
					address = new InternetAddress[result];
					for(int j=0; j<result; j++) {
						address[j] = new InternetAddress((String)((HashMap)toMail.get(i+j)).get("email"));
					}
				}
				
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject(subject);
				msg.setSentDate(new Date());
				msg.setContent(content, "text/html;charset=euc-kr");
				
				Transport.send(msg);
				num++;
			}

		} catch (AddressException e) {
			flag = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			flag = false;
			e.printStackTrace();
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
		
	}
}
