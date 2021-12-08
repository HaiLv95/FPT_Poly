package dao;

import jpautils.JpaUtils;
import model.Video;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class VideoDAO extends AbstractEntity<Video>{
    public VideoDAO() {
        super(Video.class);
    }

    public List<Video> findAllVDActive() throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
            CriteriaQuery cq = criteriaBuilder.createQuery();
            Root root = cq.from(entityClass);
            cq.select(root);
            Predicate predicate = criteriaBuilder.equal(root.get("actives").as(Boolean.class), true);
            cq.where(predicate);
            cq.orderBy(criteriaBuilder.desc(root.get("views")));
            return em.createQuery(cq).getResultList();
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("Lỗi load video");
        } finally {
            em.close();
        }
    }
    public List<Video> findTop5Video() throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jsql = "select v from Video v order by v.views desc";
            TypedQuery<Video> query = em.createQuery(jsql, Video.class).setMaxResults(5);
            return query.getResultList();
        } catch (Exception e) {
            // TODO: handle exception
            throw new Exception("Lỗi load top video");
        } finally {
            em.close();
        }
    }
}
