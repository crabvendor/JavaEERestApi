package model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;

@Entity(name = "containers_warehouse")
public class ContainerWarehouseEntry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne(cascade = CascadeType.ALL)
    @OnDelete(action= OnDeleteAction.CASCADE)
    private Container container;

    private long amount;

    public ContainerWarehouseEntry(Container container, long amount) {
        this.container = container;
        this.amount = amount;
    }

    public ContainerWarehouseEntry() {
    }

    public long getId() {
        return id;
    }

    public Container getContainer() {
        return container;
    }

    public long getAmount() {
        return amount;
    }

    public void setContainer(Container container) {
        this.container = container;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }
}
