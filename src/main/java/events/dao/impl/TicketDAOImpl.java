package events.dao.impl;

import events.dao.TicketDAO;
import events.model.Ticket;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TicketDAOImpl implements TicketDAO{
    public Ticket findByTicketId(Integer id) {
        return null;
    }

    public List<Ticket> getAllTickets() {
        return null;
    }

    public void saveTicket(Ticket ticket) {
    }

    public void deleteTicket(Ticket ticket) {
    }

    public void deleteTicketById(Integer id) {

    }
}
