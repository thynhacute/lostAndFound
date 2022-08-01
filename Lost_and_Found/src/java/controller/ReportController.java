/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import article.ArticleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javatutorials.javamail.JavaMailUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;
import report.ReportDAO;
import report.ReportDTO;

/**
 *
 * @author Owner
 */
public class ReportController extends HttpServlet {

    private static final String ERROR = "PageController";
    private static final String SUCCESS = "DetailArticleController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");  // fornt Tiếng việt
        response.setCharacterEncoding("UTF-8"); //

        String url = ERROR;
        int articleID = Integer.parseInt(request.getParameter("articleID"));
        int memberID = Integer.parseInt(request.getParameter("memberID"));
        int articleMemberID = Integer.parseInt(request.getParameter("articleMemberID"));
        String reportContent = request.getParameter("reportContent");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String articleContent = request.getParameter("articleContent");

        ArticleDAO daoa = new ArticleDAO();
        MemberDAO daom = new MemberDAO();
        try {
            if (memberID != articleMemberID) {
                ReportDAO dao = new ReportDAO();
                ReportDTO report = new ReportDTO(0, articleID, memberID, reportContent, "");
                boolean checkCreate = dao.createReport(report);
                if (checkCreate) {
                    request.setAttribute("SUCCESS_MESSAGE_REPORT", dao);
                    JavaMailUtil.sendMail(email, reportContent, fullName, articleContent);
                    boolean checkUpdateTotalArticleReport = daoa.updateTotalReportArticle(articleID);
                    boolean checkUpdateTotalMemberReport = daom.updateTotalReportMember(articleMemberID);
//                    khi ma report thi tao dao dem thg user no co may report  
                    int countReport = daoa.getCountReport(articleID);
                    int countReportMember = daom.getCountReport(articleMemberID);
                    if (countReportMember >= 10) {
                        daom.deleteMember(articleMemberID);
                        JavaMailUtil.sendMailBanMember(email, fullName);
//                        url = SUCCESS;
                    }
                    if (countReport >= 5) {
                        daoa.deleteArticle(articleID);
                        url = ERROR;
//                        JavaMailUtil.sendMail(email, reportContent, fullName, articleContent);
                    } else {
                        url = SUCCESS;
                    }

//                    if (checkCreate && checkUpdateTotalArticleReport && checkUpdateTotalMemberReport) {
//                        url = SUCCESS;
//                        request.setAttribute("SUCCESS_MESSAGE_REPORT", dao);
//                    }
                } else {
                    url = ERROR;
                    request.setAttribute("ERORR_MESSAGE_REPORT", "");
                }

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
