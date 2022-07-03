/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package like;

import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEGION'
 */
public class LikeDAO {
    
    
    public List<LikeDTO> getListLike(String articleID1) throws SQLException {
        List<LikeDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT ArticleID, MemberID, LikeStatus FROM Like WHERE ArticleID = ?";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int articleID = rs.getInt("ArticleID");
                    int memberID = rs.getInt("MemberID");
                    int likeStatus = rs.getInt("LikeStatus");
                    list.add(new LikeDTO(articleID, memberID, likeStatus));
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
    
    // return true if article is liked by memberID
    public boolean getStatusLikeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT like "
                        + "WHERE articleID=? AND memberID=? likeStatus = 1";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                ResultSet rs = ptm.executeQuery();
                check = rs.next() == false; //Check if result set is empty
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
    
    public boolean setStatusLikeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE like "
                        + "SET likeStatus = 1"
                        + "WHERE articleID=? AND memberID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                check = ptm.executeUpdate() > 0;
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
    public boolean setStatusUnlikeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE like "
                        + "SET likeStatus = 0"
                        + "WHERE articleID=? AND memberID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                check = ptm.executeUpdate() > 0;
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
