package events.controller;

import events.model.TemporaryUser;
import events.model.User;
import events.service.FetchService;
import events.service.ManageService;
import events.utils.Encrypter;
import events.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private FetchService fetchService;

    @Autowired
    private ManageService manageService;

    private Encrypter encrypter = new Encrypter();

    @RequestMapping("/createUser")
    public ModelAndView createUser(@Valid TemporaryUser temporaryUser, BindingResult result, Model uiModel){
        temporaryUser.setType("n");
        temporaryUser.setRegistered(Boolean.FALSE);
        if (result.hasErrors()) {
            return new ModelAndView("createUser", uiModel.asMap());
        }
       try {
           manageService.saveTemporaryUser(temporaryUser);
           String subject = "Eventim 2.0 Acount validation !\n";
           String message = "Hello " + temporaryUser.getName() + "!\n Please click on the link below to activate your acount:\n";
           message += "localhost:8080/users/validate?token="+ temporaryUser.getId();
           message += "\n\n Have a Great day,\nEventim 2.0 Team.";
           MailUtil.sendMail(subject,message,temporaryUser.getEmail());
           return new ModelAndView("confirmMail");
       } catch  (Exception ex) {
           System.out.println(ex.getMessage());
           return new ModelAndView("createUser", uiModel.asMap());
       }
    }

    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(@Valid User user, BindingResult result, Model uiModel){
        Integer id = user.getId();
        List<User> users = fetchService.getAllUsers();
        if (result.hasErrors()) {
            uiModel.addAttribute("users",users);
            return new ModelAndView("deleteUser", uiModel.asMap());
        }
        try {
            manageService.deleteUserById(id);
            uiModel.addAttribute("users",users);
            return new ModelAndView("confirmUser");
        } catch  (Exception ex) {
            System.out.println(ex.getMessage());
            uiModel.addAttribute("users",users);
            return new ModelAndView("deleteUser", uiModel.asMap());
        }
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(@Valid User user, BindingResult result, Model uiModel){
        List<User> users = fetchService.getAllUsers();
        if (result.hasErrors()) {
            uiModel.addAttribute("users",users);
            return new ModelAndView("updateUser", uiModel.asMap());
        }
        try {
            manageService.saveUser(user);
            uiModel.addAttribute("users",users);
            return new ModelAndView("confirmUser");
        } catch  (Exception ex) {
            uiModel.addAttribute("users",users);
            System.out.println(ex.getMessage());
            return new ModelAndView("updateUser", uiModel.asMap());
        }
    }

    @RequestMapping("/validate")
    public ModelAndView validateUser(@RequestParam Integer token, Model uiModel){
        try{
            TemporaryUser temporaryUsers = fetchService.getTemporaryUserById(token);
            User user = temporaryUsers.toUser();
            manageService.saveUser(user);
            temporaryUsers.setRegistered(Boolean.TRUE);
            manageService.saveTemporaryUser(temporaryUsers);
            return new ModelAndView("confirmUser",uiModel.asMap());
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            return new ModelAndView("error", uiModel.asMap());
        }
    }
}
