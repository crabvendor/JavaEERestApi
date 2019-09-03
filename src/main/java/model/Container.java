package model;

import javax.persistence.*;

@Entity(name="containers")
public class Container {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private double capacity;

    private double price;

    @Enumerated(EnumType.STRING)
    @Column(name="type")
    private ContainerType containerType;


    public Container(double capacity, double price, ContainerType containerType) {
        this.capacity = capacity;
        this.price = price;
        this.containerType = containerType;
    }

    public Container() {
    }

    public void setCapacity(double capacity) {
        this.capacity = capacity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setContainerType(ContainerType containerType) {
        this.containerType = containerType;
    }

    public long getId() {
        return id;
    }

    public double getCapacity() {
        return capacity;
    }

    public double getPrice() {
        return price;
    }

    public ContainerType getContainerType() {
        return containerType;
    }

    public enum ContainerType {
        BOTTLE, CAN, BARREL
    }
}
