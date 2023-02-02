package lk.ijse.caravanrental.model;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import lk.ijse.caravanrental.db.DBConnection;
import lk.ijse.caravanrental.to.Booking;
import lk.ijse.caravanrental.to.BookingDetail;
import lk.ijse.caravanrental.to.Vehicle;
import lk.ijse.caravanrental.util.CrudUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BookingModel {

    public String nextBookingId() throws SQLException, ClassNotFoundException {
        String sql = "SELECT booking_id FROM booking ORDER BY booking_id DESC LIMIT 1";

        ResultSet result = CrudUtil.execute(sql);

        String latestId = null;

        if(result.next()){
            latestId = result.getString("booking_id");
        }

        String[] d0s = latestId.split("D0");

        for (String a:d0s) {
            latestId = a;
        }

        int idNum = Integer.parseInt(latestId);

        latestId = "D0" + (idNum+1);

        return latestId;
    }

    public ObservableList getAllCustomerId() throws SQLException, ClassNotFoundException {
        String sql = "SELECT cust_id FROM Customer";
        ResultSet result = CrudUtil.execute(sql);

        ObservableList<String> list = FXCollections.observableArrayList();

        while(result.next()){
            list.add(result.getString("cust_id"));
        }

        return list;
    }

    public String getCustomerName(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT name FROM customer WHERE cust_id = ?";
        ResultSet result = CrudUtil.execute(sql, id);

        String name = null;

        if(result.next()){
            name = result.getString(1);
        }

        return name;
    }

    public ObservableList getAllRegId() throws SQLException, ClassNotFoundException {
        String sql = "SELECT reg_id FROM vehicle";
        ResultSet result = CrudUtil.execute(sql);

        ObservableList<String> list = FXCollections.observableArrayList();

        while(result.next()){
            list.add(result.getString("reg_id"));
        }

        return list;
    }

    public String[] getVehicleTypePricePerDayAndQty(String id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT vehicle_type, price_per_day, vehicle_qty_on_hand FROM vehicle WHERE reg_id = ?";
        ResultSet result = CrudUtil.execute(sql, id);

        String[] vehicleDetails = new String[3];

        if(result.next()){
            vehicleDetails[0] = result.getNString(1);
            vehicleDetails[1] = result.getString(2);
            vehicleDetails[2] = result.getString(3);
        }

        return vehicleDetails;
    }

    public boolean updateTables(Booking booking, Vehicle vehicle, BookingDetail bookingDetail, ObservableList<BookingDetail> list) throws SQLException, ClassNotFoundException {

        try{
            DBConnection.getInstance().getConnection().setAutoCommit(false);

            String bookingSql = "INSERT INTO booking VALUES (?, ?, ?)";
            boolean isBokkingAdded = CrudUtil.execute(bookingSql, booking.getBookingId(), booking.getDate(), booking.getCustomerId());

            if(isBokkingAdded){
                String vehicleSql = "UPDATE vehicle SET vehicle_qty_on_hand = vehicle_qty_on_hand - ? WHERE reg_id = ?";
                boolean isVehicleAdded = CrudUtil.execute(vehicleSql, vehicle.getQty(), vehicle.getRegId());

                if(isVehicleAdded){
                    for(int i = 0; i < list.size(); i++){
                        String bookingDetailSql = "INSERT INTO booking_detail VALUES (?, ?, ?, ?)";
                        boolean isBookingDetailAdded = CrudUtil.execute(bookingDetailSql, bookingDetail.getBookingId(), bookingDetail.getRegId(), bookingDetail.getVehicleQty(), 0);
                    }
                    if(isBokkingAdded){
                        DBConnection.getInstance().getConnection().commit();
                        list.clear();
                        return true;
                    }
                }
            }
            DBConnection.getInstance().getConnection().rollback();
            return false;
        }finally {
            DBConnection.getInstance().getConnection().setAutoCommit(true);
        }

    }

}
