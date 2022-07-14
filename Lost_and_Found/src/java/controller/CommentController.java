package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import article.ArticleDTO;
import comment.CommentDAO;
import comment.CommentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;
import notification.NotificationDAO;
import notification.NotificationDTO;

/**
 *
 * @author Owner
 */
public class CommentController extends HttpServlet {

    private static final String ERROR = "Artical-detail.jsp";
    private static final String SUCCESS = "DetailArticleController";
    private static final String NOTICOMMENTS = "PageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");  // fornt Tiếng việt
        response.setCharacterEncoding("UTF-8"); //
        String url = ERROR;

        try {
            HttpSession session = request.getSession();
            MemberDTO memberLogin = (MemberDTO) session.getAttribute("LOGIN_MEMBER");
            int articleID = Integer.parseInt(request.getParameter("articleID"));
            int memberID = Integer.parseInt(request.getParameter("memberID"));
            String commentContent = request.getParameter("commentContent");
            String fullName = memberLogin.getFullName();
            int sensorID = memberLogin.getId();
            CommentDAO dao = new CommentDAO();
            CommentDTO comment = new CommentDTO(0, articleID, sensorID, commentContent, "", "", "");
            NotificationDAO notiDao = new NotificationDAO();
            boolean checkCreate = dao.createComment(comment);
            if (sensorID != memberID) {
                NotificationDTO noti = new NotificationDTO(0, "commented on your post", memberID, sensorID, articleID, fullName, memberLogin.getPicture());
                boolean checkNotiComments = notiDao.NotificationComments(noti);
                if (checkNotiComments) {
                    url = NOTICOMMENTS;
                    request.setAttribute("NOTI_COMMENT", noti);
                }
            }
            if (checkCreate) {
                url = SUCCESS;
                request.setAttribute("SUCCESS_MESSAGE", "");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
