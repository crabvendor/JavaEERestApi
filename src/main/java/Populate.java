import model.Beer;
import model.BeerWarehouseEntry;
import model.Container;
import model.ContainerWarehouseEntry;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;

public class Populate {

    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("zimnyLech");
        EntityManager em = entityManagerFactory.createEntityManager();
        em.clear();
        populateContainers(em);
        populateContainerWarehouse(em);
        populateBeers(em);
        populateBeerWarehouse(em);
    }

    static void populateContainers(EntityManager entityManager) {
        Container[] containers = {
                new Container(0.5, 0.05, Container.ContainerType.CAN),
                new Container(0.5, 0.37, Container.ContainerType.BOTTLE),
                new Container(100, 10.23, Container.ContainerType.BARREL)
        };

        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        for (Container container : containers) {
            entityManager.persist(container);
        }
        transaction.commit();
    }

    static void populateContainerWarehouse(EntityManager em) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Container.class);
        Root containerRoot = criteriaQuery.from(Container.class);
        criteriaQuery.select(containerRoot);
        TypedQuery<Container> query = em.createQuery(criteriaQuery);
        List<Container> containers = query.getResultList();

        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        for (Container container : containers) {
            em.persist(new ContainerWarehouseEntry(container, 1000));
        }
        transaction.commit();
    }

    static void populateBeers(EntityManager em) {
        Beer[] beers = {
                new Beer("Szogun", new Date(), "dark lager", 6.99, "7.0%"),
                new Beer("NullPointer", new Date(), "wheat", 0.00, "0/0%"),
                new Beer("Wife's fight", new Date(), "hop", 1.89, "6.0%"),
                new Beer("Córa Koryntu", new Date(), "pale ale", 4.49, "5.5%"),
                new Beer("Lolita", new Date(), "IPA", 5.50, "4.2%"),
                new Beer("Czyngis-chan", new Date(), "saison", 9.49, "9.0%"),
                new Beer("President Kwachu", new Date(), "belgian ale", 45.89, "66.7%")
        };

        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        for(Beer beer: beers) {
            em.persist(beer);
        }
        transaction.commit();
    }

    static void populateBeerWarehouse(EntityManager em) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(Beer.class);
        Root beerRoot = criteriaQuery.from(Beer.class);
        criteriaQuery.select(beerRoot);
        TypedQuery<Beer> query = em.createQuery(criteriaQuery);
        List<Beer> beers = query.getResultList();

        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        for (Beer beer : beers) {
            em.persist(new BeerWarehouseEntry(beer, 200));
        }
        transaction.commit();
    }
}
