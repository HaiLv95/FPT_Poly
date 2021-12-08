package dao;

import jpautils.JpaUtils;
import model.ReportFavoriteUsers;
import model.ReportFavorites;
import model.ReportSharedFriend;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ReportDAO {
    EntityManager em = JpaUtils.getEntityManager();
    public List<ReportFavorites> getReportFavorites(){
        String jsql = "select new ReportFavorites(o.video.title, count(o),max(o.likeDate), min(o.likeDate)) from Favorite o group by o.video.title";
        TypedQuery<ReportFavorites> query = em.createQuery(jsql, ReportFavorites.class);
        return query.getResultList();
    }
    public List<ReportSharedFriend> listSharedFriend() {
        String jpql = "SELECT new ReportSharedFriend(o.user.fullname, o.user.email, o.emails, o.sharedDate)" + " FROM Shared o";
        TypedQuery<ReportSharedFriend> query = em.createQuery(jpql, ReportSharedFriend.class);
        return query.getResultList();
    }
    public List<ReportFavoriteUsers> listReportFavoriteUsers() {
        String jpql = "SELECT new ReportFavoriteUsers(o.user.username, o.user.fullname, o.user.email, o.likeDate)" + " FROM Favorite o";
        TypedQuery<ReportFavoriteUsers> query = em.createQuery(jpql, ReportFavoriteUsers.class);
        return query.getResultList();
    }
    public List<ReportFavoriteUsers> findfavoriteUser(String title) {
        try {
            String jpql = "SELECT new ReportFavoriteUsers (o.user.username, o.user.fullname, o.user.email, o.likeDate)"
                    + " FROM Favorite o WHERE o.video.title = :keyword";
            TypedQuery<ReportFavoriteUsers> query = em.createQuery(jpql, ReportFavoriteUsers.class);
            query.setParameter("keyword", title);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
