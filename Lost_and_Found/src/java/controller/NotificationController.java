/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import article.ArticleDTO;
import comment.CommentDAO;
import comment.CommentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * @author Admin
 */
@WebServlet(name = "NotificationController", urlPatterns = {"/NotificationController"})
public class NotificationController extends HttpServlet {

    private static final String ERROR = "Artical-detail.jsp";
    private static final String SUCCESS = "Artical-detail.jsp";
    private static final String PAGE = "PageController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String articleID1 = request.getParameter("articleID");
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            MemberDTO memberLogin = (MemberDTO) session.getAttribute("LOGIN_MEMBER");
            int memberID = memberLogin.getId();
            MemberDAO memberDao = new MemberDAO();
            ArticleDAO dao = new ArticleDAO();
            ArticleDTO articleDetail = dao.getArticleByID(articleID1);
            request.setAttribute("ARTICLE_DETAIL", articleDetail);
            CommentDAO comment = new CommentDAO();
            List<CommentDTO> listComments = comment.getListCommentsByArticleID(articleID1);
            request.setAttribute("LIST_COMMENTS", listComments);
            NotificationDAO notiDao = new NotificationDAO();
            boolean check = notiDao.getSeenNoti(articleID1);
            if (check) {
                List<NotificationDTO> listNotification = new NotificationDAO().getListNotification(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION", listNotification);
                List<NotificationDTO> listNotificationSeen = new NotificationDAO().getListSeenNoti(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION_SEEN", listNotificationSeen);
                url = SUCCESS;
            }
            url = SUCCESS;
            if (action.equals("NotificationSeenAll")) {
                notiDao.getSeenNotiAll(memberID);
                List<NotificationDTO> listNotification = new NotificationDAO().getListNotification(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION", listNotification);
                List<NotificationDTO> listNotificationSeen = new NotificationDAO().getListSeenNoti(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION_SEEN", listNotificationSeen);
                url = PAGE;
            }
        } catch (Exception e) {
            log("Error at DetailArticleController" + e.toString());
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
