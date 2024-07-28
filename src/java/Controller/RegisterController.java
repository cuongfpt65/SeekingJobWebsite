/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import Model.Account;
import Model.Company;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
       request.getRequestDispatcher("Register.jsp").forward(request, response);

        processRequest(request, response);
    }

    private boolean checkEmailInDatabase(String email) {
        // Implement database check logic here
        // Return true if email exists, false otherwise
        return false; // Example: replace with actual database check
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
        if (action.equalsIgnoreCase("register")) {
            String type = request.getParameter("type");
            if (type.equalsIgnoreCase("company")) {
                try {
                    registerCompany(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (type.equalsIgnoreCase("employee")) {

                try {
                    registerEmployee(request, response);
                } catch (Exception ex) {
                    System.out.println(ex);;
                }
            }
        }
        processRequest(request, response);
    }

    public void registerCompany(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String nameCompany = request.getParameter("nameCompany");
        String CEO = request.getParameter("ceo");
        String logo = request.getParameter("logo");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String location = request.getParameter("location");
        String vat = request.getParameter("vat");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String description = request.getParameter("description");
        Company company = new Company("", email, password, nameCompany, CEO, vat, location, address, phone, logo, description);
        CompanyDAO dao = new CompanyDAO();
        AccountDAO acc = new AccountDAO();
        acc.insertAccount(company);
        dao.insertCompany(company);
        acc.insertStatusAccount(company);
        response.sendRedirect("Login.jsp");

    }

    public void registerEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");

        String email = request.getParameter("emailEmployee");
        String address = request.getParameter("addressEmployee");
        String major = request.getParameter("major");
        String dateString = request.getParameter("dob");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(dateString, formatter);
        // Chuyển đổi LocalDate thành java.sql.Date
        Date sqlDate = Date.valueOf(localDate);
        String phone = request.getParameter("phoneEmployee");
        String password = request.getParameter("passwordEmployee");
        String gender = request.getParameter("gender");
        String academic = request.getParameter("academic");
        AccountDAO acc = new AccountDAO();
        Account check = acc.checkMail(email);
        if (check != null) {
            String message = "Your email is in database ";
            HttpSession session = request.getSession();
            session.setAttribute("email", message);
          request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            
            EmployeeDAO dao = new EmployeeDAO();
            // Employee(String idEmployee, String lastName, String firstName, String email, String password, String phone, Date dob, String address, String major, String gender, String academic)
            Employee employee = new Employee("", lastName, firstName, email, password, phone, sqlDate, address, major, gender, academic);
            acc.insertAccount(employee);
            dao.insertEmployee(employee);
            acc.insertStatusAccount(employee);
            
            response.sendRedirect("Login.jsp");
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
