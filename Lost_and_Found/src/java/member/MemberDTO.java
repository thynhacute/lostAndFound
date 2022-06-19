/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

public class MemberDTO {

    private int id;
    private String email;
    private String fullName;
    private String picture;
    private int phone;
    private String profileInfo;
    private int roleID;

    public MemberDTO() {
    }

    public MemberDTO(int id, String email, String fullName, String picture, int phone, String profileInfo, int roleID) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.picture = picture;
        this.phone = phone;
        this.profileInfo = profileInfo;
        this.roleID = roleID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getProfileInfo() {
        return profileInfo;
    }

    public void setProfileInfo(String profileInfo) {
        this.profileInfo = profileInfo;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
