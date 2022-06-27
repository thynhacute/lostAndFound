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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import location.LocationDAO;
import location.LocationDTO;
import member.MemberDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateFoundController", urlPatterns = {"/UpdateFoundController"})
public class UpdateFoundController extends HttpServlet {

    private static final String DETAIL_PAGE = "detailArticleFoundUser.jsp";
    private static final String ERROR = "error.jsp";
    private static final String LIST_ALL_FOUND = "UserFoundController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("LOGIN_MEMBER");
        String url = ERROR;
        try {
            LocationDAO locationDao = new LocationDAO();
            List<LocationDTO> listLocation = locationDao.getListLocation();
            session.setAttribute("LIST_LOCATION", listLocation);
            ArticleDAO articleDao = new ArticleDAO();
            String articleContent = request.getParameter("articleContent");
            String imgURL = request.getParameter("imgURL");
            if (request.getParameter("render") != null) {
                int articleID = Integer.parseInt(request.getParameter("id"));
                ArticleDTO article = articleDao.getArticleDetail(member.getId(), articleID);
                if (article != null) {
                    request.setAttribute("DETAIL_ARTICLE_FOUND", article);
                    url = DETAIL_PAGE;
                }
            }
            if (request.getParameter("delete") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean check = articleDao.getDeleteArticle(member.getId(), id);
                if (check) {
                    url = LIST_ALL_FOUND;
                }
            }
            if (request.getParameter("Update") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                int locationID = Integer.parseInt(request.getParameter("locationID"));
                ArticleDTO articleDTO = new ArticleDTO(id, articleContent, locationID);
                boolean check = articleDao.updateArticleUser(articleDTO, member.getId(), id);
                url = LIST_ALL_FOUND;
            }
        } catch (Exception e) {
            log("Error at UpdateLostUserController: " + e.toString());
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
