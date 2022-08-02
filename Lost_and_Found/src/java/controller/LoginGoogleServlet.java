package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import loggingGoogle.GooglePojo;
import loggingGoogle.GoogleUtils;
import member.MemberDAO;
import member.MemberDTO;

public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String INDEX_PAGE = "PageController";
    private static final String ADMIN_PAGE = "SearchAdminController";
    private static final String LOGIN = "login.jsp";

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = INDEX_PAGE;
        try {
            HttpSession session = request.getSession();
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                url = LOGIN;
                request.setAttribute("ERRORMESSAGE", "Please login!");
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                System.out.println(googlePojo);
                MemberDTO member = new MemberDTO(0, googlePojo.getEmail(), googlePojo.getName(), googlePojo.getPicture(), 0, "", 2);
                MemberDAO dao = new MemberDAO();
                String[] email = member.getEmail().split("@");
                if ((email[1].equals("fpt.edu.vn")) || (email[1].equals("fe.edu.vn"))) {
                    boolean check = dao.checkDuplicate(member.getEmail());
                    if (check) {
                        member = dao.getMemberByEmail(member.getEmail());
                        if (member == null) {
                            url = LOGIN;
                            request.setAttribute("ERROR_MESSAGE_ACC_BAN", "Your account is temporarily locked, please wait for our response!");
                        } else {
                            int roleID = member.getRoleID();
                            member.setPicture(googlePojo.getPicture());
                            if (roleID == 1) {
                                session.setAttribute("LOGIN_MEMBER", member);
                                url = ADMIN_PAGE;
                            } else {
                                session.setAttribute("LOGIN_MEMBER", member);
                                request.setAttribute("SUCCESS_MESSAGE", member);
                                url = INDEX_PAGE;
                            }
                        }

                    } else {
                        dao.createMember(member);
                        session.setAttribute("LOGIN_MEMBER", member);
                    }
                } else {
                    url = LOGIN;
                    request.setAttribute("ERROR_LOGGIN_MESSAGE", "");
                }
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
