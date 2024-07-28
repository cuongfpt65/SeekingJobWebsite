package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Controller.ApplyController.Applies;
import DAO.ApplyDAO;
import DAO.CVDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import Model.Apply;
import Model.Post;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet(urlPatterns = {"/SearchAjax"})
public class SearchByAjax extends HttpServlet {

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
        String search = request.getParameter("txt");
        String SearchApply = request.getParameter("apply");
        String status = request.getParameter("status");
        String statusEmployee = request.getParameter("statusEmployee");
        String nameCompany = request.getParameter("nameCompany");
        if (search != null) {
            PostDAO aD = new PostDAO();
            List<Post> list = aD.searchPost(search);

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            for (Post job : list) {
                out.println("<li class='list-group-item'>");
                out.println("    <h5>" + job.getTitle() + "</h5>");
                out.println("    <p>Author: " + job.getIdCompany() + "</p>");
                out.println("    <p>Overview: " + job.getDescription() + "</p>");
                out.println("    <div class='d-flex justify-content-end'>");
                out.println("        <button class='btn btn-sm btn-secondary mr-2' onclick=\"showModal('" + job.getId() + "')\">Hide</button>");
                out.println("        <button class='btn btn-sm btn-danger' onclick=\"deleteJob('" + job.getId() + "')\">Delete</button>");
                out.println("    </div>");
                out.println("</li>");

            }
        }

        if (SearchApply != null) {
            showListApply(request, response, SearchApply);
        }
        if (status != null) {
            showApplyBystatus(request, response, status);
        }
        if (statusEmployee != null) {
            try {
                showApplyHistory(request, response, statusEmployee);
            } catch (Exception ex) {
                Logger.getLogger(SearchByAjax.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if(nameCompany!=null){
            try {
                showApplyHistoryByNameCompany(request, response, nameCompany);
            } catch (Exception ex) {
                Logger.getLogger(SearchByAjax.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        processRequest(request, response);
    }

    public void showListApply(HttpServletRequest request, HttpServletResponse response, String txt) throws ServletException, IOException {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApply(id, txt));
            if (list != null) {
                PostDAO post = new PostDAO();
                EmployeeDAO em = new EmployeeDAO();
                CVDAO cv = new CVDAO();
                List<Applies> show = new ArrayList<>();
                String tilte = null;
                for (Apply apply : list) {
                    if (post.getPostByID(apply.getPostId()) != null) {
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    } else {
                        tilte = "Post is deleted";

                    }

                    String Name = em.getAllEmployeeById(apply.getEmpoyeeId()).getFirstName();
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    show.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));

                }

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                int i = 0;

                for (Applies a : show) {
                    out.print("<tr>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'>" + a.getTilte() + "</td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'><a href='employeeProfile?action=Company&idEmployee=" + list.get(i).getEmpoyeeId() + "'>" + a.getNameEmployee() + "</a></td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'><a href='" + a.getCv() + "' download> Click to download CV</a></td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'>");
                    out.print("        <form action='ApplyController' method='post'>");
                    out.print("            <input type='hidden' name='ApplyId' value='" + a.getApplyId() + "' />");

                    if (a.getStatus().equals("Reject")) {
                        out.print(a.getStatus());
                    } else if (a.getStatus().equals("Accept")) {
                        out.print(a.getStatus());
                    } else if (a.getStatus().equals("Waiting")) {
                        out.print("            <button type='submit' name='status' value='accept' style='background-color: #28a745; color: white; border: none; padding: 5px 10px; cursor: pointer;' onclick='handleButtonClick(\"" + a.getStatus() + "\")'>Accept</button>");
                        out.print("            <button type='submit' name='status' value='reject' style='background-color: #dc3545; color: white; border: none; padding: 5px 10px; cursor: pointer;' onclick='handleButtonClick(\"" + a.getStatus() + "\")'>Reject</button>");
                    }

                    out.print("        </form>");
                    out.print("    </td>");
                    out.print("</tr>");

                }

            } else {
                PrintWriter out = response.getWriter();
                out.print("<h5>Not applied you found!</h5>");
            }
        }

    }

    public void showApplyBystatus(HttpServletRequest request, HttpServletResponse response, String txt) throws ServletException, IOException {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApplyForStatus(id, txt));
            if (list != null) {
                PostDAO post = new PostDAO();
                EmployeeDAO em = new EmployeeDAO();
                CVDAO cv = new CVDAO();
                List<Applies> show = new ArrayList<>();
                String tilte = null;
                for (Apply apply : list) {
                    if (post.getPostByID(apply.getPostId()) != null) {
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    } else {
                        tilte = "Post is deleted";

                    }

                    String Name = em.getAllEmployeeById(apply.getEmpoyeeId()).getFirstName();
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    show.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));

                }

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                int i = 0;

                for (Applies a : show) {
                    out.print("<tr>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'>" + a.getTilte() + "</td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'><a href='employeeProfile?action=Company&idEmployee=" + list.get(i).getEmpoyeeId() + "'>" + a.getNameEmployee() + "</a></td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'><a href='" + a.getCv() + "' download> Click to download CV</a></td>");
                    out.print("    <td style='padding: 10px; border: 1px solid #ddd;'>");
                    out.print("        <form action='ApplyController' method='post'>");
                    out.print("            <input type='hidden' name='ApplyId' value='" + a.getApplyId() + "' />");

                    if (a.getStatus().equals("Reject")) {
                        out.print(a.getStatus());
                    } else if (a.getStatus().equals("Accept")) {
                        out.print(a.getStatus());
                    } else if (a.getStatus().equals("Waiting")) {
                        out.print("            <button type='submit' name='status' value='accept' style='background-color: #28a745; color: white; border: none; padding: 5px 10px; cursor: pointer;' onclick='handleButtonClick(\"" + a.getStatus() + "\")'>Accept</button>");
                        out.print("            <button type='submit' name='status' value='reject' style='background-color: #dc3545; color: white; border: none; padding: 5px 10px; cursor: pointer;' onclick='handleButtonClick(\"" + a.getStatus() + "\")'>Reject</button>");
                    }

                    out.print("        </form>");
                    out.print("    </td>");
                    out.print("</tr>");

                }

            } else {
                PrintWriter out = response.getWriter();
                out.print("<h5>Not applied you found!</h5>");
            }
        }

    }

    public void showApplyHistory(HttpServletRequest request, HttpServletResponse response, String txt) throws ServletException, IOException, Exception {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApplybyEmployee(id, txt));
            if (list != null) {

                PostDAO post = new PostDAO();
                CompanyDAO cm = new CompanyDAO();
                CVDAO cv = new CVDAO();
                List<Applies> showList = new ArrayList<>();
                String tilte = null;

                for (Apply apply : list) {
                    if (post.getPostByID(apply.getPostId()) != null) {
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    } else {
                        tilte = "Post is deleted";

                    }

                    String Name = cm.getUser(apply.getCompanyId()).getNameCompany();
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    showList.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));

                }
                PrintWriter out = response.getWriter();
                for (Applies a : showList) {
                    out.print("<tr>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getTilte() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getNameEmployee() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\"><a href=\"" + a.getCv() + "\" download>Click to download CV</a></td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getStatus() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd; justify-content: center; text-align: center\">");
                    if ("Waiting".equals(a.getStatus())) {
                        out.print("        <form action=\"ApplyController\" method=\"post\">");
                        out.print("            <input type=\"hidden\" name=\"ApplyId\" value=\"" + a.getApplyId() + "\" />");
                        out.print("            <button type=\"submit\" name=\"status\" value=\"delete\" style=\"background-color: red; color: white; border: none; padding: 5px 10px; cursor: pointer;\">Delete</button>");
                        out.print("        </form>");
                    }
                    out.print("    </td>");
                    out.print("</tr>");

                }

            } else {
                request.getRequestDispatcher("ApplyHistory.jsp").forward(request, response);
            }
        }

    }

    public void showApplyHistoryByNameCompany(HttpServletRequest request, HttpServletResponse response, String txt) throws ServletException, IOException, Exception {
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
                String tilte = null;

                for (Apply apply : list) {

                    if (post.getPostByID(apply.getPostId()) != null) {
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    } else {
                        tilte = "Post is deleted";

                    }

                    String Name = cm.getUser(apply.getCompanyId()).getNameCompany();
                    if (Name.equalsIgnoreCase(txt)||txt.equalsIgnoreCase("")) {
                        String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                        showList.add(new Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));
                    }

                }
                PrintWriter out = response.getWriter();
                for (Applies a : showList) {
                    out.print("<tr>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getTilte() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getNameEmployee() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\"><a href=\"" + a.getCv() + "\" download>Click to download CV</a></td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd;\">" + a.getStatus() + "</td>");
                    out.print("    <td style=\"padding: 10px; border: 1px solid #ddd; justify-content: center; text-align: center\">");
                    if ("Waiting".equals(a.getStatus())) {
                        out.print("        <form action=\"ApplyController\" method=\"post\">");
                        out.print("            <input type=\"hidden\" name=\"ApplyId\" value=\"" + a.getApplyId() + "\" />");
                        out.print("            <button type=\"submit\" name=\"status\" value=\"delete\" style=\"background-color: red; color: white; border: none; padding: 5px 10px; cursor: pointer;\">Delete</button>");
                        out.print("        </form>");
                    }
                    out.print("    </td>");
                    out.print("</tr>");

                }

            } else {
                request.getRequestDispatcher("ApplyHistory.jsp").forward(request, response);
            }
        }

    }
    public List<Apply> getListApplybyEmployee(String id) {
        ApplyDAO dao = new ApplyDAO();
        return dao.getAllPostByIdEmployee(id);

    }

    public List<Apply> getListApplybyEmployee(String id, String txt) {
        ApplyDAO dao = new ApplyDAO();
        return dao.getAllPostByIdEmployee(id, txt);

    }

    public List<Apply> getListApply(String id, String title) {
        ApplyDAO dao = new ApplyDAO();
        return dao.searchApply(id, title);

    }

    public List<Apply> getListApplyForStatus(String id, String status) {
        ApplyDAO dao = new ApplyDAO();
        return dao.searchApplyForStatus(id, status);

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

}
