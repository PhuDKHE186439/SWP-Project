package model;
import java.sql.Timestamp;

public class News {
    private int id;
    private String title;
    private String content;
    private String image;
    private String location;
    private int status; // Thêm trường status
    private Timestamp created_at;
    private Timestamp updated_at;

    public News() {
    }

    public News(int id, String title, String content, String image, String location, int status, Timestamp created_at, Timestamp updated_at) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.location = location;
        this.status = status;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "News{" + "id=" + id + ", title=" + title + ", content=" + content + ", image=" + image + 
               ", location=" + location + ", status=" + status + ", created_at=" + created_at + 
               ", updated_at=" + updated_at + '}';
    }
}