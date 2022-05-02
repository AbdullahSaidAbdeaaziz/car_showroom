package college.database.entities;

import jakarta.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;

@Entity
@Table(name = "car")
public class Car implements Serializable {
    @Id
    @Column(name = "serial_no")
    private String serialNumber;

    @Column(name = "model")
    private String model;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "price")
    private BigDecimal price;

    @OneToMany(mappedBy = "car")
    Collection<CarOption> options = new ArrayList<>();

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Collection<CarOption> getOptions() {
        return options;
    }

    public void setOptions(Collection<CarOption> options) {
        this.options = options;
    }
}
