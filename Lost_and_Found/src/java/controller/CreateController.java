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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
import member.MemberDTO;
import notification.NotificationDAO;
import notification.NotificationDTO;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class CreateController extends HttpServlet {

    private static final String ERROR = "TypePostController";
    private static final String SUCCESS = "PageController";
    private final String UPLOAD_DIRECTORY = "file_upload";

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");  // fornt Tiếng việt
        response.setCharacterEncoding("UTF-8"); //
        String url = ERROR;
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("LOGIN_MEMBER");

        int memberID = member.getId();
        String aricleContent = request.getParameter("articleContent");
        int articleTypeID = Integer.parseInt(request.getParameter("articleTypeID"));
        int itemID = Integer.parseInt(request.getParameter("Items"));
        int locationID = Integer.parseInt(request.getParameter("Locations"));
        if (itemID == 0 || locationID == 0) {
            request.setAttribute("ERROR_MESSAGE", "");
            url = ERROR;
        }
        //xử lí upload
        PrintWriter out = response.getWriter();
        String applicationPath = request.getServletContext().getRealPath("").replace("build\\", ""); //set cái đường dẫn 
        String basePath = applicationPath + File.separator + UPLOAD_DIRECTORY + File.separator; // lấy đường dẫn folder để đưa cái thư mục zô
        File uploadDir = new File(basePath);
        InputStream inputStream = null;
        OutputStream outputStream = null;
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); //hàm tự tạo mới 
        }
        Part fileUpload = request.getPart("file"); //bắt param             
        String fileName = getFileName(fileUpload); //thực hiện ghi zô folder lưu zô db thì lưu cái fileName
        try {
            if (fileName.equals("")) {
                fileName = "no_image.jpg";
            } else {
                String save_path = basePath + fileName;
                if ((fileName.endsWith(".png") || fileName.endsWith(".jpg"))) {
                    File outputFilePath = new File(save_path);
                    inputStream = fileUpload.getInputStream();
                    outputStream = new FileOutputStream(outputFilePath);
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = inputStream.read(bytes)) != -1) {
                        outputStream.write(bytes, 0, read);
                    }
                } else {
                    url = ERROR;
                    request.setAttribute("ERROR_UPLOAD", "please upload file had '.png' or '.jgp'");
                }
            }
            ArticleDAO dao = new ArticleDAO();
            ArticleDTO article = new ArticleDTO(0, aricleContent, fileName, "", locationID, memberID, articleTypeID, itemID, "", "", 0, "", "", "", "",0);
            boolean checkCreate = dao.createArticle(article);
            if (checkCreate) {
                request.setAttribute("SUCCESS_CREATE_MESSAGE", article);
                url = SUCCESS;
            }
            if (articleTypeID == 1) {
                List<ArticleDTO> listNotiArticlefind = new ArticleDAO().getArticlebyArticleTypeLocationItems(itemID, locationID);
                for (ArticleDTO listArticle : listNotiArticlefind) {
                    String fullName = listArticle.getFullName();
                    int articleID = listArticle.getArticleID();
                    int sensorID = listArticle.getMemberID();
                    String picture = listArticle.getPicture();
                    NotificationDAO notiDAO = new NotificationDAO();
                    //sensor thằng có items mình cần
                    // memberID là mình login zô
                    if (sensorID != memberID) {
                        NotificationDTO noti = new NotificationDTO(0, "might be holding an item you just lost", memberID, sensorID, articleID, fullName, picture);
                        boolean checkCreateNoti = notiDAO.NotificationArticle(noti);
                        NotificationDTO noti2 = new NotificationDTO(0, "can may be found the item that you are picked", sensorID, memberID, articleID, fullName, picture);
                        boolean checkCreateNoti2 = notiDAO.NotificationArticle(noti2);
                            url = SUCCESS;
                    }
                }
            } else {
                List<ArticleDTO> listNotiArticleLost = new ArticleDAO().getArticlebyArticleTypeLocationItems2(itemID, locationID);
                for (ArticleDTO listArticle : listNotiArticleLost) {
                    String fullName = listArticle.getFullName();
                    int articleID = listArticle.getArticleID();
                    int sensorID = listArticle.getMemberID();
                    String picture = listArticle.getPicture();
                    NotificationDAO notiDAO = new NotificationDAO();
                    if (sensorID != memberID) {
                        NotificationDTO noti = new NotificationDTO(0, "can may be found the item that you are picked", memberID, sensorID, articleID, fullName, picture);
                        boolean checkCreateNoti = notiDAO.NotificationArticle(noti);
                        NotificationDTO noti2 = new NotificationDTO(0, "might be holding an item you just lost", sensorID, memberID, articleID, fullName, picture);
                        boolean checkCreateNoti2 = notiDAO.NotificationArticle(noti2);
                            url = SUCCESS;
                    }
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
