package lk.ijse.caravanrental.to;

import java.sql.Date;

public class Booking {
    private String bookingId;
    private Date date;
    private String customerId;

    public Booking(String bookingId, Date date, String customerId){
        this.bookingId = bookingId;
        this.date = date;
        this.customerId = customerId;
    }

    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }
}
