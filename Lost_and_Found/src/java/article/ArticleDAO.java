/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package article;

import dbutils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {

    private static final String GET_LIST_ARTICLE = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID";

    private static final String GET_LIST_LOST_ARTICLE = "";
    private static final String GET_LIST_PICKED_ARTICLE = "";

    public List<ArticleDTO> getAllArticle() throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int articleID = rs.getInt("ArticleID");
                String articleContent = rs.getString("ArticleContent");
                String imgURL = rs.getString("ImgURL");
                String postTime = rs.getString("PostTime");
                int locationID = rs.getInt("LocationID");
                int memberID = rs.getInt("MemberID");
                int articleTypeID = rs.getInt("ArticleTypeID");
                int itemID = rs.getInt("ItemID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                int phone = rs.getInt("Phone");
                String picture = rs.getString("Picture");
                String articleTypeName = rs.getString("ArticleTypeName");
                String itemName = rs.getString("ItemName");
                String locationName = rs.getString("LocationName");
                listArticle.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName));

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
        return listArticle;

    }

    public List<ArticleDTO> getLostArticles() throws SQLException {
        List<ArticleDTO> listArticles = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_LOST_ARTICLE);
            rs = ptm.executeQuery();
            while (rs.next()) {

                int articleID = rs.getInt("ArticleID");
                String articleContent = rs.getString("ArticleContent");
                String imgURL = rs.getString("ImgURL");
                String postTime = rs.getString("PostTime");
                int locationID = rs.getInt("LocationID");
                int memberID = rs.getInt("MemberID");
                int articleTypeID = rs.getInt("ArticleTypeID");
                int itemID = rs.getInt("ItemID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                int phone = rs.getInt("Phone");
                String picture = rs.getString("Picture");
                String articleTypeName = rs.getString("ArticleTypeName");
                String itemName = rs.getString("ItemName");
                String locationName = rs.getString("LocationName");
                listArticles.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName));
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

        return listArticles;
    }

    public List<ArticleDTO> getPickedArticles() throws SQLException {
        List<ArticleDTO> listArticles = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_PICKED_ARTICLE);
            rs = ptm.executeQuery();
            while (rs.next()) {

                int articleID = rs.getInt("ArticleID");
                String articleContent = rs.getString("ArticleContent");
                String imgURL = rs.getString("ImgURL");
                String postTime = rs.getString("PostTime");
                int locationID = rs.getInt("LocationID");
                int memberID = rs.getInt("MemberID");
                int articleTypeID = rs.getInt("ArticleTypeID");
                int itemID = rs.getInt("ItemID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                int phone = rs.getInt("Phone");
                String picture = rs.getString("Picture");
                String articleTypeName = rs.getString("ArticleTypeName");
                String itemName = rs.getString("ItemName");
                String locationName = rs.getString("LocationName");
                listArticles.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName));
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

        return listArticles;
    }

    public List<ArticleDTO> getListArticleByLocation(String searchByLocation) throws SQLException {
        List<ArticleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, \n"
                        + "A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, \n"
                        + "I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L\n"
                        + "            WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND\n"
                        + "			A.LocationID = L.LocationID AND L.LocationID = ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, searchByLocation);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int articleID = rs.getInt("ArticleID");
                    String articleContent = rs.getString("ArticleContent");
                    String imgURL = rs.getString("ImgURL");
                    String postTime = rs.getString("PostTime");
                    int locationID = rs.getInt("LocationID");
                    int memberID = rs.getInt("MemberID");
                    int articleTypeID = rs.getInt("ArticleTypeID");
                    int itemID = rs.getInt("ItemID");
                    String fullName = rs.getString("FullName");
                    String email = rs.getString("Email");
                    int phone = rs.getInt("Phone");
                    String picture = rs.getString("Picture");
                    String articleTypeName = rs.getString("ArticleTypeName");
                    String itemName = rs.getString("ItemName");
                    String locationName = rs.getString("LocationName");
                    list.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName));

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
