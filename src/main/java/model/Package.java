package model;

import javax.persistence.*;

@Entity(name = "packages")
public class Package {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @OneToOne
    private Beer beer;
    @OneToOne
    private Container container;
    private double quantity;

    public Package() {}

    public Package(Beer beer, Container container, double quantity) {
        this.beer = beer;
        this.container = container;
        this.quantity = quantity;
    }

    public Beer getBeer() {
        return beer;
    }

    public Container getContainer() {
        return container;
    }

    public double getQuantity() {
        return quantity;
    }
}
