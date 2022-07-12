/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import like.LikeDAO;
import member.MemberDTO;
import notification.NotificationDAO;
import notification.NotificationDTO;

/**
 *
 * @author LEGION'
 */
@WebServlet(name = "LikeArticleController", urlPatterns = {"/LikeArticleController"})
public class LikeArticleController extends HttpServlet {

    private static final String ERROR = "DetailArticleController";
    private static final String SUCCESS = "DetailArticleController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        boolean liked = false;
        boolean checkLiked = false;
        boolean checkTotalLiked = false;
        try {
            MemberDTO member = (MemberDTO) session.getAttribute("LOGIN_MEMBER");
            int articleID = Integer.parseInt(request.getParameter("articleID"));
            int memberID = Integer.parseInt(request.getParameter("memberID"));
            String fullName = member.getFullName();
            int sensorID = member.getId();
            ArticleDAO dao = new ArticleDAO();
            LikeDAO dao1 = new LikeDAO();
            liked = dao1.getStatusLikeArticle(articleID, member.getId());
            if (liked) {
                //Unlike if liked
                checkTotalLiked = dao.unlikeArticle(articleID);
                checkLiked = dao1.setStatusUnlikeArticle(articleID, member.getId());
            } else {
                NotificationDAO notiDao = new NotificationDAO();
                int count = notiDao.checkCount(sensorID, articleID);
                if (sensorID != memberID && count == 0) {
                    NotificationDTO noti = new NotificationDTO(0, "liked your post", memberID, sensorID, articleID, fullName, member.getPicture());
                    boolean checkNotiComments = notiDao.NotificationComments(noti);
                }
                //else Like article
                checkTotalLiked = dao.likeArticle(articleID);
                checkLiked = dao1.setStatusLikeArticle(articleID, member.getId());

            }
            if (checkLiked && checkTotalLiked) {
                if (checkLiked) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at home" + e.toString());
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
