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
    private int articleID;
    private int memberID;
    private String reportContent;
    private float reportTime;         

    public ReportDTO(int articleID, int memberID, String reportContent, float reportTime) {
        this.articleID = articleID;
        this.memberID = memberID;
        this.reportContent = reportContent;
        this.reportTime = reportTime;
    }

    public ReportDTO() {
        this.articleID = 0;
        this.memberID = 0;
        this.reportContent = "";
        this.reportTime = 0;
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

    public float getReportTime() {
        return reportTime;
    }

    public void setReportTime(float reportTime) {
        this.reportTime = reportTime;
    }

    
    
}
