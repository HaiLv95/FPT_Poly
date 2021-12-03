package model;

import javax.persistence.*;
import java.time.LocalDate;

@Table(name = "shareds", indexes = {
        @Index(name = "FK_Videos_Shared_idx", columnList = "Video_ID"),
        @Index(name = "FK_Users_Shared_idx", columnList = "User_ID")
})
@Entity
public class Shared {
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

    @Column(name = "Emails", nullable = false, length = 100)
    private String emails;

    @Column(name = "Shared_Date", nullable = false)
    private LocalDate sharedDate;

    public LocalDate getSharedDate() {
        return sharedDate;
    }

    public void setSharedDate(LocalDate sharedDate) {
        this.sharedDate = sharedDate;
    }

    public String getEmails() {
        return emails;
    }

    public void setEmails(String emails) {
        this.emails = emails;
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