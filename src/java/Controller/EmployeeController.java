/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.EmployeeDAO;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class EmployeeController extends HttpServlet {

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

        String action = request.getParameter("action");
        String id = null;
        Cookie[] cookie = request.getCookies();
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            if (action.equalsIgnoreCase("company")) {
                String employeeId = request.getParameter("idEmployee");
                EmployeeDAO employDao = new EmployeeDAO();
                Employee employ = employDao.getAllEmployeeById(employeeId);
                request.setAttribute("seeprofile", employ);
                request.getRequestDispatcher("employeeDetail.jsp").forward(request, response);
            } else if (action.equals("employeeProfile")) {
                EmployeeDAO employDao = new EmployeeDAO();
                Employee employ = employDao.getAllEmployeeById(id);
                request.setAttribute("see", employ);
                request.getRequestDispatcher("employeesPro.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                EmployeeDAO employDao = new EmployeeDAO();
                Employee employ = employDao.getAllEmployeeById(id);
                request.setAttribute("x", employ);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                response.sendRedirect("Home");
            }
        } else {
            response.sendRedirect("Home");
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
        String submit = request.getParameter("submit");
        if (submit.equalsIgnoreCase("edit")) {

            String idEmployee = request.getParameter("id");
            String lastName = request.getParameter("lastName");
            String firstName = request.getParameter("firstName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String inputDateStr = request.getParameter("dob");
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date dob = null;
            try {
                Date utilDate = inputFormat.parse(inputDateStr);
                dob = new java.sql.Date(utilDate.getTime());

            } catch (ParseException e) {
                e.printStackTrace();
            }

            String address = request.getParameter("address");
            String major = request.getParameter("major");
            String gender = request.getParameter("gender");
            String academic = request.getParameter("academic");

            // Create Employee object
            Employee employee = new Employee(idEmployee, lastName, firstName, email, password, phone, dob, address, major, gender, academic);

            // Update employee using EmployeeDAO
            EmployeeDAO dao = new EmployeeDAO();

            try {
                dao.updateEmployee(employee);
               response.sendRedirect("Home");
                 
            } catch (SQLException e) {
                e.printStackTrace();
                // Log error message
                System.out.println("Failed to update employee: " + e.getMessage());

                // Set an attribute to show an error message on your JSP page
                request.setAttribute("errorMessage", "Failed to update employee. Please check the details and try again.");
                request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                // Log error message
                System.out.println("No employee updated. ID " + idEmployee + " not found or no changes made.");

                // Set an attribute to show an error message on your JSP page
                request.setAttribute("errorMessage", "Employee ID " + idEmployee + " not found or no changes made.");
                request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
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
