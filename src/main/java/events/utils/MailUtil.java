package events.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

	public static void sendMail(String mailMessage, String senderMailAdress, String recipientMailAdress) {

		final String username = "eventim2.0@gmail.com";
		final String password = "practica17";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderMailAdress));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientMailAdress));
			message.setSubject("Testing Subject");
			message.setText(mailMessage);

			Transport.send(message);

			System.out.println("Done");
		} catch (MessagingException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	
}
