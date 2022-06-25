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

    public CommentDTO(int commentID, int articleID, int memberID, String commentContent, String commentTime) {
        this.commentID = commentID;
        this.articleID = articleID;
        this.memberID = memberID;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
    }

    public CommentDTO() {
        this.commentID = 0;
        this.articleID = 0;
        this.memberID = 0;
        this.commentContent = "";
        this.commentTime = "";
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

}
