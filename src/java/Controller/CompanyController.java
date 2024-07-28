/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CompanyDAO;
import DAO.PostDAO;
import Model.Account;
import Model.Company;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Trần Tấn Lợi-CE171879
 */
@MultipartConfig
public class CompanyController extends HttpServlet {

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
            out.println("<title>Servlet CompanyController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CompanyController at " + request.getContextPath() + "</h1>");
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

            switch (action) {
                case "delete":
                    deleteCompany(request, response);
                    break;
                case "accountEmploy":
                    getCompanyforEmploy(request, response);
                    break;
                case "listUp":
                    updateCompany(request, response);
                    break;
                case "profileCompany":
                    getCompany(request, response);
                    break;
                case "listCompany":
                    CompanyDAO dao = new CompanyDAO();
                    List<Company> a = dao.getAllCompany();
                    String Id = null;
                    Cookie[] cookieid = request.getCookies();
                    for (Cookie cookie : cookieid) {
                        if (cookie.getName().equalsIgnoreCase("id")) {
                            Id = cookie.getValue();
                        }
                    }
                    if (Id == null) {
                        request.setAttribute("listc", a);
                        request.getRequestDispatcher("listCompanyGuest.jsp").forward(request, response);
                    } else {
                        String first = Id.charAt(0) + "";
                        if (first.equals("C")) {
                            request.setAttribute("listc", a);
                            request.getRequestDispatcher("listCompany.jsp").forward(request, response);
                        } else if (first.equals("E")) {
                            request.setAttribute("listc", a);
                            request.getRequestDispatcher("listCompanyEmployee.jsp").forward(request, response);
                        }
                    }

            }
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
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

        switch (action) {
            case "delete":
                deleteCompany(request, response);
                break;

            case "account":
                getCompany(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "change":
                change(request, response);
                break;

        }
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

    private void deleteCompany(HttpServletRequest request, HttpServletResponse response) {

        try {
            String Id = null;
            Cookie[] cookieid = request.getCookies();
            for (Cookie cookie : cookieid) {
                if (cookie.getName().equalsIgnoreCase("id")) {
                    Id = cookie.getValue();
                }
            }
            CompanyDAO dao = new CompanyDAO();
            dao.deleteCompany(Id);
            HttpSession session = request.getSession();
            Cookie[] co = request.getCookies();
            for (Cookie c : co) {
                c.setMaxAge(0);
                response.addCookie(c);
            }
            session.removeAttribute("br");
            response.sendRedirect("Home");
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void updateCompany(HttpServletRequest request, HttpServletResponse response) {

        try {
            String Company = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Company = c.getValue();
                    }
                }
            }
            CompanyDAO dao = new CompanyDAO();
            Company us = dao.getUser(Company);
            request.setAttribute("br", us);
            request.getRequestDispatcher("editProfileCom.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void getCompany(HttpServletRequest request, HttpServletResponse response) {
        try {
            String Company = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Company = c.getValue();
                    }
                }
            }

            PostDAO pos = new PostDAO();

            CompanyDAO dao = new CompanyDAO();
            Company a = dao.getUser(Company);
            request.setAttribute("br", a);
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int count = pos.getTotalPost(Company);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Post> ad = pos.getAllPostByIdCompanyfive(Company, index);
            request.setAttribute("listqq", ad);
            request.setAttribute("endp", endPage);
            request.setAttribute("tag", index);
            request.getRequestDispatcher("DetailCompanyForCompany.jsp").
                    forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        try {
            String Company = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Company = c.getValue();
                    }
                }
            }

            String mail = request.getParameter("email");
            String pass = request.getParameter("password");
            String name = request.getParameter("nameCompany");
            String nCEO = request.getParameter("nameCEO");
            String v = request.getParameter("vat");
            String lo = request.getParameter("location");
            String add = request.getParameter("address");
            String dt = request.getParameter("phone");
            String des = request.getParameter("description");

            // Existing image filename from the form
            String existingImage = request.getParameter("currentImage");

            String file = request.getSession().getServletContext().getRealPath("/imgs/rooms");
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
            fileImg = fileImg.substring(0, fileImg.length() - 1);

            Part part = request.getPart("logo");
            String picture = existingImage;

            if (part != null && part.getSize() > 0) {
                Path fileName = Paths.get(part.getSubmittedFileName());
                if (fileName != null && !fileName.toString().isEmpty()) {
                    if (!Files.exists(Paths.get(fileImg))) {
                        Files.createDirectories(Paths.get(fileImg));
                    }
                    picture = fileName.getFileName().toString();
                    part.write(fileImg + "/" + fileName);
                }
            }

            Company newCompany = new Company(Company, mail, pass, name, nCEO, v, lo, add, dt, picture, des);
            CompanyDAO dao = new CompanyDAO();
            Company ne = dao.update(Company, newCompany);
            if (ne == null) {
                String message = "Error ";
                HttpSession session = request.getSession();
                session.setAttribute("checkUpdate", message);
                PostDAO pos = new PostDAO();
                List<Post> list = pos.getAllPostByIdCompany(Company);
                request.setAttribute("listqq", list);
                Company a = dao.getUser(Company);
                request.setAttribute("br", a);
                request.getRequestDispatcher("editProfileCom.jsp").forward(request, response);
            } else {
                PostDAO pos = new PostDAO();
                List<Post> list = pos.getAllPostByIdCompany(Company);
                request.setAttribute("listqq", list);
                Company a = dao.getUser(Company);
                request.setAttribute("br", a);
                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);

                int count = pos.getTotalPost(Company);
                int endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                List<Post> ad = pos.getAllPostByIdCompanyfive(Company, index);
                request.setAttribute("listqq", ad);
                request.setAttribute("endp", endPage);
                request.setAttribute("tag", index);
                request.getRequestDispatcher("DetailCompanyForCompany.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, "Error during file upload: ", ex);
        }
    }

    private void change(HttpServletRequest request, HttpServletResponse response) {
        try {
            String Company = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Company = c.getValue();
                    }
                }
            }
            AccountDAO daoa = new AccountDAO();
            String oldpass = request.getParameter("password");
            String pass = request.getParameter("newpassword");
            Account account = daoa.oldPass(Company);
            String oldPass = account.getPassword();

            if (oldPass.equals(daoa.getMd5(oldpass))) {
                daoa.changePassword(Company, pass);
                PostDAO pos = new PostDAO();
                List<Post> list = pos.getAllPostByIdCompany(Company);
                request.setAttribute("listqq", list);
                CompanyDAO dao = new CompanyDAO();
                Company a = dao.getUser(Company);
                request.setAttribute("br", a);
                request.getRequestDispatcher("DetailCompanyForCompany.jsp").
                        forward(request, response);
            } else {
                String message = "Your password is incorrect ";
                HttpSession session = request.getSession();
                session.setAttribute("checkPass", message);
                PostDAO pos = new PostDAO();
                List<Post> list = pos.getAllPostByIdCompany(Company);
                request.setAttribute("listqq", list);
                CompanyDAO dao = new CompanyDAO();
                Company a = dao.getUser(Company);
                request.setAttribute("br", a);
                request.getRequestDispatcher("editProfileCom.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void getCompanyforEmploy(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("CompanyId");
            CompanyDAO dao = new CompanyDAO();
            PostDAO pos = new PostDAO();

            Company a = dao.getUser(id);
            request.setAttribute("br", a);
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int count = pos.getTotalPost(id);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Post> ad = pos.pagingPost(index);
            request.setAttribute("listqq", ad);
            request.setAttribute("endp", endPage);
            request.setAttribute("tag", index);
            String Id = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Id = c.getValue();
                    }
                }
            }
            if (Id == null) {
                request.getRequestDispatcher("DetailCompanyForEmployeeGuest.jsp").
                        forward(request, response);
            } else {
                String first = Id.charAt(0) + "";
                if (first.equals("C")) {
                    request.getRequestDispatcher("DetailCompanyForCompany.jsp").
                            forward(request, response);
                } else if (first.equals("E")) {
                    request.getRequestDispatcher("DetailCompanyForEmployee.jsp").
                            forward(request, response);
                }
            }

        } catch (Exception ex) {
            System.out.println(ex);
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
