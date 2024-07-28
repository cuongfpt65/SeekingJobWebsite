/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import Model.Account;
import Model.Company;

import Model.Email_1;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class ForgotController extends HttpServlet {

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
            out.println("<title>Servlet ForgotController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotController at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();

        if (path.endsWith("/ForgotController")) {
            request.getRequestDispatcher("emailCode.jsp").forward(request, response);
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
        if (request.getParameter("btn-forgot") != null) {
            try {
                String email = request.getParameter("email");
                AccountDAO ad = new AccountDAO();
                Account check = ad.checkMail(email);
                if (check != null) {
                    Email_1 e = new Email_1();
                    boolean flat = e.getSendEmail(email);
                    if (flat == true) {
                        HttpSession session = request.getSession();
                        session.setAttribute("email-forgot", email);
                        session.setAttribute("email-code-forgot", e.getCode_email());
                        request.getRequestDispatcher("Otp.jsp").forward(request, response);
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("email-error", email);
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    }
                }else{
                      HttpSession session = request.getSession();
                      String msg = "Your email isn't register ";
                        session.setAttribute("email-wrong", msg);
                          request.getRequestDispatcher("emailCode.jsp").forward(request, response);
                }
            } catch (Exception ex) {
                Logger.getLogger(ForgotController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        if (request.getParameter("btn-ChangeForgot") != null) {
            try {
                String OTP = request.getParameter("otp");
                String confirm = request.getParameter("password");
                HttpSession session = request.getSession();
                String email = (String) session.getAttribute("email-forgot");
                String email_code = (String) session.getAttribute("email-code-forgot");
                AccountDAO ad = new AccountDAO();
                Account check = ad.checkMail(email);
                if (check != null) {
                    if (email_code.equalsIgnoreCase(OTP)) {
                        String chec = ad.forgotPassword(confirm, email);
                        if (chec != null) {
                            session.setAttribute("forgotSuccessfull", "");
                            request.getRequestDispatcher("Login.jsp").forward(request, response);
                        } else {
                            response.sendRedirect("/ForgotController");
                        }
                    } else {
                        email = (String) session.getAttribute("email-forgot");
                        Email_1 e = new Email_1();
                        boolean flat = e.getSendEmail(email);
                        String msg = "OTP wrong";
                        session.setAttribute("email-forgot1", msg);
                        if (flat == true) {
                            session.setAttribute("email-forgot", email);
                            session.setAttribute("email-code-forgot", e.getCode_email());
                            request.getRequestDispatcher("Otp.jsp").forward(request, response);
                        }
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(ForgotController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (request.getParameter("btn-sendAgain") != null) {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email-forgot");
            Email_1 e = new Email_1();
            boolean flat = e.getSendEmail(email);
            if (flat == true) {
                request.getRequestDispatcher("Otp.jsp").forward(request, response);
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
