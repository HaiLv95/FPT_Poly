package model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Table(name = "favorites", indexes = {
        @Index(name = "FK_Videos_favorite_idx", columnList = "Video_ID"),
        @Index(name = "FK_Users_favorite_idx", columnList = "User_ID")
})
@Entity
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "User_ID", nullable = false)
    private User user;

    @ManyToOne(optional = false)
    @JoinColumn(name = "Video_ID", nullable = false)
    private Video video;

    @Column(name = "LikeDate", nullable = false)
    private LocalDate likeDate;

    public LocalDate getLikeDate() {
        return likeDate;
    }

    public void setLikeDate(LocalDate likeDate) {
        this.likeDate = likeDate;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}