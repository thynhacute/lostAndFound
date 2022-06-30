package notification;

public class NotificationDTO {
    private int notificationID;
    private String content;
    private int memberID;
    private int sensorID;
    private String fullName;
    
    public NotificationDTO(int notificationID, String content, int memberID, int sensorID, String fullName) {
        this.notificationID = notificationID;
        this.content = content;
        this.memberID = memberID;
        this.sensorID = sensorID;
        this.fullName = fullName;
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
