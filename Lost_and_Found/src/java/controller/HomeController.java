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
import location.LocationDAO;
import location.LocationDTO;

/**
 *
 * @author Owner
 */
public class HomeController extends HttpServlet {

    private static final String ERROR = "Home.jsp";
    private static final String SUCCESS = "Home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ArticleDAO articleDao = new ArticleDAO();
            String searchByLocation = request.getParameter("searchByLocation");
            List<ArticleDTO> listArticles = null;
            if (searchByLocation == null) {
                listArticles = new ArticleDAO().getAllArticle();
            } else {
                if (searchByLocation.equals("all")) {
                    listArticles = articleDao.getAllArticle();

                } else {
                    listArticles = articleDao.getListArticleByLocation(searchByLocation);

                }
            }

            request.setAttribute("LIST_ARTICLE", listArticles);
            LocationDAO locationDao = new LocationDAO();
            List<LocationDTO> listLocation = locationDao.getListLocation();
//            List<ArticleDTO> listArticleAuto = articleDao.getListArticle();
            HttpSession session = request.getSession();
            session.setAttribute("LIST_LOCATION", listLocation);
            url = SUCCESS;
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
