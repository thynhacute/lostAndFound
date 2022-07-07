/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import article.ArticleDTO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import location.LocationDAO;
import location.LocationDTO;
import member.MemberDTO;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet(name = "UpdateFoundController", urlPatterns = {"/UpdateFoundController"})
public class UpdateFoundController extends HttpServlet {

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private static final String DETAIL_PAGE = "detailArticleFoundUser.jsp";
    private static final String ERROR = "error.jsp";
    private static final String LIST_ALL_FOUND = "UserFoundController";
    private final String UPLOAD_DIRECTORY = "file_upload";

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
                imgURL = request.getParameter("imgURL");
                Part file = request.getPart("file");
                String newImgURL = getFileName(file);
                if (file != null) {
                    String applicationPath = request.getServletContext().getRealPath("").replace("build\\", ""); //set cái đường dẫn 
                    String basePath = applicationPath + File.separator + UPLOAD_DIRECTORY + File.separator;
                    File uploadDir = new File(basePath);
                    InputStream inputStream = null;
                    OutputStream outputStream = null;
                    String save_path = basePath + newImgURL;
                    if ((newImgURL.endsWith(".png") || newImgURL.endsWith(".jpg"))) {
                        File outputFilePath = new File(save_path);
                        inputStream = file.getInputStream();
                        outputStream = new FileOutputStream(outputFilePath);
                        int read = 0;
                        final byte[] bytes = new byte[1024];
                        while ((read = inputStream.read(bytes)) != -1) {
                            outputStream.write(bytes, 0, read);
                        }
                    }
                }
                if (newImgURL.isEmpty()) {
                    newImgURL = imgURL;
                }
                ArticleDTO articleDTO = new ArticleDTO(id, articleContent, locationID, newImgURL);
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
