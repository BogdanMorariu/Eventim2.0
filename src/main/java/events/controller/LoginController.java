package events.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import events.model.User;
import events.service.FetchService;
import events.service.ManageService;
import events.utils.MailUtil;

@Controller
public class LoginController {
	
	public static final String MAIL_SUBJECT = "Forgot password";

	private String newPassword;

	@Autowired
	private FetchService fetchService;

	@Autowired
	private ManageService manageService;
	
	@RequestMapping("/loginUri")
	public String goToLogin(){
		return "login";
	}

	@RequestMapping("/changePassword")
	public ModelAndView changePassword(){
		return new ModelAndView("changePassword");
	}
	
	@RequestMapping("/forgotPassword")
	@ResponseBody
	public String forgotPassword(String email) {
		try {
			newPassword = MailUtil.generatePassword();
			if (updatePassword(newPassword, email) == true) {
				MailUtil.sendMail(MAIL_SUBJECT, newPassword, email);
				return "Success";
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
