/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import AutoID.AutoID;
import DAO.ApplyDAO;
import DAO.CVDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import DAO.emailDAO;
import Model.Apply;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class ApplyController extends HttpServlet {

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
            out.println("<title>Servlet ApplyController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        String postID = request.getParameter("postId");
        String companyId = request.getParameter("companyId");
        String employeeId = null;
        Cookie[] cookie = request.getCookies();
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                employeeId = c.getValue();
            }
        }
        switch (action) {
            case "apply":
                if(employeeId!=null){
                applyJob(postID, companyId, employeeId, request, response);
                }else{
                    response.sendRedirect("Login.jsp");
                    
                }

                break;
            case "listApply":
                showListApply(request, response);
                break;
            case "ApplyHistory": {
                try {
                    showApplyHistory(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(ApplyController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;

        }

        processRequest(request, response);
    }

    public void showListApply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApply(id));
            if (list != null) {
                PostDAO post = new PostDAO();
                EmployeeDAO em = new EmployeeDAO();
                CVDAO cv = new CVDAO();
                List<Applies> showList = new ArrayList<>();
                String tilte =null;
                for (Apply apply : list) {
                    if(post.getPostByID(apply.getPostId())!=null){
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    }
                    else{tilte = "Post is deleted";
                    
                    }

                    String Name = em.getAllEmployeeById(apply.getEmpoyeeId()).getFirstName();
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    showList.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));

                }
                request.setAttribute("list", list);
                request.setAttribute("listApply", showList);
                request.getRequestDispatcher("ListApplied.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ListApplied.jsp").forward(request, response);
            }
        }

    }

    public void showApplyHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApplybyEmployee(id));
            if (list != null) {
                
                PostDAO post = new PostDAO();
                CompanyDAO cm = new CompanyDAO();
                CVDAO cv = new CVDAO();
                List<Applies> showList = new ArrayList<>();
                String tilte =null;
                List<String> name = new ArrayList<>();
                for (Apply apply : list) {
                    if(post.getPostByID(apply.getPostId())!=null){
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    }
                    else{tilte = "Post is deleted";
                    
                    }

                    String Name = cm.getUser(apply.getCompanyId()).getNameCompany();
                    if(name==null){
                        name.add(Name);
                    }else{
                        if(!name.contains(Name)){
                            name.add(Name);
                        }
                    }
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    showList.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));
                    
                }
                  request.setAttribute("name", name);
                request.setAttribute("listApply", showList);
                request.getRequestDispatcher("ApplyHistory.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ApplyHistory.jsp").forward(request, response);
            }
        }

    }

    public List<Apply> getListApply(String id) {
        ApplyDAO dao = new ApplyDAO();
        return dao.getAllPostByIdApply(id);

    }

    public List<Apply> getListApplybyEmployee(String id) {
        ApplyDAO dao = new ApplyDAO();
        return dao.getAllPostByIdEmployee(id);

    }

    public void applyJob(String postId, String companyId, String employeeId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ApplyDAO dao = new ApplyDAO();
        Apply apply;
        AutoID autoid = new AutoID();
        CVDAO cvdao = new CVDAO();

        String ApplyId = autoid.setAutoId(dao.getApply());
        String CVId = cvdao.getCVByEmployeeId(employeeId).getId();
        String status = "Waiting";
        boolean check = dao.check(employeeId, postId);
        if(!check){
            request.setAttribute("check", check);
             apply = new Apply(ApplyId, CVId, employeeId, companyId, postId, status);
        dao.CreateApply(apply);
        getPostByIDD(request, response, postId);
        }
        
       
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
        ApplyDAO dao = new ApplyDAO();
        emailDAO emailD = new emailDAO();

        String status = request.getParameter("status");
        String id = request.getParameter("ApplyId");
        String email = dao.getApplyEmail(id);
        String nameEmployee = dao.getApplyNameEmployee(id);
        String nameCompany = dao.getApplyNameCompany(id);
        if (status.equalsIgnoreCase("accept")) {
            String sta = "Dear " + nameEmployee + ",\n"
                    + "\n"
                    + "I hope this message finds you well. We are delighted to inform you that you have successfully passed your interview for the Job position at " + nameCompany + ". Your skills, experience, and enthusiasm impressed our hiring team, and we are excited to welcome you aboard.\n"
                    + "\n"
                    + "Here are the next steps in the process:\n"
                    + "1. Offer Letter: You will receive an official offer letter via email within the next few days. Please review it carefully.\n"
                    + "2. Acceptance: Kindly confirm your acceptance of the offer by replying to the email with the offer letter.\n"
                    + "3. Onboarding: Once you accept the offer, we will provide you with detailed information about the onboarding process and your start date.\n"
                    + "\n"
                    + "If you have any questions or need further clarification, please do not hesitate to contact us. We are here to assist you and ensure a smooth transition into your new role.\n"
                    + "\n"
                    + "Once again, congratulations! We look forward to working with you and witnessing your contributions to the success of our team.\n"
                    + "\n"
                    + "Best regards,"
                    + "\n" + nameCompany;
            emailD.send(email, "Congratulations on Your Successful Interview!", sta);

            dao.updateApply(id, "Accept");
            showListApply(request, response);
        } else if (status.equalsIgnoreCase("reject")) {
            String sta = "Dear " + nameEmployee + ",\n"
                    + "\n"
                    + "I hope this message finds you well. Thank you for taking the time to interview for the Job position at " + nameCompany + ". We appreciate the effort you put into the application and interview process.\n"
                    + "\n"
                    + "After careful consideration, we regret to inform you that we have decided to move forward with another candidate whose qualifications more closely match the requirements for this role. This was a difficult decision given the strong pool of applicants, including yourself.\n"
                    + "\n"
                    + "We were genuinely impressed by your skills and experiences, and we encourage you to apply for future opportunities with us that align with your career goals. We will keep your resume on file and will notify you of any new openings that may be a better fit.\n"
                    + "\n"
                    + "Thank you once again for your interest in " + nameCompany + " and for the time and effort you invested in the interview process. We wish you all the best in your job search and future professional endeavors.\n"
                    + "\n"
                    + "Best regards,\n" + nameCompany;
            emailD.send(email, "Interview Outcome at " + nameCompany + " Position", sta);
            dao.updateApply(id, "Reject");
            showListApply(request, response);
        } else if (status.equalsIgnoreCase("delete")) {
            dao.deleteApply(id);
            try {
                showApplyHistory(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ApplyController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        processRequest(request, response);
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

    public static class Applies {

        private String tilte;
        private String nameEmployee;
        private String cv;
        private String ApplyId;
        private String status;

        public Applies() {
        }

        public Applies(String tilte, String nameEmployee, String cv, String ApplyId, String status) {
            this.tilte = tilte;
            this.nameEmployee = nameEmployee;
            this.cv = cv;
            this.ApplyId = ApplyId;
            this.status = status;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getApplyId() {
            return ApplyId;
        }

        public void setApplyId(String ApplyId) {
            this.ApplyId = ApplyId;
        }

        public String getTilte() {
            return tilte;
        }

        public void setTilte(String tilte) {
            this.tilte = tilte;
        }

        public String getNameEmployee() {
            return nameEmployee;
        }

        public void setNameEmployee(String nameEmployee) {
            this.nameEmployee = nameEmployee;
        }

        public String getCv() {
            return cv;
        }

        public void setCv(String cv) {
            this.cv = cv;
        }

    }

}
