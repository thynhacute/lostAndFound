/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comment;

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
public class CommentDAO {

    private static final String CREATE_COMMENT = "INSERT INTO Comment(ArticleID, MemberID,CommentContent,CommentStatus)\n"
            + "VALUES(?,?,?,1)";

    private static final String GET_LIST_COMMENT_BY_ARTICLEID = "SELECT C.ArticleID, C.CommentID,  C.MemberID, C.CommentContent, C.CommentTime, M.MemberID, M.FullName, M.Picture FROM Article A , Comment C , Member M\n"
            + "WHERE A.ArticleID=C.ArticleID AND C.MemberID=M.MemberID AND  C.ArticleID = ?";

    public boolean createComment(CommentDTO comment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_COMMENT);
                ptm.setInt(1, comment.getArticleID());
                ptm.setInt(2, comment.getMemberID());
                ptm.setString(3, comment.getCommentContent());
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

    public List<CommentDTO> getListCommentsByArticleID(String articleID1) throws SQLException {
        List<CommentDTO> listComments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_COMMENT_BY_ARTICLEID);
            ptm.setString(1, articleID1);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int articleID = rs.getInt("ArticleID");
                int commentID = rs.getInt("CommentID");
                int memberID = rs.getInt("MemberID");
                String commentContent = rs.getString("CommentContent");
                String commentTime = rs.getString("CommentTime");
                String fullName = rs.getString("FullName");
                String picture = rs.getString("Picture");

                listComments.add(new CommentDTO(commentID, articleID, memberID, commentContent, commentTime, fullName, picture));                              
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

        return listComments;
    }

}
