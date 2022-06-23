/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import ArticleType.ArticleTypeDAO;
import ArticleType.ArticleTypeDTO;
import article.ArticleDAO;
import article.ArticleDTO;
import item.ItemDAO;
import item.ItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import location.LocationDAO;
import location.LocationDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResetController", urlPatterns = {"/ResetController"})
public class ResetController extends HttpServlet {

    private static final String ERROR = "Home.jsp";
    private static final String SUCCESS = "Home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ArticleDAO articleDao = new ArticleDAO();
            List<ArticleDTO> listArticles = articleDao.getAllArticle();
            String action = request.getParameter("action");
            if("Reset".equals(action)){
                listArticles = articleDao.getAllArticle();
                request.setAttribute("LIST_ARTICLE", listArticles);
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at ResetController" + e.toString());
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
