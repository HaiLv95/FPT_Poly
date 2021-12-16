package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "videos")
@Entity
public class Video {
    @Id
    @Column(name = "Id", nullable = false, length = 50)
    private String id;

    @Column(name = "Title", nullable = false, length = 100)
    private String title;

    @Column(name = "Poster", nullable = false, length = 100)
    private String poster;

    @Column(name = "Descriptions", nullable = false)
    private String descriptions;

    @Column(name = "Actives", nullable = false)
    private Boolean actives = false;

    @Column(name = "Views", nullable = false)
    private int views;

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public Boolean getActives() {
        return actives;
    }

    public void setActives(Boolean actives) {
        this.actives = actives;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}