/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CompanyDAO;
import Model.Account;
import Model.Company;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Trần Tấn Lợi-CE171879
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        if (request.getParameter("signIn") != null) {
            try {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                AccountDAO ad = new AccountDAO();
                Account check = ad.checkLogin(email, password);
                String id = check.getAccountId();
                if (id != null) {
                    if ((id.charAt(0) + "").equalsIgnoreCase("A")) {
                        Cookie co = new Cookie("id", id);
                        co.setMaxAge(60 * 60 * 24);
                        response.addCookie(co);
                        response.sendRedirect("Home");
                    } else {
                        int status = ad.checkAccount(id);
                        if (status == 1) {
                            Cookie co = new Cookie("id", id);
                            co.setMaxAge(60 * 60 * 24);
                            response.addCookie(co);
                            String firstChar = id.substring(0, 1);
                            if (firstChar.contains("A")) {
                                response.sendRedirect("Home");
                            } else if (firstChar.contains("C")) {

                                response.sendRedirect("Home");
                            } else if (firstChar.contains("E")) {
                                response.sendRedirect("Home");
                            }
                        } else {
                            String message = "Account be lock!!!!";

                            request.setAttribute("checkLogin", message);
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        }
                    }

                }

            } catch (Exception ex) {
                String message = "Account or password is incorrect";
                HttpSession session = request.getSession();
                request.setAttribute("checkLogin", message);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

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

}
