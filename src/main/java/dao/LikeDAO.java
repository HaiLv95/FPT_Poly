package dao;

import jpautils.JpaUtils;
import model.Favorite;
import model.Video;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class LikeDAO extends AbstractEntity<Favorite> {

    public LikeDAO() {
        super(Favorite.class);
    }
    public List<Video> myFavorite(String userID) throws Exception {
        EntityManager em = JpaUtils.getEntityManager();
        String jpql = "SELECT v FROM Video v " + " where exists (SELECT f FROM Favorite f WHERE "
                + " v.id = f.video.id AND f.user.username = :userID)";
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setParameter("userID", userID);
        return query.getResultList();
    }
    public List<Favorite> CheckLike(String userID, String videoID){
        EntityManager em = JpaUtils.getEntityManager();
        String  jsql = "select f from Favorite f where f.video.id = :videoid and f.user.username = :userID";
        TypedQuery<Favorite> query = em.createQuery(jsql, Favorite.class);
        query.setParameter("videoid", videoID);
        query.setParameter("userID", userID);
        return query.getResultList();
    }

}
