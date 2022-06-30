package notification;

public class notificationDTO {
    private int notificationID;
    private String content;
    private int MemberID;
    private int SensorID;

    public notificationDTO(int notificationID, String content, int MemberID, int SensorID) {
        this.notificationID = notificationID;
        this.content = content;
        this.MemberID = MemberID;
        this.SensorID = SensorID;
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
        return MemberID;
    }

    public void setMemberID(int MemberID) {
        this.MemberID = MemberID;
    }

    public int getSensorID() {
        return SensorID;
    }

    public void setSensorID(int SensorID) {
        this.SensorID = SensorID;
    }
    
    
}
