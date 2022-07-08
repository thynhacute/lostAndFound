/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like;

/**
 *
 * @author LEGION'
 */
public class LikeDTO {
    private int articleID;
    private int memberID;
    private int statusLike;

    public LikeDTO() {
    }

    public LikeDTO(int articleID, int memberID, int statusLike) {
        this.articleID = articleID;
        this.memberID = memberID;
        this.statusLike = statusLike;
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

    public int getStatusLike() {
        return statusLike;
    }

    public void setStatusLike(int statusLike) {
        this.statusLike = statusLike;
    }

    
}
