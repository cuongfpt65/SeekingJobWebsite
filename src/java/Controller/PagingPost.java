/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.CompanyDAO;
import DAO.PostDAO;
import Model.Company;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Trần Tấn Lợi-CE171879
 */
public class PagingPost extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PagingPost</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PagingPost at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            String indexPage = request.getParameter("index");
            String Company = null;
            Cookie[] cookie = request.getCookies();
            if (cookie != null) {
                for (Cookie c : cookie) {
                    if (c.getName().equalsIgnoreCase("id")) {
                        Company = c.getValue();
                    }
                }
            }

            PostDAO pos = new PostDAO();
           
            CompanyDAO dao = new CompanyDAO();
            Company a = dao.getUser(Company);
            request.setAttribute("br", a);
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
    
            int count = pos.getTotalPost(Company);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Post> list = pos.getAllPostByIdCompanyfive(Company, index);
            request.setAttribute("listqq", list);
            request.setAttribute("endp", endPage);
            request.setAttribute("tag", index);
            request.getRequestDispatcher("DetailCompanyForCompany.jsp").
                    forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PagingPost.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
