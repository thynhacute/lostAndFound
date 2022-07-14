/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import article.ArticleDTO;
import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Owner
 */
public class ReportDAO {

    private static final String CREATE_REPORT = "INSERT INTO Report(ArticleID, MemberID,ReportContent,ReportStatus)\n"
            + "VALUES(?,?,?,1)";
    private static final String ARTICLE_REPORT = "select R.ReportID,R.ReportContent,R.ReportTime, R.ArticleID,R.MemberID, A.ArticleContent,A.MemberID as MemberIDArticle, M.FullName, B.Email\n"
            + "from Report R, Article A, Member M , Member B\n"
            + "Where R.ArticleID = A.ArticleID AND R.MemberID = M.MemberID AND A.MemberID = B.MemberID AND R.ReportStatus = 1";
    private static final String DELETE_REPORT_ARTICLE = "UPDATE Report SET ReportStatus = 0 WHERE ReportID = ?";

    private static final String TOTAL_ARTICLE_REPORT = "SELECT COUNT(ArticleID) AS [Total Report] FROM REPORT WHERE ArticleID = ? ";

    private static final String DELETE_COMMAND_REPORT_MEMBER = "UPDATE Report SET ReportStatus = 0 WHERE ReportID = ?";

    public boolean createReport(ReportDTO report) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_REPORT);
                ptm.setInt(1, report.getArticleID());
                ptm.setInt(2, report.getMemberID());
                ptm.setString(3, report.getReportContent());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteReportArticle(String reportID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_REPORT_ARTICLE);
                ptm.setString(1, reportID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<ReportDTO> getListArticleByReport() throws SQLException {
        List<ReportDTO> listReportArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ARTICLE_REPORT);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int reportID = rs.getInt("ReportID");
                String reportContent = rs.getString("ReportContent");
                String articleContent = rs.getString("ArticleContent");
                String reportTime = rs.getString("ReportTime");
                int articleID = rs.getInt("ArticleID");
                int memberID = rs.getInt("MemberID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                int memberIDArticle = rs.getInt("MemberIDArticle");

                listReportArticle.add(new ReportDTO(reportID, reportContent, articleContent, reportTime, articleID, memberID, fullName, email, memberIDArticle));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listReportArticle;
    }

    public boolean deleteCommandReportMember(String memberID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_COMMAND_REPORT_MEMBER);
                ptm.setString(1, memberID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
