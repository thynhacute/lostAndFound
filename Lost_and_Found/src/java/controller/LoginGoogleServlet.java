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
    private static final String INDEX_PAGE = "index.jsp";
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
                if (email[1].equals("fpt.edu.vn")) {
                    boolean check = dao.checkDuplicate(member.getEmail());
                    if (check) {
                        member = dao.getMemberByEmail(member.getEmail());
                        member.setPicture(googlePojo.getPicture());
                        session.setAttribute("LOGIN_MEMBER", member);
                    } else {
                        dao.createMember(member);
                        session.setAttribute("LOGIN_MEMBER", member);
                    }
                } else {
                    url = LOGIN;
                    request.setAttribute("ERRORMESSAGE", "Please user mail had @fpt.edu.vn ");
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
