package comment;

/**
 *
 * @author Owner
 */
public class CommentDTO {

    private int commentID;
    private int articleID;
    private int memberID;
    private String commentContent;
    private String commentTime;
    private String fullName;
    private String picture;

    public CommentDTO(int commentID, int articleID, int memberID, String commentContent, String commentTime, String fullName, String picture) {
        this.commentID = commentID;
        this.articleID = articleID;
        this.memberID = memberID;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
        this.fullName = fullName;
        this.picture = picture;
    }

    public CommentDTO() {
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    
}
