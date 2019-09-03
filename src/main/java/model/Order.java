package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Temporal(value=TemporalType.DATE)
    private Date date;

    @OneToOne
    private Client client;

    @OneToMany
    private List<Package> packages;

    public Order(Date date, Client client, List<Package> packages) {
        this.date = date;
        this.client = client;
        this.packages = packages;
    }

    public Order() {
    }

    public long getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public Client getClient() {
        return client;
    }

    public List<Package> getPackages() {
        return packages;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public void setPackages(List<Package> packages) {
        this.packages = packages;
    }
}
