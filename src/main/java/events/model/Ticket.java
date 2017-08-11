package events.model;

import javax.validation.constraints.NotNull;

public class Ticket {
    private Integer id;
    private User user;
    private Event event;
    private Long barcode;
    private Double price;

    public Ticket() {
    }

    public Ticket(Integer id, User user, Event event, Long barcode, Double price) {
        this.id = id;
        this.user = user;
        this.event = event;
        this.barcode = barcode;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", user=" + user +
                ", event=" + event +
                ", barcode=" + barcode +
                ", price=" + price +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public Long getBarcode() {
        return barcode;
    }

    public void setBarcode(Long barcode) {
        this.barcode = barcode;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    @SuppressWarnings("all")
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ticket ticket = (Ticket) o;

        if (id != null ? !id.equals(ticket.id) : ticket.id != null) return false;
        if (user != null ? !user.equals(ticket.user) : ticket.user != null) return false;
        if (event != null ? !event.equals(ticket.event) : ticket.event != null) return false;
        if (barcode != null ? !barcode.equals(ticket.barcode) : ticket.barcode != null) return false;
        return price != null ? price.equals(ticket.price) : ticket.price == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (event != null ? event.hashCode() : 0);
        result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
