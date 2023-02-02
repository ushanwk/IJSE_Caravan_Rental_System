package lk.ijse.caravanrental.controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import lk.ijse.caravanrental.model.BookingModel;
import lk.ijse.caravanrental.to.Booking;
import lk.ijse.caravanrental.to.BookingDetail;
import lk.ijse.caravanrental.to.Vehicle;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BookingFormController {
    public ComboBox cmbCustomerId;
    public Label txtDate;
    public Label txtCustomerName;
    public Label txtBookingId;
    public ComboBox cmbVehicleRegNo;
    public TextField txtVehicleType;
    public TextField txtPricePerDay;
    public TextField txtQtyOnHand;
    public TableView tbl;
    public TableColumn colBookingId;
    public TableColumn colVehicleRegNo;
    public TableColumn colQty;
    public TableColumn colDiscount;
    public TextField txtGetQty;

    public void initialize(){
        txtDate.setText(getDate());
        txtBookingId.setText(getNextBookingId());
        cmbCustomerId.setItems(getAllCustomerID());
        cmbVehicleRegNo.setItems(getAllRegId());

        colBookingId.setCellValueFactory(new PropertyValueFactory<>("bookingId"));
        colVehicleRegNo.setCellValueFactory(new PropertyValueFactory<>("regId"));
        colQty.setCellValueFactory(new PropertyValueFactory<>("vehicleQty"));
        colDiscount.setCellValueFactory(new PropertyValueFactory<>("discount"));
    }

    public String getDate(){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = LocalDateTime.now().format(formatter);
        return date;
    }

    public String getNextBookingId(){
        BookingModel model = new BookingModel();
        try {
            return (model.nextBookingId());
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public ObservableList getAllCustomerID(){
        BookingModel model = new BookingModel();
        try {
            return model.getAllCustomerId();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void cmbCustomerIdOnAction(ActionEvent actionEvent) {
        BookingModel model = new BookingModel();
        try {
            txtCustomerName.setText(model.getCustomerName(String.valueOf(cmbCustomerId.getValue())));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public ObservableList getAllRegId(){
        BookingModel model = new BookingModel();
        try {
            return model.getAllRegId();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void cmbVehicleRegNoOnAction(ActionEvent actionEvent) {
        BookingModel model = new BookingModel();
        try {
            String[] details = model.getVehicleTypePricePerDayAndQty(String.valueOf(cmbVehicleRegNo.getValue()));
            txtVehicleType.setText(details[0]);
            txtPricePerDay.setText("Rs." + details[1]);
            txtQtyOnHand.setText(details[2]);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    ObservableList<BookingDetail> list = FXCollections.observableArrayList();

    public void btnAddOnAction(ActionEvent actionEvent) {
        list.add(new BookingDetail(txtBookingId.getText(), String.valueOf(cmbVehicleRegNo.getValue()), Integer.valueOf(txtGetQty.getText()), 0));
        tbl.setItems(list);
    }

    public void btnCompleteBookingOnAction(ActionEvent actionEvent) {
        BookingModel model = new BookingModel();

        Booking booking = new Booking(txtBookingId.getText(), Date.valueOf(txtDate.getText()), String.valueOf(cmbCustomerId.getValue()));
        Vehicle vehicle = new Vehicle(String.valueOf(cmbVehicleRegNo.getValue()), Integer.valueOf(txtGetQty.getText()));
        BookingDetail detail = new BookingDetail(txtBookingId.getText(), String.valueOf(cmbVehicleRegNo.getValue()), Integer.valueOf(txtGetQty.getText()), 0);

        boolean isComplete = false;

        try {
            isComplete = model.updateTables(booking, vehicle, detail, list);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if(isComplete){
            new Alert(Alert.AlertType.CONFIRMATION, "Succesfull");
        }else{
            new Alert(Alert.AlertType.ERROR, "Unsuccesfull");
        }
    }
}
