package model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TopLike {
    @Id
    private String id;
    private String title;
    private long likes;

    public TopLike() {

    }
    public TopLike(String id, String title, long likes) {
        super();
        this.id = id;
        this.title = title;
        this.likes = likes;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getLikes() {
        return likes;
    }

    public void setLikes(long likes) {
        this.likes = likes;
    }
}
