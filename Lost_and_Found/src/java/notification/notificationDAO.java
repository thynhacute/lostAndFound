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

    private static final String CREATE_NOTI_ARTICLE_FIND = "INSERT INTO notification( content, memberID, SensorID, ArticleID, NotificationStatus)\n"
            + "VALUES( ?, ?, ?, ?, 1)";

    public boolean NotificationComments(NotificationDTO notification) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO notification(content, memberID, SensorID, ArticleID, NotificationStatus)\n"
                        + "VALUES(?, ?, ?, ?, 1)";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, notification.getContent());
                ptm.setInt(2, notification.getMemberID());
                ptm.setInt(3, notification.getSensorID());
                ptm.setInt(4, notification.getArticleID());
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

    public List<NotificationDTO> getListNotification(int id) throws SQLException {
        List<NotificationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  select N.NotificationID, N.content, N.MemberID, N.SensorID, N.NotificationStatus, N.ArticleID, M.FullName, M.Picture, N.NotificationStatus \n"
                        + "					FROM Notification N\n"
                        + "					INNER JOIN Member M ON M.MemberID = N.SensorID WHERE N.MemberID = ? AND N.NotificationStatus = 1\n"
                        + "ORDER BY N.NotificationID DESC";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int notificationID = rs.getInt("notificationID");
                    String content = rs.getString("content");
                    int memberID = rs.getInt("memberID");
                    int sensorID = rs.getInt("sensorID");
                    int articleID = rs.getInt("articleID");
                    String fullName = rs.getString("fullName");
                    String picture = rs.getString("picture");
                    list.add(new NotificationDTO(notificationID, content, memberID, sensorID, articleID, fullName, picture));
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
                ptm.setInt(4, noti.getArticleID());
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

    public boolean getSeenNoti(String articleID1) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "UPDATE [dbo].[Notification]\n"
                + "   SET [NotificationStatus] = 0\n"
                + " WHERE ArticleID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, articleID1);
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public boolean getSeenNotiAll(int memberID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "UPDATE [dbo].[Notification]\n"
                + "   SET [NotificationStatus] = 0\n"
                + " WHERE memberID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, memberID);
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public List<NotificationDTO> getListSeenNoti(int id) throws SQLException {
        List<NotificationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "  select N.NotificationID, N.content, N.MemberID, N.SensorID, N.NotificationStatus, N.ArticleID, M.FullName, M.Picture, N.NotificationStatus \n"
                        + "					FROM Notification N\n"
                        + "					INNER JOIN Member M ON M.MemberID = N.SensorID WHERE N.MemberID = ? AND N.NotificationStatus = 0\n"
                        + "ORDER BY N.NotificationID DESC";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int notificationID = rs.getInt("notificationID");
                    String content = rs.getString("content");
                    int memberID = rs.getInt("memberID");
                    int sensorID = rs.getInt("sensorID");
                    int articleID = rs.getInt("articleID");
                    String fullName = rs.getString("fullName");
                    String picture = rs.getString("picture");
                    list.add(new NotificationDTO(notificationID, content, memberID, sensorID, articleID, fullName, picture));
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

    public int checkCount(int memberID, int articleID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        String sql = "SELECT count(*) as total_like from [dbo].[Like] WHERE MemberID = ? AND ArticleID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, memberID);
                ptm.setInt(2, articleID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("total_like");
                }
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
        return count;
    }
    }
