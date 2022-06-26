/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import article.ArticleDTO;
import item.ItemDAO;
import item.ItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import location.LocationDAO;
import location.LocationDTO;

/**
 *
 * @author Owner
 */
public class TypePostController extends HttpServlet {

    private static final String ERROR = "post-finditem.jsp";
    private static final String SUCCESS = "post-pickitem.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        String articleType = request.getParameter("articleTypeID");
        try {
            ItemDAO itemDao = new ItemDAO();
            List<ItemDTO> listItem = itemDao.getListItem();
            request.setAttribute("LIST_ITEM", listItem);

            LocationDAO locationDao = new LocationDAO();
            List<LocationDTO> listLocation = locationDao.getListLocation();
            request.setAttribute("LIST_LOCATION", listLocation);
                  
            if (articleType.equals("1")) {
                url = ERROR;
            } else {
                url = SUCCESS;}
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
