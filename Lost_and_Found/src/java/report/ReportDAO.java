/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Owner
 */
public class ReportDAO {

    private static final String CREATE_REPORT = "INSERT INTO Report(ArticleID, MemberID,ReportContent,ReportStatus)\n"
            + "VALUES(?,?,?,1)";

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

}
