package model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class ReportFavorites {
    @Id
    private String title;
    private long likes;
    private LocalDate latestDate;
    private LocalDate oldestDate;

    public String getTitle() {
        return title;
    }

    public void setGroup(String title) {
        this.title = title;
    }

    public long getLikes() {
        return likes;
    }

    public void setLikes(long likes) {
        this.likes = likes;
    }

    public LocalDate getLatestDate() {
        return latestDate;
    }

    public void setLatestDate(LocalDate latestDate) {
        this.latestDate = latestDate;
    }

    public LocalDate getOldestDate() {
        return oldestDate;
    }

    public void setOldestDate(LocalDate oldestDate) {
        this.oldestDate = oldestDate;
    }

    public ReportFavorites() {

    }

    public ReportFavorites(String title, long likes, LocalDate latestDate, LocalDate oldestDate) {
        super();
        this.title = title;
        this.likes = likes;
        this.latestDate = latestDate;
        this.oldestDate = oldestDate;
    }

}
