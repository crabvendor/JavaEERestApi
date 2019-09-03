package jpa;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;
import javax.persistence.criteria.*;
import java.util.Map;

public class ModelHibernate<E> {
    EntityManagerFactory entityManagerFactory;
    EntityManager em;
    CriteriaBuilder criteriaBuilder;

    public ModelHibernate() {
        entityManagerFactory = Persistence.createEntityManagerFactory("zimnyLech");
        em = entityManagerFactory.createEntityManager();
        criteriaBuilder = em.getCriteriaBuilder();
    }

    public void addModel(E model) {
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        em.persist(model);
        transaction.commit();
    }

    public E getModel(long id, Class<E> modelClass) throws NoResultException{
        CriteriaQuery<E> criteriaQuery = criteriaBuilder.createQuery( modelClass );
        Root<E> modelRoot = criteriaQuery.from( modelClass );
        criteriaQuery.select(modelRoot);
        criteriaQuery.where( criteriaBuilder.equal( modelRoot.get("id"), id ) );
        return em.createQuery(criteriaQuery).getSingleResult();
    }

    public List<E> getAllModels(Class<E> modelClass) {
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaQuery criteriaQuery = criteriaBuilder.createQuery(modelClass);
        Root modelRoot = criteriaQuery.from(modelClass);
        criteriaQuery.select(modelRoot);
        TypedQuery<E> query = em.createQuery(criteriaQuery);
        return query.getResultList();
    }

    public void removeModel(long id, Class<E> modelClass) throws NoResultException{
        getModel(id, modelClass);
        CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
        CriteriaDelete<E> delete = criteriaBuilder.createCriteriaDelete(modelClass);
        Root<E> modelRoot = delete.from(modelClass);
        delete.where(criteriaBuilder.equal(modelRoot.get("id"), id));
        EntityTransaction entityTransaction = em.getTransaction();
        entityTransaction.begin();
        em.createQuery(delete).executeUpdate();
        entityTransaction.commit();
    }

    public void updateModel(Class<E> modelClass, Map<String, Object> fields, long id) {
        EntityTransaction transaction = em.getTransaction();
        CriteriaUpdate<E> criteria = criteriaBuilder.createCriteriaUpdate(modelClass);
        Root<E> root = criteria.from(modelClass);
        for(String key: fields.keySet()) {
            criteria.set(root.get(key), fields.get(key));
        }
        criteria.where(criteriaBuilder.equal(root.get("id"), id));
        transaction.begin();
        em.createQuery(criteria).executeUpdate();
        transaction.commit();
    }
}
