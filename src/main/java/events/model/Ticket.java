package events.model;

public class Ticket {
    private Integer id;
    private Integer userId;
    private Integer eventId;
    private Long barcode;
    private Double price;

    public Ticket() {
    }

    public Ticket(Integer id, Integer userId, Integer eventId, Long barcode, Double price) {
        this.id = id;
        this.userId = userId;
        this.eventId = eventId;
        this.barcode = barcode;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", userId=" + userId +
                ", eventId=" + eventId +
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
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
        if (userId != null ? !userId.equals(ticket.userId) : ticket.userId != null) return false;
        if (eventId != null ? !eventId.equals(ticket.eventId) : ticket.eventId != null) return false;
        if (barcode != null ? !barcode.equals(ticket.barcode) : ticket.barcode != null) return false;
        return price != null ? price.equals(ticket.price) : ticket.price == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (eventId != null ? eventId.hashCode() : 0);
        result = 31 * result + (barcode != null ? barcode.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        return result;
    }
}
