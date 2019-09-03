package model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity(name = "beers_warehouse")
public class BeerWarehouseEntry {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne(cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Beer beer;

    private double liters;

    public BeerWarehouseEntry() {}

    public BeerWarehouseEntry(Beer beer, double liters) {
        this.beer = beer;
        this.liters = liters;
    }

    public void setLiters(double liters) {
        this.liters = liters;
    }

    public void removeLiters(double liters) {
        this.liters = this.liters - liters;
    }

    public void addLiters(double liters) {
        this.liters = this.liters + liters;
    }
}
