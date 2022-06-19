/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package article;

/**
 *
 * @author Owner
 */
public class ArticleDTO {

    private int articleID;
    private String articleContent;
    private String imgURL;
    private float postTime;
    private int locatioID;
    private int memberID;
    private int articleTypeID;
    private int ItemID;

    public ArticleDTO(int articleID, String articleContent, String imgURL, float postTime, int locatioID, int memberID, int articleTypeID, int ItemID) {
        this.articleID = articleID;
        this.articleContent = articleContent;
        this.imgURL = imgURL;
        this.postTime = postTime;
        this.locatioID = locatioID;
        this.memberID = memberID;
        this.articleTypeID = articleTypeID;
        this.ItemID = ItemID;
    }

    public ArticleDTO() {
        this.articleID = 0;
        this.articleContent = "";
        this.imgURL = "";
        this.postTime = 0;
        this.locatioID = 0;
        this.memberID = 0;
        this.articleTypeID = 0;
        this.ItemID = 0;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public float getPostTime() {
        return postTime;
    }

    public void setPostTime(float postTime) {
        this.postTime = postTime;
    }

    public int getLocatioID() {
        return locatioID;
    }

    public void setLocatioID(int locatioID) {
        this.locatioID = locatioID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getArticleTypeID() {
        return articleTypeID;
    }

    public void setArticleTypeID(int articleTypeID) {
        this.articleTypeID = articleTypeID;
    }

    public int getItemID() {
        return ItemID;
    }

    public void setItemID(int ItemID) {
        this.ItemID = ItemID;
    }

    
}