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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdatePròile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePròile at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        try {
            EmployeeDAO employDao = new EmployeeDAO();
            Employee employ = employDao.getAllEmployeeById(id);
            request.setAttribute("employ", employ);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error: " + e);
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
        String idEmployee = request.getParameter("idEmployee");
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy", Locale.ENGLISH);      
        Date dob = null;
        try {
            dob = (Date) formatter.parse(request.getParameter("dob"));
        } catch (ParseException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
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
            response.sendRedirect(request.getContextPath() + "/");
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
