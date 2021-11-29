package dao;

import jpautils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

public abstract class AbstractEntity<T> {
    public Class<T> entityClass;

    public AbstractEntity(Class<T> clsEntity) {
        // TODO Auto-generated constructor stub
        this.entityClass = clsEntity;
    }

    public void insert(T entity) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            em.getTransaction().rollback();
            throw new Exception("Lỗi thêm mới");
        } finally {
            em.close();
        }
    }

    public void update(T entity) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            em.getTransaction().rollback();
            throw new Exception("Lỗi cập nhật");
        } finally {
            em.close();
        }
    }

    public void delete(Object id) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            em.getTransaction().begin();
            T entity = em.find(entityClass, id);
            em.remove(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            // TODO: handle exception
            em.getTransaction().rollback();
            throw new Exception("Lỗi xóa");
        } finally {
            em.close();
        }
    }

    public T findById(Object id) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            T entity = em.find(entityClass, id);
            return entity;
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("Lỗi tìm kiếm theo id");
        } finally {
            em.close();
        }
    }

    public List<T> findAll() throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(entityClass));
            return em.createQuery(cq).getResultList();
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("Lỗi get All");
        } finally {
            em.close();
        }
    }
}
