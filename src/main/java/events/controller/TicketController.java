package events.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import events.model.Ticket;
import events.service.FetchService;
import events.service.ManageService;

/**
 * tickets/{id}/things
 * id is eventId from the previous page
 */

@Controller
@RequestMapping("/tickets") 
public class TicketController {

	@Autowired
	private ManageService manageService;

	@Autowired
	private FetchService fetchService;

	@RequestMapping(value = "/{eventId}", method = RequestMethod.GET)
	public ModelAndView getTickets( @PathVariable("eventId") Integer eventId, Model uiModel) {
		uiModel.addAttribute("tickets", fetchService.getUserTickets(1));	//userId from session
		return new ModelAndView("listTicket", uiModel.asMap());
	}
	
	@RequestMapping(value = "/{eventId}/createTicket", method = RequestMethod.GET)
	public ModelAndView getBuyTicketSite( @PathVariable("eventId") Integer eventId, Model uiModel) {
		Ticket ticket = new Ticket();
		ticket.setUser(fetchService.getUserById(1));	//userId from session
		//User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println(user.getName());
		ticket.setEvent(fetchService.getEventById(eventId));
		uiModel.addAttribute("ticket", ticket);
		return new ModelAndView("createTicket", uiModel.asMap());
	}

	@RequestMapping(value="/{eventId}/createTicket", method = RequestMethod.POST)
	public ModelAndView createTicket(@Valid Ticket ticket, BindingResult result, Model uiModel,
									 @RequestParam(value="quantity", required=true) Integer quantity,
									 @PathVariable("eventId") Integer eventId) {
		if (result.hasErrors()) {
			System.out.println(ticket);
			uiModel.addAttribute("ticket", ticket);
			uiModel.addAttribute("errorMessage", "Not valid inputs!");
			return new ModelAndView("createTicket", uiModel.asMap());
		}
		try {
			if(quantity > 0) {
				for (int i = 0; i < quantity; i++) {
					Ticket ticketHelp = new Ticket();
					ticketHelp.setBarcode(fetchService.getNextBarcode());
					ticketHelp.setEvent(ticket.getEvent());
					ticketHelp.setUser(ticket.getUser());
					manageService.saveTicket(ticketHelp);
				}
			}
			uiModel.addAttribute("response", "OK");
			return getBuyTicketSite(eventId, uiModel);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			uiModel.addAttribute("response", "NO");
			return getBuyTicketSite(eventId, uiModel);
		}
	}

	@RequestMapping(value = "/{eventId}/deleteTicket", method = RequestMethod.POST)
	@ResponseBody
	public String deleteTicket(@RequestParam("id") Integer id, HttpServletResponse response) {
		try {
			manageService.deleteTicketById(id);
			response.setStatus(200);
			return "Succes";
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return "Fail";
		}
	}
}
