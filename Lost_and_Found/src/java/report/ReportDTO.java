/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

/**
 *
 * @author Owner
 */
public class ReportDTO {

    private int reportID;
    private int articleID;
    private int memberID;
    private String reportContent;
    private String reportTime;
    private String articleContent;
    private String fullName;
    private String email;
    private int phone;
    private int memberIDArticle;
    
    public ReportDTO(int reportID, int articleID, int memberID, String reportContent, String reportTime) {
        this.reportID = reportID;
        this.articleID = articleID;
        this.memberID = memberID;
        this.reportContent = reportContent;
        this.reportTime = reportTime;
}

    

    // report article +>
    public ReportDTO(int reportID, String reportContent, String articleContent, String reportTime, int articleID, int memberID, String fullName, String email) {
        this.reportID = reportID;
        this.reportContent = reportContent;
        this.articleContent = articleContent;
        this.reportTime = reportTime;
        this.articleID = articleID;
        this.memberID = memberID;
        this.fullName = fullName;
        this.email = email;
    }

    public ReportDTO() {
        this.reportID = 0;
        this.articleID = 0;
        this.memberID = 0;
        this.reportContent = "";
        this.reportTime = "";
    }


      public ReportDTO(int reportID, String reportContent, String articleContent, String reportTime, int articleID, int memberID, String fullName, String email,int memberIDArticle) {
        this.reportID = reportID;
        this.reportContent = reportContent;
        this.articleContent = articleContent;
        this.reportTime = reportTime;
        this.articleID = articleID;
        this.memberID = memberID;
        this.fullName = fullName;
        this.email = email;
        this.memberIDArticle = memberIDArticle;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }


    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
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

    public String getReportContent() {
        return reportContent;
    }
    
    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
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


    public int getMemberIDArticle() {
        return memberIDArticle;
    }

    public void setMemberIDArticle(int memberIDArticle) {
        this.memberIDArticle = memberIDArticle;
    }
    

}
