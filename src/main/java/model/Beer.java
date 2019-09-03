package model;

import javax.persistence.*;
import java.util.Date;

@Entity(name="beers")
public class Beer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    @Temporal(value = TemporalType.DATE)
    private Date marketIntroductionDate;
    private String type;
    @Column(name = "price_for_1l")
    private double price;
    @Column(name = "alc_percent")
    private String alcPercent;

    public Beer() {}

    public Beer(String name, Date date, String type, double price, String percent) {
        this.name = name;
        this.marketIntroductionDate = date;
        this.type = type;
        this.price = price;
        this.alcPercent = percent;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMarketIntroductionDate(Date marketIntroductionDate) {
        this.marketIntroductionDate = marketIntroductionDate;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getMarketIntroductionDate() {
        return marketIntroductionDate;
    }

    public String getType() {
        return type;
    }

    public double getPrice() {
        return price;
    }

    public String getAlcPercent() {
        return alcPercent;
    }

    public void setAlcPercent(String percent) {
        this.alcPercent = percent;
    }
}
