/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package notification;

import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class notificationDAO {

    public boolean NotificationComments(notificationDTO notification) throws SQLException {
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
}
