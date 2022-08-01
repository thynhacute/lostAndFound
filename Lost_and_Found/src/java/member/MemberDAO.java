/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

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
public class MemberDAO {

    private static final String CHECK_DUPLICATE = "SELECT  M.FullName FROM Member M \n"
            + "WHERE M.Email = ?";
    private static final String GET_MEMBER_BY_EMAIL = "SELECT M.MemberID, M.FullName, M.Email, M.Picture, M.Phone, M.ProfileInfo, M.RoleID FROM Member M , Role R\n"
            + "WHERE M.Email = ? AND R.RoleID=M.RoleID AND M.MemberStatus=1";
    private static final String CREATE_MEMBER = "INSERT INTO [dbo].[Member]\n"
            + "           ([FullName]\n"
            + "           ,[Email]\n"
            + "           ,[Picture]\n"
            + "           ,[RoleID]\n"
            + "           ,[MemberStatus])\n"
            + "     VALUES\n"
            + "           (?,?,?,2,1)";
    private static final String GET_LIST_MEMBER_BY_ADMIN = "Select MemberID, FullName, Email, Picture, Phone, ProfileInfo, RoleID, MemberStatus, TotalReport"
            + " from Member where MemberStatus = 1 AND RoleID = 2";
    private static final String GET_LIST_BAND_MEMBER_BY_ADMIN = "Select MemberID, FullName, Email, Picture, Phone, ProfileInfo, RoleID, MemberStatus"
            + " from Member where MemberStatus = 0 ";
    private static final String DELETE_MEMBER = "UPDATE Member SET MemberStatus = 0 WHERE MemberID = ?";
    private static final String ACTIVE_MEMBER = "UPDATE Member SET MemberStatus = 1 WHERE MemberID = ?";
    private static final String GET_LIST_REPORT_MEMBER = "SELECT M.MemberID, A.ArticleContent, R.ReportContent, N.FullName, M.Email, M.Picture, M.Phone, M.ProfileInfo, M.RoleID, M.TotalReport \n"
            + "FROM Member M, Member N, Report R, Article A WHERE R.ArticleID = A.ArticleID AND A.MemberID = M.MemberID AND R.MemberID = N.MemberID AND R.ReportStatus = 1";

    private static final String UPDATE_TOTAL_REPORT_MEMBER = "UPDATE Member SET TotalReport = TotalReport +1 WHERE MemberID = ?";

    private static final String UPDATE_DELETE_TOTAL_REPORT_MEMBER = "UPDATE Member SET TotalReport = TotalReport -1 WHERE MemberID = ?";

    private static final String GET_TOTAL_REPORT = "select TotalReport from Member Where MemberID = ?";
    public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public MemberDTO getMemberByEmail(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_MEMBER_BY_EMAIL);
            ptm.setString(1, email);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int memberID = rs.getInt("MemberID");
                String fullName = rs.getString("FullName");
                String email2 = rs.getString("Email");
                String picture = rs.getString("Picture");
                int phone = rs.getInt("Phone");
                String profileInfo = rs.getString("ProfileInfo");
                int roleID = rs.getInt("RoleID");

                MemberDTO member = new MemberDTO(memberID, email2, fullName, picture, phone, profileInfo, roleID);
                return member;
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
        return null;
    }

    public boolean createMember(MemberDTO member) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_MEMBER);
                ptm.setString(1, member.getFullName());
                ptm.setString(2, member.getEmail());
                ptm.setString(3, member.getPicture());
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

    public List<MemberDTO> getListAllMemberByAdmin() throws SQLException {
        List<MemberDTO> listMember = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_MEMBER_BY_ADMIN);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("MemberID");
                    String email = rs.getString("Email");
                    String fullName = rs.getString("FullName");
                    String picture = rs.getString("Picture");
                    int phone = rs.getInt("Phone");
                    String profileInfo = rs.getString("ProfileInfo");
                    int roleID = rs.getInt("RoleID");
                    int totalReport = rs.getInt("TotalReport");
                    listMember.add(new MemberDTO(id, email, fullName, picture, phone, profileInfo, roleID, totalReport));
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
        return listMember;
    }

    public List<MemberDTO> getListBandMemberByAdmin() throws SQLException {
        List<MemberDTO> listMember = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_BAND_MEMBER_BY_ADMIN);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("MemberID");
                    String email = rs.getString("Email");
                    String fullName = rs.getString("FullName");
                    String picture = rs.getString("Picture");
                    int phone = rs.getInt("Phone");
                    String profileInfo = rs.getString("ProfileInfo");
                    int roleID = rs.getInt("RoleID");
                    listMember.add(new MemberDTO(id, email, fullName, picture, phone, profileInfo, roleID));
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
        return listMember;
    }


    public boolean deleteMember(int memberID) throws SQLException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_MEMBER);
                ptm.setInt(1, memberID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean activeMember(int memberID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ACTIVE_MEMBER);
                ptm.setInt(1, memberID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<MemberDTO> getListReportMemberByAdmin() throws SQLException {
        List<MemberDTO> listMember = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_REPORT_MEMBER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("MemberID");
                    String email = rs.getString("Email");
                    String fullName = rs.getString("FullName");
                    String picture = rs.getString("Picture");
                    int phone = rs.getInt("Phone");
                    String profileInfo = rs.getString("ProfileInfo");
                    int roleID = rs.getInt("RoleID");
                    int totalReport = rs.getInt("TotalReport");
                    String articleContent = rs.getString("ArticleContent");
                    String reportContent = rs.getString("ReportContent");
                    listMember.add(new MemberDTO(id, email, fullName, picture, phone, profileInfo, roleID, totalReport, articleContent, reportContent));
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
        return listMember;
    }

    public boolean updateProfileUser(MemberDTO member) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE member "
                        + " SET fullName=?, picture=?, phone=?, profileInfo=? "
                        + " WHERE memberID=? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, member.getFullName());
                ptm.setString(2, member.getPicture());
                ptm.setInt(3, member.getPhone());
                ptm.setString(4, member.getProfileInfo());
                ptm.setInt(5, member.getId());
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


    public boolean updateTotalReportMember(int memberID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_TOTAL_REPORT_MEMBER);
                ptm.setInt(1, memberID);
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

    public boolean updateDeleteTotalReportMember(int memberIDArticle) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_DELETE_TOTAL_REPORT_MEMBER);
                ptm.setInt(1, memberIDArticle);
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

    public int getCountReport(int memberID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int count = 0;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
            ptm = conn.prepareStatement(GET_TOTAL_REPORT);
            ptm.setInt(1, memberID);
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

}
