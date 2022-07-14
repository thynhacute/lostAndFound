/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

public class MemberDTO {

    private int id;
    private String email;
    private String fullName;
    private String picture;
    private int phone;
    private String profileInfo;
    private int roleID;
    private int totalReport;
    private String articleContent;
    private String reportContent;

    public MemberDTO() {
    }

    public MemberDTO(int id, String email, String fullName, String picture, int phone, String profileInfo, int roleID, int totalReport) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.picture = picture;
        this.phone = phone;
        this.profileInfo = profileInfo;
        this.roleID = roleID;
        this.totalReport = totalReport;
    }
    public MemberDTO(int id, String email, String fullName, String picture, int phone, String profileInfo, int roleID) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.picture = picture;
        this.phone = phone;
        this.profileInfo = profileInfo;
        this.roleID = roleID;
    }


        public MemberDTO(int id, String email, String fullName, String picture, int phone, String profileInfo, int roleID, int totalReport, String articleContent, String reportContent) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.picture = picture;
        this.phone = phone;
        this.profileInfo = profileInfo;
        this.roleID = roleID;
        this.totalReport = totalReport;
        this.articleContent = articleContent;
        this.reportContent = reportContent;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getProfileInfo() {
        return profileInfo;
    }

    public void setProfileInfo(String profileInfo) {
        this.profileInfo = profileInfo;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    public int getTotalReport() {
        return totalReport;
    }
    public void setTotalReport(int totalReport) {
        this.totalReport = totalReport;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

}
