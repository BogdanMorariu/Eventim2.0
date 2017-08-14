package events.utils;

import java.io.IOException;

import javax.mail.MessagingException;


public class MailsTest {

	public void testMail() throws MessagingException, IOException, InterruptedException  {
		
		
		String body = "This is another test";
		//String senderMailAdress = "eventim2.0@gmail.com";
		String recipientMailAdress = "geraldlionb@gmail.com";
		
		MailUtil.sendMail(body, recipientMailAdress);
		
		Thread.sleep(60000);

	}
	public static void main(String[] args) {
		
		String body = "Gerri";
		//String senderMailAdress = "eventim2.0@gmail.com";
		String recipientMailAdress = "geraldlionb@gmail.com";
		
		MailUtil.sendMail(body, recipientMailAdress);
		
	}

}
