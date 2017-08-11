package events.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import events.model.User;
import events.service.FetchService;
import events.service.ManageService;
import events.service.impl.FetchServiceImpl;
import events.service.impl.ManageServiceImpl;
import events.utils.MailUtil;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	public static final String MAIL_SUBJECT = "Forgot password";

	private String newPassword;

	@Autowired
	FetchServiceImpl fetchService;

	@Autowired
	ManageServiceImpl manageService;

	@RequestMapping("/forgotPassword")
	@ResponseBody
	public String forgotPassword(String email) {
		try {
			newPassword = MailUtil.generatePassword();
			if (updatePassword(newPassword, email) == true) {
				MailUtil.sendMail(MAIL_SUBJECT, newPassword, email);
				return "An eMail with the new password has been sent.";
			}
			else{
				return "Mail not registered. Register for new Account.";
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return "Mail has not been sent.";

		}
	}

	public boolean updatePassword(String newPassword, String email) {
		boolean found = false;
		List<User> users = fetchService.getAllUsers();
		for (User user : users) {
			if (user.getEmail().equals(email)) {
				user.setPassword(newPassword);
				manageService.saveUser(user);
				found = true;
			}
		}
		return found;
	}

}
