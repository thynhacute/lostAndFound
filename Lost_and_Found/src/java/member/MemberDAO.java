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

/**
 *
 * @author Owner
 */
public class MemberDAO {

    private static final String CHECK_DUPLICATE = "SELECT  M.FullName FROM Member M\n"
            + "WHERE M.Email = ?";
    private static final String GET_MEMBER_BY_EMAIL = "SELECT  M.FullName, M.Email, M.Picture, M.Phone, M.ProfileInfo FROM Member M\n"
            + "WHERE M.Email =?";

    private static final String CREATE_MEMBER = "INSERT INTO [dbo].[Member]\n"
            + "           ([FullName]\n"
            + "           ,[Email]\n"
            + "           ,[Picture]\n"
            + "           ,[RoleID]\n"
            + "           ,[MemberStatus])\n"
            + "     VALUES\n"
            + "           (?,?,?,2,1)";

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
                String fullName = rs.getString("FullName");
                String email2 = rs.getString("Email");
                String picture = rs.getString("Picture");
                int phone = rs.getInt("Phone");
                String profileInfo = rs.getString("ProfileInfo");

                MemberDTO member = new MemberDTO(0, email2, fullName, picture, phone, profileInfo, 2);

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

}
