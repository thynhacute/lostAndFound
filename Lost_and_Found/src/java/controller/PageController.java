/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import article.ArticleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;
import notification.NotificationDAO;
import notification.NotificationDTO;

public class PageController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            MemberDTO memberLogin = (MemberDTO) session.getAttribute("LOGIN_MEMBER");
//            int memberID = memberLogin.getId();
//            MemberDAO memberDao = new MemberDAO();
            if (memberLogin != null) {
                List<NotificationDTO> listNotification = new NotificationDAO().getListNotification(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION", listNotification);
                List<NotificationDTO> listNotificationSeen = new NotificationDAO().getListSeenNoti(memberLogin.getId());
                session.setAttribute("LIST_NOTIFICATION_SEEN", listNotificationSeen);
            }
            List<ArticleDTO> listLostArticles = new ArticleDAO().getLostArticles();
            request.setAttribute("LIST_LOST_ARTICLE", listLostArticles);
            List<ArticleDTO> listPickedArticles = new ArticleDAO().getPickedArticles();
            request.setAttribute("LIST_PICKED_ARTICLE", listPickedArticles);
            List<ArticleDTO> listArticlesTopLikes = new ArticleDAO().getTopLikesArticle();
            request.setAttribute("LIST_TOP_LIKES_ARTICLE", listArticlesTopLikes);
//            List<NotificationDTO> listNotification = new NotificationDAO().getListNotification(memberLogin.getId());
//            session.setAttribute("LIST_NOTIFICATION", listNotification);
//            List<NotificationDTO> listNotificationSeen = new NotificationDAO().getListSeenNoti(memberLogin.getId());
//            session.setAttribute("LIST_NOTIFICATION_SEEN", listNotificationSeen);
//            
//            List<NotificationDTO> listNotificationArticleFind = new NotificationDAO().getListNotificationArticleFind(memberID);
//            session.setAttribute("LIST_NOTIFICATION_ARTICLE_FIND", listNotificationArticleFind);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at PageController" + e.toString());
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
