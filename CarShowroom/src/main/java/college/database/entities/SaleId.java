package college.database.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class SaleId implements Serializable {

    private static final long serialVersionUID = 5727154610456752833L;
    @Column(name = "salesperson_id")
    private String salespersonId;


    @Column(name = "car_serial_no")
    private String carSerial;

}
