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

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private ManageService manageService;

    @RequestMapping("/createUser")
    public ModelAndView createUser(@Valid User user, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("createUser", uiModel.asMap());
        }
       try {
           manageService.saveUser(user);
           return new ModelAndView("confirmUser");
       } catch  (Exception ex) {
           System.out.println(ex.getMessage());
           return new ModelAndView("createUser", uiModel.asMap());
       }
    }

    @RequestMapping("/deleteUser")
    public ModelAndView deleteUser(Integer id, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("deleteUser", uiModel.asMap());
        }
        try {
            manageService.deleteUserById(id);
            return new ModelAndView("confirmUser");
        } catch  (Exception ex) {
            System.out.println(ex.getMessage());
            return new ModelAndView("deleteUser", uiModel.asMap());
        }
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(@Valid User user, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("updateUser", uiModel.asMap());
        }
        try {
            manageService.saveUser(user);
            return new ModelAndView("confirmUser");
        } catch  (Exception ex) {
            System.out.println(ex.getMessage());
            return new ModelAndView("updateUser", uiModel.asMap());
        }
    }
}
