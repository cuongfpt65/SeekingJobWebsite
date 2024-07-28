/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ApplyDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import Model.Company;
import Model.Employee;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Van Chien Ce170237s
 */
@MultipartConfig

public class PostController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            String action = request.getParameter("action");
            String postID = request.getParameter("postId");
            String companyID = request.getParameter("companyId");
            String txtSearchEmail = request.getParameter("se");

            switch (action) {
                case "listPost":
                    //  getCompany(request, response, companyID);
                    break;
                case "ListDraft":
                    listDraftOfCompany(request, response, postID);
                    break;
                case "details":
                    getPostByIDD(request, response, postID);
                    break;
                case "detailDraftPC":
                    getDetailDraftPostCompany(request, response, postID);
                    break;
                case "deletePost":
                    deletePost(request, response, postID);
                    break;
                case "deleteDraft":
                    deleteDraftPost(request, response, postID);
                    break;
                case "loadCreatePost":
                    response.sendRedirect("AddPost1.jsp");
                    break;
                case "loadupdate":
                    LoadUpdate(request, response, postID);
                    break;
                case "loadupdatePostDraft":
                    LoadUpdatePostDraft(request, response, postID);
                    break;

                case "Post":
                    handleTransferRequest(request, response, postID);
                    break;
                case "cancelDraft":
                    request.getRequestDispatcher("DrafrPost.jsp").forward(request, response);
                    break;

                case "loadEmployee":
                    listEmloyee(request, response);
                    break;
                case "search":
                    request.getRequestDispatcher("searchEmail.jsp").forward(request, response);
                    break;
                case "detailsEmloyee":
                    detailsEmloyee(request, response, postID);
                    break;
                default:

                    listPosts(request, response);

            }
        } catch (Exception ex) {
            System.out.println(ex);
        }

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

        String action = request.getParameter("action");

        if (null != action) {
            switch (action) {
                case "addPost":
                    addPost(request, response);
                    break;
                case "addDraft":
                    addDraft(request, response);
                    break;
                case "update":
                    updatePost(request, response);
                    break;
                case "updatePostDraft":
                    updatePostDraft(request, response);
                    break;
                default:
                    break;
            }
        }
    }

    private void listPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = dao.getTotalPostOfCompanyNoDraft(Idcompany);
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }

        List<Post> list = dao.getAllPostByIdCompany(Idcompany, index);
        request.setAttribute("listqq", list);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        response.sendRedirect("Home");
    }

    private void listDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        List<Post> list = dao.getAllDraftPost();
        request.setAttribute("listDraft", list);
        request.getRequestDispatcher("DrafrPost.jsp").
                forward(request, response);
    }

    private void listPostOfCompany(HttpServletRequest request, HttpServletResponse response, String IdCompany) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        String Idcompany = null;
        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }
        List<Post> list = dao.getAllPostByIdCompany(Idcompany);
        request.setAttribute("listqq", list);
        request.getRequestDispatcher("DrafrPost.jsp").
                forward(request, response);
    }

    private void listDraftOfCompany(HttpServletRequest request, HttpServletResponse response, String IdCompany) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        String Idcompany = null;
        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }
        List<Post> list = dao.getAllDraftPostByIdCompany(Idcompany);
        request.setAttribute("listDraft", list);
        request.getRequestDispatcher("DrafrPost.jsp").
                forward(request, response);
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response, String postID) throws IOException, ServletException {
        PostDAO dao = new PostDAO();

        dao.deletePost(postID);
        String Idcompany = null;
        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }
        List<Post> list = dao.getAllPostByIdCompany(Idcompany);
        request.setAttribute("listqq", list);
        response.sendRedirect("Home");

    }

    private void deleteDraftPost(HttpServletRequest request, HttpServletResponse response, String postID) throws IOException, ServletException {
        PostDAO dao = new PostDAO();
        dao.deleteDraftPost(postID);
        listDraftOfCompany(request, response, postID);
    }

    private void getPostByIDD(HttpServletRequest request, HttpServletResponse response, String id)
            throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        Post p = dao.getPostByID(id);
        String idAccount = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                idAccount = cookie.getValue();
            }
        }
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = dao.getTotalPostNoDraft();
        int endPage = count / 5;
        if (count % 10 != 0) {
            endPage++;
        }

        List<Post> list = dao.pagingPostNoDraftMini(index, id);
        request.setAttribute("listqq", list);
        request.setAttribute("endP", 1);
        request.setAttribute("tag", 1);

        String firstChar = null;
        if (idAccount == null) {
            request.setAttribute("postD", p);
            request.getRequestDispatcher("DetailPostGuest.jsp").forward(request, response);
        } else {
            firstChar = idAccount.substring(0, 1);
        }
        if (firstChar.contains("A")) {
            request.setAttribute("postD", p);
            request.getRequestDispatcher("DetailPostCompany.jsp").
                    forward(request, response);

        } else if (firstChar.contains("C")) {
            request.setAttribute("postD", p);
            request.getRequestDispatcher("DetailPostCompany.jsp").
                    forward(request, response);

        } else if (firstChar.contains("E")) {

            request.setAttribute("postD", p);
            ApplyDAO ad = new ApplyDAO();
            boolean check = ad.check(idAccount, p.getId());
            request.setAttribute("check", check);
            request.getRequestDispatcher("DetailPostEmployee.jsp").
                    forward(request, response);
        }
    }

    private void addPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PostDAO dao = new PostDAO();
        //-------------------
        String file = request.getSession().getServletContext().getRealPath("/imgs/room");
        String[] s = file.split("\\\\");
        String fileImg = "";
        for (int i = 0; i < s.length; i++) {
            if (!s[i].equals("build")) {
                fileImg += s[i];
                if (i < s.length - 1) {
                    fileImg += "\\";
                }
            }
        }
        fileImg.substring(0, fileImg.length() - 1);

        Part part = request.getPart("image");
        Path fileName = Paths.get(part.getSubmittedFileName());
        if (!Files.exists(Paths.get(fileImg))) {
            Files.createDirectories(Paths.get(fileImg));
        }
        String picture = fileName.getFileName().toString();
        part.write(fileImg + "/" + fileName);
        //------------------------------------------------------------
        String id = request.getParameter("id");

        Post post = dao.AutoID(id);

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }

        String salary = request.getParameter("salary");
        String timePosted = request.getParameter("timePosted");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String major = request.getParameter("major");
        String jojTypes = request.getParameter("jobTypes");
        String location = request.getParameter("location");
        String image = request.getParameter("image");

        dao.inserPost(post.getId(), title, description, Idcompany, salary, timePosted, start, end, major, jojTypes, location, picture);
        listPosts(request, response);
    }

    private void addDraft(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PostDAO dao = new PostDAO();
        String imageFileName = saveImage(request);
        String id = request.getParameter("id");
        Post post = dao.AutoID(id);

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }

        String salary = request.getParameter("salary");
        String timePosted = request.getParameter("timePosted");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String major = request.getParameter("major");
        String jojTypes = request.getParameter("jobTypes");
        String location = request.getParameter("location");
        String image = request.getParameter("image");

        dao.inserDraftPost(post.getId(), title, description, Idcompany, salary, timePosted, start, end, major, jojTypes, location, imageFileName);
        listDraftOfCompany(request, response, id);
    }

    private void LoadUpdate(HttpServletRequest request, HttpServletResponse response, String postID) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        Post p = dao.getPostByID(postID);
        request.setAttribute("up", p);
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("id");
        String ptitle = request.getParameter("title");
        String pdescription = request.getParameter("description");

        String psalary = request.getParameter("salary");

        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }

        String ptimePosted = request.getParameter("timePosted");
        String pstart = request.getParameter("start");
        String pend = request.getParameter("end");
        String pmajor = request.getParameter("major");
        String pjojTypes = request.getParameter("jobTypes");
        String plocation = request.getParameter("location");

        String file = request.getSession().getServletContext().getRealPath("/imgs/room");
        String[] s = file.split("\\\\");
        String fileImg = "";
        for (int i = 0; i < s.length; i++) {
            if (!s[i].equals("build")) {
                fileImg += s[i];
                if (i < s.length - 1) {
                    fileImg += "\\";
                }
            }
        }
        fileImg.substring(0, fileImg.length() - 1);

        Part part = request.getPart("image");
        Path fileName = Paths.get(part.getSubmittedFileName());
        if (!Files.exists(Paths.get(fileImg))) {
            Files.createDirectories(Paths.get(fileImg));
        }
        String picture = fileName.getFileName().toString();
        part.write(fileImg + "/" + fileName);

        PostDAO dao = new PostDAO();
        dao.updatePost(picture, pid, ptitle, pdescription, Idcompany, psalary, ptimePosted, pstart, pend, pmajor, pjojTypes, plocation);
        getPostByIDD(request, response, pid);

    }

    private void handleTransferRequest(HttpServletRequest request, HttpServletResponse response, String postID) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        dao.transferDraftToPost(postID);

        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }
        List<Post> list = dao.getAllPostByIdCompany(Idcompany);
        request.setAttribute("listqq", list);

        request.getRequestDispatcher("HomeCompany.jsp").forward(request, response);
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

    private void detailsEmloyee(HttpServletRequest request, HttpServletResponse response, String postID) {

    }

    private void listEmloyee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeDAO Edao = new EmployeeDAO();
        List<Employee> liste = Edao.getAllEmployee();
        request.setAttribute("listed", liste);
        request.getRequestDispatcher("listEmloyee.jsp").
                forward(request, response);
    }

    private String saveImage(HttpServletRequest request) throws IOException, ServletException {
        Part imagePart = request.getPart("image");
        String contextPath = request.getServletContext().getRealPath("/");
        String imagesDirPath = contextPath + "image" + File.separator;

        File imagesDir = new File(imagesDirPath);
        if (!imagesDir.exists()) {
            imagesDir.mkdirs();
        }

        String imageName = "image_" + System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
        String imagePath = imagesDirPath + imageName;

        try ( InputStream inputStream = imagePart.getInputStream();  OutputStream outputStream = new FileOutputStream(imagePath)) {
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        return request.getContextPath() + "/image/" + imageName;
    }

    private void updatePostDraft(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("id");
        String ptitle = request.getParameter("title");
        String pdescription = request.getParameter("description");

        String psalary = request.getParameter("salary");

        String Idcompany = null;

        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idcompany = cookie.getValue();
            }
        }

        String ptimePosted = request.getParameter("timePosted");
        String pstart = request.getParameter("start");
        String pend = request.getParameter("end");
        String pmajor = request.getParameter("major");
        String pjojTypes = request.getParameter("jobTypes");
        String plocation = request.getParameter("location");

        String imageFileName = saveImage(request);

        PostDAO dao = new PostDAO();
        dao.updatePost(imageFileName, pid, ptitle, pdescription, Idcompany, psalary, ptimePosted, pstart, pend, pmajor, pjojTypes, plocation);
        getDetailDraftPostCompany(request, response, pid);

    }

    private void getDetailDraftPostCompany(HttpServletRequest request, HttpServletResponse response, String id)
            throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        Post p = dao.getPostByID(id);

        request.setAttribute("postD", p);
        request.getRequestDispatcher("DetailDraftPostCompany.jsp").
                forward(request, response);
    }

    private void LoadUpdatePostDraft(HttpServletRequest request, HttpServletResponse response, String postID) throws ServletException, IOException {
        PostDAO dao = new PostDAO();
        Post p = dao.getPostByID(postID);
        request.setAttribute("up", p);
        request.getRequestDispatcher("updatePostDraft.jsp").forward(request, response);
    }

}
