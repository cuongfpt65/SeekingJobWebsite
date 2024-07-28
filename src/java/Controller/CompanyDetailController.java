package Controller;


import DAO.AccountDAO;
import DAO.CompanyDAO;
import Model.Company;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/getCompanyDetails")
public class CompanyDetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

 String companyId = request.getParameter("companyId");
        CompanyDAO dao = new CompanyDAO();
        Company company = dao.getUser(companyId);

        try {
            if (company != null) {
                out.print("<div class=\"cardprofile\">");
                out.print("    <div class=\"user-persona-template\">");
                out.print("        <div class=\"frame-parent\">");
                out.print("            <div class=\"profile-header\">");
                out.print("                <img class=\"profile-icon\" alt=\"Company Image\" src=\"https://example.com/path-to-image.png\">");
                out.print("                <div class=\"name-company-parent\">");
                out.print("                    <div class=\"name-company\">");
                out.print("                        <h2 class=\"company-name\"> <span class=\"company-value\">" + company.getNameCompany() + "</span></h2>");
                out.print("                    </div>");
                out.print("                    <div class=\"info-group\">");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">CEO:</span>");
                out.print("                            <span class=\"info-value\">" + company.getNameCEO() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Phone:</span>");
                out.print("                            <span class=\"info-value\">" + company.getPhone() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">VAT:</span>");
                out.print("                            <span class=\"info-value\">" + company.getVat() + "</span>");
                out.print("                        </div>");
                out.print("                        <div class=\"info-item\">");
                out.print("                            <span class=\"info-label\">Location:</span>");
                out.print("                            <span class=\"info-value\">" + company.getLocation() + "</span>");
                out.print("                        </div>");
                out.print("                    </div>");
                out.print("                </div>");
                out.print("            </div>");
                out.print("            <div class=\"description-section\">");
                out.print("                <h3 class=\"description-title\">About Company</h3>");
                out.print("                <div class=\"description-content\">");
                out.print("                    <p class=\"description-text\">" + company.getDescription() + "</p>");                 
                out.print("                </div>");
                out.print("            </div>");
                out.print("        </div>");
                out.print("    </div>");
                out.print("</div>");
            } else {
                out.println("<p>Không tìm thấy thông tin công ty.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Đã xảy ra lỗi khi lấy thông tin công ty.</p>");
        } finally {
            out.close();
        }

        } catch (Exception ex) {
            Logger.getLogger(CompanyDetailController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
