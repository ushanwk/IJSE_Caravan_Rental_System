package lk.ijse.caravanrental.to;

public class Vehicle {
    private String regId;
    private int qty;

    public Vehicle(String regId, int qtyOnHand){
        this.regId = regId;
        this.qty = qty;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    public int getQty() {
        return qty;
    }

    public void setQtyOnHand(int qtyOnHand) {
        this.qty = qtyOnHand;
    }
}
