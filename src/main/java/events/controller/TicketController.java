package events.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import events.model.Ticket;
import events.model.User;
import events.service.FetchService;
import events.service.ManageService;

@Controller
@RequestMapping("/tickets") // events/{id}/tickets
public class TicketController {

	@Autowired
	private ManageService manageService;

	@Autowired
	private FetchService fetchService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getBuyTicketSite(Model uiModel) {
		Ticket ticket = new Ticket();
		ticket.setUser(fetchService.getUserById(1));
		ticket.setEvent(fetchService.getEventById(1));
		uiModel.addAttribute("ticket", ticket);
		return new ModelAndView("createTicket", uiModel.asMap());
	}

	@RequestMapping(value = "/createTicket", method = RequestMethod.POST)
	public ModelAndView createTicket(@Valid Ticket ticket, BindingResult result, Model uiModel) {
		if (result.hasErrors()) {
			uiModel.addAttribute("ticket", ticket);
			return new ModelAndView("createTicket", uiModel.asMap());
		}
		try {
			//barcode
			//quantity
			manageService.saveTicket(ticket);
			return new ModelAndView("createTicket", uiModel.asMap());
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
