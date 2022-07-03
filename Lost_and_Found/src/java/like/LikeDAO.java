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
                ptm.setString(1, articleID1);
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
    public boolean getStatusLikeArticle(int articleID, int memberId) throws SQLException {
        boolean liked = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT [LikeID]" +
                            "FROM [Like]" +
                            "WHERE ArticleID = ? AND MemberID = ? AND LikeStatus = 1";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                ptm.setInt(2, memberId);
                ResultSet rs = ptm.executeQuery();
                if (rs.next() == true) { //Check if result set is not empty
                    liked = true;
                }
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
        return liked;
    }
    
    public boolean setStatusLikeArticle(int articleID, int memberId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "BEGIN TRANSACTION\n" +
                            "UPDATE [Like]\n" +
                            "  SET likeStatus = 1 WHERE articleID = ? AND memberID = ?\n" +
                            "IF @@ROWCOUNT = 0\n" +
                            "BEGIN\n" +
                            "  INSERT INTO [Like](ArticleID, MemberID, LikeStatus)\n" +
                            "  VALUES (?, ?, 1)\n" +
                            "END\n" +
                            "COMMIT TRANSACTION";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                ptm.setInt(2, memberId);
                ptm.setInt(3, articleID);
                ptm.setInt(4, memberId);
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
    public boolean setStatusUnlikeArticle(int articleID, int memberId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE [Like]" +
                            "SET LikeStatus = 0 " +
                            "WHERE ArticleID = ? AND MemberID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, articleID);
                ptm.setInt(2, memberId);
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
