/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ApplyDAO;
import DAO.PostDAO;
import DAO.staticDAO;
import Model.Post;
import Model.ViewPost;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class StaticController extends HttpServlet {

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
            out.println("<title>Servlet StaticController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaticController at " + request.getContextPath() + "</h1>");
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
        String id = null;
        try {
            Cookie[] cookie = request.getCookies();
            for (Cookie c : cookie) {
                if (c.getName().equalsIgnoreCase("id")) {
                    id = c.getValue();
                }
            }

            if (id.charAt(0) == 'C') {
                PostDAO dao = new PostDAO();
                List<Post> list = dao.getAllPostByIdCompany(id);
                List<String> viewPost = new ArrayList<>();
                List<Integer> dataPoints = new ArrayList<>();
                for (Post post : list) {

                    ViewPost vp = dao.getViewPost(post.getId());
                    if (vp != null) {
                        viewPost.add(vp.getViewPost() + "");
                        dataPoints.add(vp.getViewPost());
                    } else {
                        viewPost.add("0");
                        dataPoints.add(0);
                    }
                }
                staticDAO staticD = new staticDAO();
                int countAccount = staticD.countAccount();
                int[] list2 = dao.getPostDay(id);
                List<String> listNumberOfPost = new ArrayList<>();
                for (int i : list2) {
                    listNumberOfPost.add(i + "");
                }
                ViewPost topView = dao.getTopViewPost(id);
                request.setAttribute("topView", topView);

                //count CV applied
                ApplyDAO app = new ApplyDAO();

                int countApply = app.countApplyOfCompany(id);
                request.setAttribute("countApply", countApply);
                int countAcceptApply = app.countApplyAcceptOfCompany(id);
                request.setAttribute("countAcceptApply", countAcceptApply);
                int countRejectApply = app.countApplyRejectOfCompany(id);
                request.setAttribute("countRejectApply", countRejectApply);

                List<String> countPost = staticD.countPost();
                request.setAttribute("countPost", countPost);
                request.setAttribute("countAccount", countAccount);

                request.setAttribute("dataPoints", listNumberOfPost);
                request.getRequestDispatcher("staticCompany.jsp").forward(request, response);
            }

            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(StaticController.class.getName()).log(Level.SEVERE, null, ex);
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
