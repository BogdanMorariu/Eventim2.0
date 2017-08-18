package events.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import events.service.FetchService;

@Controller
public class MainController {

	@Autowired
	FetchService fetchService;
	
    @RequestMapping("/home")
    public ModelAndView goToHome(Model uiModel){
    	uiModel.addAttribute("events",fetchService.getLimitedEvents(6));
        return new ModelAndView("home");
    }
}
