package events.controller;

import events.model.Artist;
import events.service.FetchService;
import events.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

import java.util.List;

@Controller
@RequestMapping("/artists")
public class ArtistController {

    @Autowired
    private ManageService manageService;
    
    @Autowired
    private FetchService fetchService;
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
	public ModelAndView deleteArtist(Model uiModel) {
		try {
			
			 List<Artist> artists = fetchService.getAllArtists();
			 uiModel.addAttribute("artists", artists);
			 
			 
			return new ModelAndView("deleteArtist", uiModel.asMap());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("deleteArtist", uiModel.asMap());
		}
	}
    
	
	@RequestMapping("/removeArtist")
	public ModelAndView removeArtist(@RequestParam(value="idValue",required=true) Integer id,Model uiModel){
		try{
			manageService.deleteArtistById(id);
			return new ModelAndView("deleted Succesfully");
		} catch (Exception ex) {
			 System.out.println(ex.getMessage());
			   return new ModelAndView("deleteCategory", uiModel.asMap());}
		}
    
	@RequestMapping("/updateArtist")
	public ModelAndView updateArtist(@Valid Artist artist, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("updateArtist", uiModel.asMap());
		}
		try {
			manageService.saveArtist(artist);
			return new ModelAndView("updateArtist", uiModel.asMap());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("updateArtist", uiModel.asMap());
		}
	}
    
    
   
}
