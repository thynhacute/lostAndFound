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
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1";
    private static final String GET_LIST_ARTICLE_TOP_LIKES = "SELECT TOP 3 A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName  FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID  AND A.ArticleStatus = 1 \n"
            + "ORDER BY A.TotalLike DESC";
    private static final String GET_LIST_LOST_ARTICLE = "SELECT TOP 3 A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName  FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID  AND A.ArticleStatus = 1 AND A.ArticleTypeID = '1'\n"
            + "ORDER BY A.PostTime DESC";
    private static final String GET_LIST_PICKED_ARTICLE = "SELECT TOP 3 A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName  FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID  AND A.ArticleTypeID = '2'  AND A.ArticleStatus = 1\n"
            + "ORDER BY A.PostTime DESC";
    private static final String GET_LIST_ARTICLE_BY_ARTYPE_ITEMTYPE = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName \n"
            + "FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1 \n"
            + "AND ART.ArticleTypeID = (SELECT ArticleTypeID FROM ArticleType WHERE ArticleTypeName = ?) AND I.ItemID = (SELECT ItemID FROM ItemType WHERE ItemName = ?) ";
    private static final String GET_LIST_ARTICLE_BY_ARTYPE_LOCATION = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName \n"
            + "FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1\n"
            + "AND ART.ArticleTypeID = (SELECT ArticleTypeID FROM ArticleType WHERE ArticleTypeName = ?) AND L.locationID = (SELECT LocationID FROM Location WHERE LocationName = ?)";
    private static final String GET_LIST_ARTICLE_BY_ITEMTYPE_LOCATION = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName \n"
            + "FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1\n"
            + "AND I.ItemID = (SELECT ItemID FROM ItemType WHERE ItemName = ?) AND L.LocationID = (SELECT LocationID FROM Location WHERE LocationName = ?)";
    private static final String GET_LIST_ARTICLE_BY_ARTYPE_ITEMTYPE_LOCATION = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName \n"
            + "FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1\n"
            + "AND ART.ArticleTypeID = (SELECT ArticleTypeID FROM ArticleType WHERE ArticleTypeName = ?) "
            + "AND I.ItemID = (SELECT ItemID FROM ItemType WHERE ItemName = ?) AND L.LocationID = (SELECT LocationID FROM Location WHERE LocationName = ?)";
    private static final String GET_ARTICLE_DETAIL = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName,A.TotalReport, A.TotalLike FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID "
            + "AND A.ArticleID =?";
    private static final String CREATE_ARTICLE = "INSERT INTO Article( ArticleContent,ImgURL,ArticleTypeID,ItemID,LocationID,MemberID,ArticleStatus,TotalReport,TotalLike)\n"
            + "VALUES(?,?,?,?,?,?,1,0,0)";

    private static final String GET_LIST_ARTICLE_ACTIVE = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID,A.TotalReport, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 1 ";
    private static final String GET_LIST_ARTICLE_BAND = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus = 0 ";

    private static final String DELETE_ARTICLE = "UPDATE Article SET ArticleStatus = 0 WHERE ArticleID = ?";
    private static final String ACTIVE_ARTICLE = "UPDATE Article SET ArticleStatus = 1 WHERE ArticleID = ?";

    private static final String GET_LIST_ARTICLE_BY_ITEMS_LOCATION_ARTYPE_2 = "SELECT M.Email,M.FullName,M.Phone,M.Picture , A.MemberID,A.ArticleID,A.ArticleContent , A.LocationID, A.ItemID FROM Article A , Member M\n"
            + "WHERE A.ArticleTypeID =2 AND A.ItemID=? AND A.LocationID =?  AND A.ArticleStatus=1 AND A.MemberID=M.MemberID ";
    private static final String GET_LIST_ARTICLE_BY_ITEMS_LOCATION_ARTYPE_1 = "SELECT M.Email,M.FullName,M.Phone,M.Picture , A.MemberID,A.ArticleID,A.ArticleContent , A.LocationID, A.ItemID FROM Article A , Member M\n"
            + "WHERE A.ArticleTypeID =1 AND A.ItemID=? AND A.LocationID =?  AND A.ArticleStatus=1 AND A.MemberID=M.MemberID ";

    private static final String UPDATE_TOTAL_REPORT_ARTICLE = "UPDATE Article SET TotalReport = TotalReport +1 WHERE ArticleID = ?";
    private static final String DELETE_TOTAL_REPORT_ARTICLE = "UPDATE Article SET TotalReport = TotalReport -1 WHERE ArticleID = ?";

    private static final String GET_LIST_ARTICLE_SUCCESS = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.MemberID, A.ArticleTypeID,A.TotalReport, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName, I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L \n"
            + "WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.LocationID = L.LocationID AND A.ArticleStatus is NULL ";

    
      private static final String GET_TOTAL_REPORT = "select TotalReport  from Article where ArticleID = ? ";

    
    public int getCountReport(int articleID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
            ptm = conn.prepareStatement(GET_TOTAL_REPORT);
            ptm.setInt(1, articleID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TotalReport");
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
    public boolean deleteArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_ARTICLE);
                ptm.setInt(1, articleID);
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

    public boolean activeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ACTIVE_ARTICLE);
                ptm.setInt(1, articleID);
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

    public List<ArticleDTO> getListArticleByBand() throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BAND);
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

    public List<ArticleDTO> getListArticleByActive() throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_ACTIVE);
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
                int totalReport = rs.getInt("TotalReport");
                listArticle.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName, totalReport));

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

    public List<ArticleDTO> getTopLikesArticle() throws SQLException {
        List<ArticleDTO> listArticles = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_TOP_LIKES);
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

    public List<ArticleDTO> getListArticleByType(String searchByType) throws SQLException {
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
                        + "            WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.ArticleStatus = 1 AND\n"
                        + "			A.LocationID = L.LocationID AND A.ArticleTypeID = (SELECT ArticleTypeID FROM ArticleType WHERE ArticleTypeName = ?) ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, searchByType);
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
                        + "            WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.ArticleStatus = 1 AND\n"
                        + "			A.LocationID = L.LocationID AND L.LocationID = (SELECT LocationID FROM Location WHERE LocationName = ?) ";
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

    public List<ArticleDTO> getListArticleByItemType(String searchByItem) throws SQLException {
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
                        + "            WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND A.ArticleStatus = 1 AND\n"
                        + "			A.LocationID = L.LocationID AND A.ItemID = (SELECT ItemID FROM ItemType WHERE ItemName = ?) ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, searchByItem);
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

    public List<ArticleDTO> getArticleByArticleTypeItemtype(String searchByType, String searchByItem) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ARTYPE_ITEMTYPE);
            ptm.setString(1, searchByType);
            ptm.setString(2, searchByItem);
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

    public List<ArticleDTO> getArticleByArticleTypLocation(String searchByType, String searchByLocation) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ARTYPE_LOCATION);
            ptm.setString(1, searchByType);
            ptm.setString(2, searchByLocation);
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

    public List<ArticleDTO> getArticleByItemtypeLocaion(String searchByItem, String searchByLocation) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ITEMTYPE_LOCATION);
            ptm.setString(1, searchByItem);
            ptm.setString(2, searchByLocation);
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

    public List<ArticleDTO> getArticleByArticleTypeItemtypeLocaion(String searchByType, String searchByItem, String searchByLocation) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ARTYPE_ITEMTYPE_LOCATION);
            ptm.setString(1, searchByType);
            ptm.setString(2, searchByItem);
            ptm.setString(3, searchByLocation);
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

    public ArticleDTO getArticleByID(String articleID1) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_ARTICLE_DETAIL);
            ptm.setString(1, articleID1);
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
                int totalReport = rs.getInt("totalReport");
                int totalLike = rs.getInt("TotalLike");

                ArticleDTO article = new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName, totalReport, totalLike);
                return article;
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

    public List<ArticleDTO> getListArticleFoundByMember(int id) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID,\n"
                + "                       A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName,\n"
                + "                       I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L\n"
                + "                                    WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND\n"
                + "                        			A.LocationID = L.LocationID AND M.MemberID = ?\n"
                + "                         AND A.ArticleTypeID = 2 AND ArticleStatus = 1";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
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

    public List<ArticleDTO> getListArticleLostByMember(int id) throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID, A.ArticleStatus,\n"
                + "                                   A.MemberID, A.ArticleTypeID, A.ItemID, M.FullName, M.Email, M.Phone, M.Picture, ART.ArticleTypeName,\n"
                + "                                     I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L\n"
                + "                                                 WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND\n"
                + "                                      			A.LocationID = L.LocationID AND M.MemberID = ?\n"
                + "                                      AND A.ArticleTypeID = 1 AND ArticleStatus = 1";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
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

    public ArticleDTO getArticleDetail(int memberID, int articleID) throws SQLException {
        ArticleDTO article = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT A.ArticleID,  A.ArticleContent, A.ImgURL, A.PostTime, A.LocationID,\n"
                + "                       A.ArticleTypeID, A.ItemID, ART.ArticleTypeName,\n"
                + "                       I.ItemName, L.LocationName FROM Article A , Member M, ArticleType ART , ItemType I, Location L\n"
                + "                                    WHERE A.MemberID=M.MemberID AND A.ArticleTypeID = ART.ArticleTypeID AND A.ItemID = I.ItemID AND\n"
                + "                        			A.LocationID = L.LocationID AND A.MemberID = ? AND A.ArticleID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, memberID);
                ptm.setInt(2, articleID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String articleContent = rs.getString("ArticleContent");
                    String imgURL = rs.getString("ImgURL");
                    String postTime = rs.getString("PostTime");
                    int locationID = rs.getInt("LocationID");
                    int articleTypeID = rs.getInt("ArticleTypeID");
                    int itemID = rs.getInt("ItemID");
                    String articleTypeName = rs.getString("ArticleTypeName");
                    String itemName = rs.getString("ItemName");
                    String locationName = rs.getString("LocationName");
                    article = new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, null, null, 0, null, articleTypeName, itemName, locationName);
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
        return article;
    }

    public boolean getDeleteArticle(int memberID, int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "UPDATE [dbo].[Article]\n"
                + "   SET \n"
                + "      [ArticleStatus] = null\n"
                + " WHERE MemberID = ? AND ArticleID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, memberID);
                ptm.setInt(2, articleID);
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

    public boolean createArticle(ArticleDTO article) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ARTICLE);
                ptm.setString(1, article.getArticleContent());
                ptm.setString(2, article.getImgURL());
                ptm.setInt(3, article.getArticleTypeID());
                ptm.setInt(4, article.getItemID());
                ptm.setInt(5, article.getLocationID());
                ptm.setInt(6, article.getMemberID());
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

    public boolean updateArticleUser(ArticleDTO article, int memberID, int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Article\n"
                        + "SET ArticleContent = ?, LocationID = ?, ImgURL = ?\n"
                        + "WHERE MemberID = ? AND ArticleID = ?";
                ptm = conn.prepareStatement(sql);
                String articleContent = article.getArticleContent();
                int locationID = article.getLocationID();
                String imgURL = article.getImgURL();
                ptm.setString(1, articleContent);
                ptm.setInt(2, locationID);
                ptm.setString(3, imgURL);
                ptm.setInt(4, memberID);
                ptm.setInt(5, articleID);
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

    public List<ArticleDTO> getArticlebyArticleTypeLocationItems(int itemID, int locationID) throws SQLException {
        List<ArticleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ITEMS_LOCATION_ARTYPE_2);
            ptm.setInt(1, itemID);
            ptm.setInt(2, locationID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String email = rs.getString("Email");
                String fullName = rs.getString("FullName");
                int phone = rs.getInt("Phone");
                String picture = rs.getString("Picture");
                int memberID = rs.getInt("MemberID");
                int articleID = rs.getInt("ArticleID");
                String articleContent = rs.getString("ArticleContent");
                int locationID1 = rs.getInt("LocationID");
                int itemID1 = rs.getInt("ItemID");

                list.add(new ArticleDTO(articleID, articleContent, "", "", locationID1, memberID, 2, itemID1, fullName, email, phone, picture, "", "", "", 0));

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

        return list;
    }

    public boolean likeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE article "
                        + " SET totalLike = totalLike + 1"
                        + " WHERE articleID=?";
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

    public List<ArticleDTO> getArticlebyArticleTypeLocationItems2(int itemID, int locationID) throws SQLException {
        List<ArticleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_BY_ITEMS_LOCATION_ARTYPE_1);
            ptm.setInt(1, itemID);
            ptm.setInt(2, locationID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String email = rs.getString("Email");
                String fullName = rs.getString("FullName");
                int phone = rs.getInt("Phone");
                String picture = rs.getString("Picture");
                int memberID = rs.getInt("MemberID");
                int articleID = rs.getInt("ArticleID");
                String articleContent = rs.getString("ArticleContent");
                int locationID1 = rs.getInt("LocationID");
                int itemID1 = rs.getInt("ItemID");

                list.add(new ArticleDTO(articleID, articleContent, "", "", locationID1, memberID, 1, itemID1, fullName, email, phone, picture, "", "", "", 0));

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

        return list;
    }

    public boolean unlikeArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE article "
                        + " SET totalLike = totalLike - 1"
                        + " WHERE articleID=?";
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

    public boolean updateTotalReportArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_TOTAL_REPORT_ARTICLE);
                ptm.setInt(1, articleID);
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

    public boolean deleteTotalReportArticle(int articleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_TOTAL_REPORT_ARTICLE);
                ptm.setInt(1, articleID);
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

    public List<ArticleDTO> getListArticleBySuccess() throws SQLException {
        List<ArticleDTO> listArticle = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LIST_ARTICLE_SUCCESS);
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
                int totalReport = rs.getInt("TotalReport");
                listArticle.add(new ArticleDTO(articleID, articleContent, imgURL, postTime, locationID, memberID, articleTypeID, itemID, fullName, email, phone, picture, articleTypeName, itemName, locationName, totalReport));

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

}
