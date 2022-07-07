package notification;

public class NotificationDTO {
    private int notificationID;
    private String content;
    private int memberID;
    private int sensorID;
    private int articleID;
    private String fullName;
    private String picture;
    
    public NotificationDTO(int notificationID, String content, int memberID, int sensorID, int articleID, String fullName, String picture) {
        this.notificationID = notificationID;
        this.content = content;
        this.memberID = memberID;
        this.sensorID = sensorID;
        this.articleID = articleID;
        this.fullName = fullName;
        this.picture = picture;
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public String getContent() {
        return content;
    }

    public int getArticleID() {
        return articleID;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getSensorID() {
        return sensorID;
    }

    public void setSensorID(int sensorID) {
        this.sensorID = sensorID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
}
