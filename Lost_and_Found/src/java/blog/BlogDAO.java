/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blog;

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
public class BlogDAO {

    private static final String GET_LIST_BLOG = "SELECT BlogID, BlogImage, BlogName, BlogContent, MemberID FROM Blog WHERE MemberID = 1";
    private static final String GET_BLOG_DETAIL = "SELECT B.BlogID, B.BlogImage, B.BlogName, B.BlogContent, B.MemberID, M.FullName FROM Blog B, Member M \n"
            + "WHERE B.MemberID = M.MemberID AND B.BlogID =?";

    public List<BlogDTO> getListBlog() throws SQLException {
        List<BlogDTO> listBlog = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_BLOG);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("BlogID");
                    String blogImage = rs.getString("BlogImage");
                    String blogName = rs.getString("BlogName");
                    String blogContent = rs.getString("BlogContent");
                    int memberID = rs.getInt("MemberID");
                    listBlog.add(new BlogDTO(blogID, blogImage, blogName, blogContent, memberID));
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
        return listBlog;
    }

    public BlogDTO getBlogByID(String blogID1) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_BLOG_DETAIL);
            ptm.setString(1, blogID1);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int blogID = rs.getInt("BlogID");
                String blogImage = rs.getString("BlogImage");
                String blogName = rs.getString("BlogName");
                String blogContent = rs.getString("BlogContent");
                int memberID = rs.getInt("MemberID");
                String fullName = rs.getString("FullName");
                BlogDTO blog = new BlogDTO(blogID, blogImage, blogName, blogContent, memberID, fullName);
                return blog;
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
        return null;
    }
}
