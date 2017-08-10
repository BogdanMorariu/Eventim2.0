package events.controller;

import events.model.User;
import events.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private ManageService manageService;

    @RequestMapping("/createUser")
    public ModelAndView createUser(@Valid User user, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("createUser", (Map<String, ?>) uiModel);
        }
       try {
           manageService.saveUser(user);
           return new ModelAndView("confirmUser");
       } catch  (Exception ex) {
           System.out.println(ex.getMessage());
           return new ModelAndView("createUser", (Map<String, ?>) uiModel);
       }
    }
}
