package events.controller;

import events.model.Artist;
import events.model.User;
import events.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/artists")
public class ArtistController {

    @Autowired
    private ManageService manageService;

    @RequestMapping("/createArtist")
    public ModelAndView createArtist(Model uiModel){
	   uiModel.addAttribute("artist", new Artist());
       return new ModelAndView("createArtist", uiModel.asMap());
    }
    
    @RequestMapping("/processArtist")
    @ResponseBody
    public String processArtist(@Valid Artist artist, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return "Failed";
        }
       try {
           manageService.saveArtist(artist);
           return "Succes";
       } catch  (Exception ex) {
           System.out.println(ex.getMessage());
           return "Failed";
       }
    }
    
    @RequestMapping("/deleteArtist")
    public ModelAndView deleteArtist(@Valid Artist artist, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("deleteArtist", (Map<String, ?>) uiModel);
        }
       try {
           manageService.saveArtist(artist);    
           return new ModelAndView("deleteArtist");
       } catch  (Exception ex) { 
           System.out.println(ex.getMessage());
           return new ModelAndView("deleteArtist", (Map<String, ?>) uiModel);
       }
    }
    
    @RequestMapping("/updateArtist")
    public ModelAndView updateArtist(@Valid Artist artist, BindingResult result, Model uiModel){
        if (result.hasErrors()) {
            return new ModelAndView("updateArtist", (Map<String, ?>) uiModel);
        }
       try {
           manageService.saveArtist(artist);
           return new ModelAndView("updateArtist");
       } catch  (Exception ex) {
           System.out.println(ex.getMessage());
           return new ModelAndView("updateArtist", (Map<String, ?>) uiModel);
       }
    }
}
