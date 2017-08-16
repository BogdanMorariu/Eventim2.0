package events.controller;

import events.authentication.Authenticate;
import events.model.TemporaryUser;
import events.model.User;
import events.service.FetchService;
import events.service.ManageService;
import events.utils.Encrypter;
import events.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private FetchService fetchService;

    @Autowired
    private ManageService manageService;

    @RequestMapping("/createUser")
    public ModelAndView createUser(@Valid TemporaryUser temporaryUser, BindingResult result, Model uiModel){

        //check compatibility errors
        if (result.hasErrors()) {
            return new ModelAndView("createUser", uiModel.asMap());
        }
       try {
           BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
           String encodedPassword = bCryptPasswordEncoder.encode(temporaryUser.getPassword());
           //temporary user default values
           temporaryUser.setPassword(encodedPassword);
           temporaryUser.setType("NORMAL");
           temporaryUser.setRegistered(Boolean.FALSE);

            //Check for duplicates
            List<User> users = fetchService.getAllUsers();
            User u = null;
           for (int i = 0; i < users.size(); i++) {
               u = users.get(i);
               if (u.getName().equals(temporaryUser.getName())) {
                   uiModel.addAttribute("message", "User with that Name already exists!");
                   System.out.println("Duplicate user tried to register");
                   return new ModelAndView("createUser", uiModel.asMap());
               }
           }

           //save user until validation
           manageService.saveTemporaryUser(temporaryUser);

           //Send mail
           String subject = "Eventim 2.0 Acount validation !\n";
           String message = "Hello " + temporaryUser.getName() + "!\n Please click on the link below to activate your acount:\n";
           message += "<a href=\"localhost:8080/users/validate?token=" + encrypt(temporaryUser.getId()) + "\">Click me</a>";
           message += "\n\n Have a Great day,\nEventim 2.0 Team.";
           MailUtil.sendMail(subject, message, temporaryUser.getEmail());

            return new ModelAndView("confirmMail");

        } catch  (Exception ex) {
            //send back to createUser link with error
           return new ModelAndView("createUser", uiModel.asMap());
            }
    }

    @RequestMapping(value = "/deleteUser")
    public ModelAndView deleteUser(@RequestParam(value = "id", required = false) Integer id, Model uiModel){
        List<User> users;
        try {
            manageService.deleteUserById(id);
            users = fetchService.getAllUsers();
            uiModel.addAttribute("users",users);
            return new ModelAndView("deleteUser",uiModel.asMap());
        } catch  (Exception ex) {
            System.out.println(ex.getMessage());
            users = fetchService.getAllUsers();
            uiModel.addAttribute("message", "Something unexpected occurred");
            uiModel.addAttribute("users",users);
            return new ModelAndView("deleteUser", uiModel.asMap());
        }
    }

    @RequestMapping("/updateUsers")
    public ModelAndView updateUsers(@Valid User user, BindingResult result, Model uiModel){
        List<User> users;
        if (result.hasErrors()) {
            users = fetchService.getAllUsers();
            uiModel.addAttribute("users",users);
            uiModel.addAttribute("message", "Something unexpected occurred");
            return new ModelAndView("updateUsers", uiModel.asMap());
        }
        try {
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());
            user.setPassword(encodedPassword);
            manageService.saveUser(user);
            users = fetchService.getAllUsers();
            uiModel.addAttribute("users",users);
            uiModel.addAttribute("message", "User updated !");
            return new ModelAndView("updateUsers");
        } catch  (Exception ex) {
            users = fetchService.getAllUsers();
            uiModel.addAttribute("users",users);
            uiModel.addAttribute("message", "Users:");
            return new ModelAndView("updateUsers", uiModel.asMap());
        }
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(@Valid User user, BindingResult result, Model uiModel){
        User oldUser = fetchService.getUserById(user.getId());
        if (result.hasErrors()) {
            uiModel.addAttribute("user",oldUser);
            return new ModelAndView("updateUser", uiModel.asMap());
        }
        try {
            manageService.saveUser(user);
            uiModel.addAttribute("user",oldUser);
            uiModel.addAttribute("message", "Changes saved");
            return new ModelAndView("updateUser");
        } catch  (Exception ex) {
            uiModel.addAttribute("user",oldUser);
            System.out.println(ex.getMessage());
            return new ModelAndView("updateUser", uiModel.asMap());
        }
    }

    @RequestMapping("/validate")
    public ModelAndView validateUser(@RequestParam String token, Model uiModel){
        try{
            TemporaryUser temporaryUsers = fetchService.getTemporaryUserById(Integer.parseInt(decrypt(token)));
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

    private String encrypt(Integer number) throws UnsupportedEncodingException {
        return Base64.getUrlEncoder().encodeToString(number.toString().getBytes("utf-8"));
    }

    private String decrypt(String token){
        return new String(Base64.getUrlDecoder().decode(token), StandardCharsets.UTF_8);
    }
}
