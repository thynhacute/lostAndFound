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
    private String reportContent;
    private String articleContent;
    private String reportTime;
    private int articleID;
    private int memberID;
    private String fullName;
    private String email;
    private int phone;
    

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
  

    
    public ReportDTO(int articleID, int memberID, String reportContent, String reportTime) {
        this.articleID = articleID;
        this.memberID = memberID;
        this.reportContent = reportContent;
        this.reportTime = reportTime;
    }

    public ReportDTO() {
        this.articleID = 0;
        this.memberID = 0;
        this.reportContent = "";
        this.reportTime = "";
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getReportTime() {
        return reportTime;
    }

    public void setReportTime(String reportTime) {
        this.reportTime = reportTime;
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
    

  

}
