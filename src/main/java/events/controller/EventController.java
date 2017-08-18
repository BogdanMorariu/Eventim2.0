package events.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import events.model.Event;
import events.service.FetchService;
import events.service.ManageService;

@Controller
@RequestMapping("/event")
public class EventController {
	@Autowired
	private ManageService manageService;

	@Autowired
	private FetchService fetchService;
	
	@InitBinder
	 protected void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
	        binder.registerCustomEditor(Date.class, "startDate", new CustomDateEditor(dateFormat,true));
	        binder.registerCustomEditor(Date.class, "endDate", new CustomDateEditor(dateFormat,true));
	        binder.registerCustomEditor(Double.class, "price", new CustomNumberEditor(Double.class, true));
	}
	
	@RequestMapping("/createEvent")
	public ModelAndView createEvent(Model uiModel) {
		try {
			Event event = new Event();
			uiModel.addAttribute("artists", fetchService.getAllArtists());
			uiModel.addAttribute("categories", fetchService.getAllCategories());
			uiModel.addAttribute("event", event);
			return new ModelAndView("createEvent");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("createEvent", uiModel.asMap());
		}
	}

	@RequestMapping("/processEvent")
	@ResponseBody
	public String processEvent(@Valid Event event ,BindingResult result ,Model uiModel) {
		try {
			if(result.hasErrors()) {
				
				return "failed";
			}
			System.out.println(event.getImage());
			manageService.saveEvent(event);
			return "success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "failed";
		}
	}

	@RequestMapping("/listEvents")
	public ModelAndView listEvents( Model uiModel) {
		try {
			uiModel.addAttribute("events", fetchService.getAllEvents());
			return new ModelAndView("listEvents");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("listEvents", uiModel.asMap());
		}
	}

	@RequestMapping("/viewEvents")
	public ModelAndView viewEvents( Model uiModel) {
		try {
			uiModel.addAttribute("events", fetchService.getNextEvents());
			return new ModelAndView("viewEvents");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("viewEvents", uiModel.asMap());
		}
	}
	
	@RequestMapping("/listLocations")
	public ModelAndView listLocations( Model uiModel) {
		try {
			List<Event> events = fetchService.getNextEvents();
			List<String> locations = new ArrayList<>();
			for(Event e : events){
				if(!locations.contains(e.getLocation()))
					locations.add(e.getLocation());
			}
			uiModel.addAttribute("locations",locations);
			return new ModelAndView("listLocations");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("listLocations", uiModel.asMap());
		}
	}


	@RequestMapping("/getEventsByLocation/{location}")
	public ModelAndView listEventsByLocation(@PathVariable("location") String location,Model uiModel) {
		try {
			//List<Event> events = fetchService.getAllEvents().stream().filter(e -> e.getLocation().equals(location)).collect(Collectors.toList());
			List<Event> events = fetchService.getEventsByLocation(location);
			uiModel.addAttribute("events",events);
			return new ModelAndView("viewEvents");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("viewEvents", uiModel.asMap());
		}
	}

	@RequestMapping("/getEventsByArtist/{id}")
	public ModelAndView listEventsByArtist(@PathVariable("id") Integer id,Model uiModel) {
		try {
			List<Event> events = fetchService.getEventsByArtist(id);
			uiModel.addAttribute("events",events);
			return new ModelAndView("viewEvents");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("viewEvents", uiModel.asMap());
		}
	}

	@RequestMapping("/getEventsByCategory/{id}")
	public ModelAndView listEventsByCategory(@PathVariable("id") Integer id, Model uiModel) {
		try {
			List<Event> events = fetchService.getEventByCategory(id);
			uiModel.addAttribute("events",events);
			return new ModelAndView("viewEvents");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("viewEvents", uiModel.asMap());
		}
	}

	
	@RequestMapping("/removeEvent")
	@ResponseBody
	public String removeEvent(@RequestParam(value = "idValue", required = true) Integer id, Model uiModel) {
		try {
			manageService.deleteEvent(id);
			return "success";
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return "failed";
		}
	}

	@RequestMapping("/updateEvent")
	public ModelAndView updateEvent(@RequestParam(value = "idValue", required = true) Integer id, Model uiModel) {
		try{
			uiModel.addAttribute("artists", fetchService.getAllArtists());
			uiModel.addAttribute("categories", fetchService.getAllCategories());
			uiModel.addAttribute("event", fetchService.getEventById(id));
			return new ModelAndView("updateEvent");
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return new ModelAndView("updateEvent", uiModel.asMap());
		}

	}
	
	@RequestMapping("/processUpdateEvent")
	@ResponseBody
	public String processUpdateEvent(@Valid Event event, BindingResult result, Model uiModel) {
		try {
			if(result.hasErrors()) {
				uiModel.addAttribute("event", event);
				uiModel.addAttribute("errorMessage", "Invalid input!");
				
				return "failed";
			}
			manageService.saveEvent(event);
			return "success";
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return "failed";
		}
	}
}
