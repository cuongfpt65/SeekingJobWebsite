/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import Model.Company;
import Model.Employee;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
@WebServlet("/EmployeeDetailController")
public class EmployeeDetailController extends HttpServlet {

      private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
   // Lấy employeeId từ request
        String employeeId = request.getParameter("id");
        EmployeeDAO dao = new EmployeeDAO();
        AccountDAO aD = new AccountDAO();
        int checkAccount = aD.checkAccount(employeeId);
        Employee employee;

        try {
            // Lấy thông tin nhân viên theo employeeId
            employee = dao.getAllEmployeeById(employeeId);

            if (employee != null) {
                out.print("<div class=\"cardprofile\">");
                out.print("    <div class=\"user-persona-template\">");
                out.print("        <div class=\"frame-parent\">");
                out.print("            <div class=\"profile-header\">");
                out.print("                <div class=\"name-company-parent\">");
                out.print("                    <div class=\"name-company\">");
                out.print("                        <h2 class=\"company-name\"> <span class=\"company-value\">" + employee.getFirstName() + "</span></h2>");
                out.print("                    </div>");
                out.print("                    <div class=\"info-group\">");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Dob:</span>");
                out.print("                            <span class=\"info-value\">" + employee.getDob() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Phone:</span>");
                out.print("                            <span class=\"info-value\">" + employee.getPhone() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Address:</span>");
                out.print("                            <span class=\"info-value\">" + employee.getAddress() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Major:</span>");
                out.print("                            <span class=\"info-value\">" + employee.getMajor() + "</span>");
                out.print("                        </div>");
                out.print("                    </div>");
                out.print("                </div>");
                out.print("            </div>");
                out.print("            <div class=\"description-section\">");
                out.print("                <h3 class=\"description-title\">Gender</h3>");
                out.print("                <div class=\"description-content\">");
                out.print("                    <p class=\"description-text\">" + employee.getGender() + "</p>");
                out.print("                </div>");
                out.print("            </div>");
                out.print("        </div>");
                out.print("    </div>");
                out.print("</div>");
            } else {
                out.println("<p>Not find employee.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Đã xảy ra lỗi khi lấy thông tin Employee</p>");
        } finally {
            out.close(); // Đảm bảo PrintWriter được đóng
        }
    

        } catch (Exception ex) {
            Logger.getLogger(CompanyDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
