package com.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

	String id;
	String pw;
	
	public MyAuthentication(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(id, pw);
    }

}
