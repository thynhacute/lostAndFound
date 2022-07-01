/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package notification;

import article.ArticleDTO;
import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import member.MemberDTO;

/**
 *
 * @author Admin
 */
public class NotificationDAO {

    private static final String CREATE_NOTI_ARTICLE_FIND = "INSERT INTO notification( content, memberID, SensorID, NotificationStatus)\n"
            + "VALUES( ?, ?, ?, 1)";

    public boolean NotificationComments(NotificationDTO notification) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO notification(NotificationID, content, memberID, SensorID, NotificationStatus)\n"
                        + "VALUES(?, ?, ?, ?, 1)";
                ptm = conn.prepareStatement(sql);

                ptm.setInt(1, notification.getNotificationID());
                ptm.setString(2, notification.getContent());
                ptm.setInt(3, notification.getMemberID());
                ptm.setInt(4, notification.getSensorID());
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

    public List<NotificationDTO> getListNotificationComment(int id) throws SQLException {
        List<NotificationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  SELECT N.NotificationID, N.content, N.MemberID, N.SensorID, M.FullName "
                        + "FROM Notification N\n"
                        + "INNER JOIN Member M ON M.MemberID = N.SensorID WHERE N.MemberID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int notificationID = rs.getInt("notificationID");
                    String content = rs.getString("content");
                    int memberID = rs.getInt("memberID");
                    int sensorID = rs.getInt("sensorID");
                    String fullName = rs.getString("fullName");
                    list.add(new NotificationDTO(notificationID, content, memberID, sensorID, fullName));
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public boolean NotificationArticle(NotificationDTO noti) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_NOTI_ARTICLE_FIND);
                ptm.setString(1, noti.getContent());
                ptm.setInt(2, noti.getMemberID());
                ptm.setInt(3, noti.getSensorID());
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

    public List<NotificationDTO> getListNotificationArticleFind(int memberID) throws SQLException {
        List<NotificationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  SELECT N.NotificationID, N.content, N.MemberID, N.SensorID, M.FullName "
                        + "FROM Notification N\n"
                        + "INNER JOIN Member M ON M.MemberID = N.SensorID WHERE N.MemberID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, memberID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int notificationID = rs.getInt("notificationID");
                    String content = rs.getString("content");
                    int memberID1 = rs.getInt("memberID");
                    int sensorID = rs.getInt("sensorID");
                    String fullName = rs.getString("fullName");
                    list.add(new NotificationDTO(notificationID, content, memberID1, sensorID, fullName));
                }
            }
        } catch (Exception e) {
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
        return list;

    }

}
