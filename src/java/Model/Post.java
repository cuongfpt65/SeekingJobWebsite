package Model;



import java.util.Date;

/**
 *
 * @author Nguyen Van Chien CE170237
 */
public class Post {

        private String Id;
        private String title;
        private String description;
        private String IdCompany;
        private String salary;
        private String timePosted;
        private Date start;
        private Date end;   
        private String major;
        private String jobTypes;
        private String location;
        private String image;

    public Post() {
    }

    public Post(String Id, String title, String description, String IdCompany, String salary, String timePosted, Date start, Date end, String major, String jobTypes, String location, String image) {
        this.Id = Id;
        this.title = title;
        this.description = description;
        this.IdCompany = IdCompany;
        this.salary = salary;
        this.timePosted = timePosted;
        this.start = start;
        this.end = end;
        this.major = major;
        this.jobTypes = jobTypes;
        this.location = location;
        this.image = image;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIdCompany() {
        return IdCompany;
    }

    public void setIdCompany(String IdCompany) {
        this.IdCompany = IdCompany;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getTimePosted() {
        return timePosted;
    }

    public void setTimePosted(String timePosted) {
        this.timePosted = timePosted;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getJobTypes() {
        return jobTypes;
    }

    public void setJobTypes(String jobTypes) {
        this.jobTypes = jobTypes;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Post{" + "Id=" + Id + ", title=" + title + ", description=" + description + ", IdCompany=" + IdCompany + ", salary=" + salary + ", timePosted=" + timePosted + ", start=" + start + ", end=" + end + ", major=" + major + ", jobTypes=" + jobTypes + ", location=" + location + ", image=" + image + '}';
    }

        
    

}
