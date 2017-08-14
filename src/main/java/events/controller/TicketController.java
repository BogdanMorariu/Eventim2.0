package events.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
			//barcode
			//quantity
			//manageService.saveTicket(ticket);
			if(quantity > 0) {
				for (int i = 0; i < quantity; i++) {
					Ticket ticketHelp = new Ticket();

					ticketHelp.setBarcode(fetchService.getNextBarcode());
					ticketHelp.setEvent(ticket.getEvent());
					ticketHelp.setUser(ticket.getUser());
					manageService.saveTicket(ticketHelp);
				}
			}
			return getTickets(eventId, uiModel);
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			uiModel.addAttribute("ticket", ticket);
			return new ModelAndView("createTicket", uiModel.asMap());
		}
	}

	// do we need update for tickets?
	@RequestMapping("/updateTicket")
	public ModelAndView updateTicket(@Valid Ticket ticket, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("updateTicket", uiModel.asMap());
		}
		try {
			manageService.saveTicket(ticket);
			return new ModelAndView("updateTicket", uiModel.asMap());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("updateTicket", uiModel.asMap());
		}
	}

	@RequestMapping(value = "/deleteTicket", method = RequestMethod.GET)
	public ModelAndView getDeleteTicketSite(BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			uiModel.addAttribute("ticketList", fetchService.getUserTickets(1)); // from
																				// where
																				// do
																				// i
																				// get
																				// userId
			return new ModelAndView("deleteTicket", uiModel.asMap());
		}
		return new ModelAndView(); // error
	}

	@RequestMapping(value = "/deleteTicket", method = RequestMethod.POST)
	public ModelAndView deleteTicket(@RequestParam("id") Integer id, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			return new ModelAndView("deleteTicket", uiModel.asMap());
		}
		try {
			manageService.deleteTicketById(id);
			return new ModelAndView("deleteTicket", uiModel.asMap());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return new ModelAndView("deleteTicket", uiModel.asMap());
		}
	}
}
