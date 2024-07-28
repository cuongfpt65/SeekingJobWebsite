package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAO.AccountDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import DAO.emailDAO;
import Model.Apply;
import Model.Company;
import Model.Employee;
import Model.Post;
import Model.statusAccount;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class AdminController extends HttpServlet {

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
        switch (action) {
            case "PostManagement":
                viewPost(request, response);
                viewCheckingPost(request, response);
                request.getRequestDispatcher("Admin/PostManagement.jsp").forward(request, response);
                break;
            case "CompanyManagement": {
                try {
                    viewCompany(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/CompanyManagement.jsp").forward(request, response);
            break;
            case "EmployeeManagement": {
                try {
                    viewEmployee(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/EmployeeManagement.jsp").forward(request, response);
            break;
            case "lock": {
                try {

                    lockCompany(request, response);
                    viewCompany(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/CompanyManagement.jsp").forward(request, response);
            break;
            case "unlock": {
                try {
                    unlockCompany(request, response);
                    viewCompany(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/CompanyManagement.jsp").forward(request, response);
            break;
            case "lockEmployee": {
                try {
                    lockCompany(request, response);
                    viewEmployee(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/EmployeeManagement.jsp").forward(request, response);
            break;
            case "unlockEmployee": {
                try {
                    unlockCompany(request, response);
                    viewEmployee(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("Admin/EmployeeManagement.jsp").forward(request, response);
            break;

        }
        // Mock data
        processRequest(request, response);
    }

    public void sendmail(String id, String action) throws Exception {
        emailDAO emailD = new emailDAO();
        CompanyDAO dao = new CompanyDAO();
        Company c = dao.getUser(id);
        String email = c.getEmail();

        String nameCompany = c.getNameCompany();
        if (action.equalsIgnoreCase("lock")) {
            String sta = "Dear " + nameCompany + ",\n"
                    + "\n"
                    + "We hope this message finds you well.\n"
                    + "\n"
                    + "We regret to inform you that your account has been temporarily locked due to suspicious activity. This measure has been taken to ensure the security and integrity of your account and our platform.\n"
                    + "\n"
                    + "What this means for you:\n"
                    + "\n"
                    + "You will not be able to access your account until the lock is lifted.\n"
                    + "Any pending transactions or activities associated with your account will be on hold.\n"
                    + "Our team is currently reviewing the situation and will take the necessary steps to resolve this matter.\n"
                    + "What you need to do:\n"
                    + "\n"
                    + "If you believe this lock is a mistake, please contact our support team at cuongncce171013@fpt.edu.vn with your account details and any relevant information.\n"
                    + "Please refrain from attempting to access your account until you receive further instructions from our team.\n"
                    + "We understand that this may cause inconvenience, and we apologize for any disruption this may have caused. Our team is working diligently to address the issue and will notify you as soon as there are updates regarding your account status.\n"
                    + "\n"
                    + "Thank you for your patience and understanding.\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Admin Seeking job website";
            emailD.send(email, "Your accout is locked", sta);
        } else {
            String sta = "Dear " + nameCompany + ",\n"
                    + "\n"
                    + "We are pleased to inform you that your account has been successfully unlocked, and you can now resume access to your account without any restrictions.\n"
                    + "\n"
                    + "Details:\n"
                    + "\n"
                    + "Account: " + c.getEmail() + "\n"
                    + "Date Unlocked: " + LocalDate.now() + "\n"
                    + "What this means for you:\n"
                    + "\n"
                    + "You can now log in to your account as usual.\n"
                    + "All your account features and services are fully restored.\n"
                    + "We understand that the temporary lock may have caused some inconvenience, and we appreciate your patience and cooperation during this period. If you have any questions or need further assistance, please do not hesitate to contact our support team at [support email or phone number].\n"
                    + "\n"
                    + "Thank you for your understanding and continued trust in our services.\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Admin Seeking job website";
            emailD.send(email, "Account Unlocke", sta);
        }

    }

    public void sendmailForEmployee(String id, String action) throws Exception {
        emailDAO emailD = new emailDAO();
        EmployeeDAO dao = new EmployeeDAO();
        Employee e = dao.getAllEmployeeById(id);
        String email = e.getEmail();

        String nameEmployee = e.getFirstName();
        if (action.equalsIgnoreCase("lock")) {
            String sta = "Dear " + nameEmployee + ",\n"
                    + "\n"
                    + "We hope this message finds you well.\n"
                    + "\n"
                    + "We regret to inform you that your account has been temporarily locked due to suspicious activity. This measure has been taken to ensure the security and integrity of your account and our platform.\n"
                    + "\n"
                    + "What this means for you:\n"
                    + "\n"
                    + "You will not be able to access your account until the lock is lifted.\n"
                    + "Any pending transactions or activities associated with your account will be on hold.\n"
                    + "Our team is currently reviewing the situation and will take the necessary steps to resolve this matter.\n"
                    + "What you need to do:\n"
                    + "\n"
                    + "If you believe this lock is a mistake, please contact our support team at cuongncce171013@fpt.edu.vn with your account details and any relevant information.\n"
                    + "Please refrain from attempting to access your account until you receive further instructions from our team.\n"
                    + "We understand that this may cause inconvenience, and we apologize for any disruption this may have caused. Our team is working diligently to address the issue and will notify you as soon as there are updates regarding your account status.\n"
                    + "\n"
                    + "Thank you for your patience and understanding.\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Admin Seeking job website";
            emailD.send(email, "Your accout is locked", sta);
        } else {
            String sta = "Dear " + nameEmployee + ",\n"
                    + "\n"
                    + "We are pleased to inform you that your account has been successfully unlocked, and you can now resume access to your account without any restrictions.\n"
                    + "\n"
                    + "Details:\n"
                    + "\n"
                    + "Account: " + e.getEmail() + "\n"
                    + "Date Unlocked: " + LocalDate.now() + "\n"
                    + "What this means for you:\n"
                    + "\n"
                    + "You can now log in to your account as usual.\n"
                    + "All your account features and services are fully restored.\n"
                    + "We understand that the temporary lock may have caused some inconvenience, and we appreciate your patience and cooperation during this period. If you have any questions or need further assistance, please do not hesitate to contact our support team at [support email or phone number].\n"
                    + "\n"
                    + "Thank you for your understanding and continued trust in our services.\n"
                    + "\n"
                    + "Best regards,\n"
                    + "Admin Seeking job website";
            emailD.send(email, "Account Unlocke", sta);
        }

    }

    public void viewPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Model.Post> jobs = new ArrayList<>();
        PostDAO dao = new PostDAO();
        jobs = dao.getAllPost();
        List<String> listNameCompany = dao.getAllNameCompanyOfPost();
        List<Apply> reviewPosts = new ArrayList<>();

        // Set data in request scope
        request.setAttribute("jobs", jobs);
        request.setAttribute("reviewPosts", reviewPosts);
        request.setAttribute("listNameCompany", listNameCompany);

        // Forward request to JSP
    }

    public void viewCheckingPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Model.Post> jobs;
        PostDAO dao = new PostDAO();
        jobs = dao.getAllPostChecking();
        List<String> nameCompanyChecking;
        nameCompanyChecking = dao.getAllnameCompanyPostChecking();
        // Set data in request scope
        request.setAttribute("checking", jobs);
        request.setAttribute("nameCompanyChecking", nameCompanyChecking);
    }

    public void viewCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        List<Company> listCompany = new ArrayList<>();
        CompanyDAO dao = new CompanyDAO();
        listCompany = dao.getAllCompany();
        AccountDAO aD = new AccountDAO();
        List<statusAccount> listStatus = aD.showListAccountCompany();
        // Thêm các nhà tuyển dụng khác vào danh sách
        request.setAttribute("companyList", listCompany);
        request.setAttribute("listStatus", listStatus);

    }

    public void viewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        List<Employee> listEmployee = new ArrayList<>();
        EmployeeDAO dao = new EmployeeDAO();
        listEmployee = dao.getAllEmployee();
        AccountDAO aD = new AccountDAO();
        List<statusAccount> listStatus = aD.showListAccountEmployee();
        // Thêm các nhà tuyển dụng khác vào danh sách
        request.setAttribute("listEmployee", listEmployee);
        request.setAttribute("listStatus", listStatus);
    }

    public void lockCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

        String companyId = request.getParameter("id");
        if (companyId.contains("C")) {
            sendmail(companyId, "lock");
        } else {
            sendmailForEmployee(companyId, "lock");
        }
        AccountDAO aD = new AccountDAO();
        aD.setAccount(companyId);
        int check = aD.checkAccount(companyId);
        request.setAttribute("checkAccount", check);

    }

    public void unlockCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

        String companyId = request.getParameter("id");
        if (companyId.contains("C")) {
            sendmail(companyId, "unlock");
        } else {
            sendmailForEmployee(companyId, "unlock");
        }
        AccountDAO aD = new AccountDAO();
        aD.unlockAccount(companyId);
        int check = aD.checkAccount(companyId);
        request.setAttribute("checkAccount", check);

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
        String status = request.getParameter("status");
        String idPost = request.getParameter("Id");
        switch (status) {
            case "hide":
                setHidenPost(idPost);

                break;
            case "delete":
                deletePost(idPost);

                break;
            case "approve":
                setStatusPost(idPost);

                break;
            case "reject":
                deletePost(idPost);

                break;

        }
        viewCheckingPost(request, response);
        viewPost(request, response);
        request.getRequestDispatcher("Admin/PostManagement.jsp").forward(request, response);

        processRequest(request, response);
    }

    public void setStatusPost(String idPost) {
        PostDAO dao = new PostDAO();
        dao.setStatusPost(idPost);
    }

    public void setHidenPost(String idPost) {
        PostDAO dao = new PostDAO();
        dao.setHidenPost(idPost);
    }

    public void deletePost(String idPost) {
        PostDAO dao = new PostDAO();
        dao.deletePost(idPost);
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
