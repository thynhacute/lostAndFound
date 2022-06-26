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
    private String postTime;
    private int locationID;
    private int memberID;
    private int articleTypeID;
    private int ItemID;
    private String fullName;
    private String email;
    private int phone;
    private String picture;
    private String articleTypeName;
    private String itemName;
    private String locationName;

    public ArticleDTO(int articleID, String articleContent, String imgURL, String postTime, int locatioID, int memberID, int articleTypeID, int ItemID, String fullName, String email, int phone, String picture, String articleTypeName, String itemName, String locationName) {
        this.articleID = articleID;
        this.articleContent = articleContent;
        this.imgURL = imgURL;
        this.postTime = postTime;
        this.locationID = locatioID;
        this.memberID = memberID;
        this.articleTypeID = articleTypeID;
        this.ItemID = ItemID;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.picture = picture;
        this.articleTypeName = articleTypeName;
        this.itemName = itemName;
        this.locationName = locationName;
    }

    public ArticleDTO(int articleID, String articleContent, int locationID) {
        this.articleID = articleID;
        this.articleContent = articleContent;
        this.locationID = locationID;
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

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public int getLocationID() {
        return locationID;
    }

    public void setLocatioID(int locatioID) {
        this.locationID = locatioID;
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getArticleTypeName() {
        return articleTypeName;
    }

    public void setArticleTypeName(String articleTypeName) {
        this.articleTypeName = articleTypeName;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

}
