/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.FeedbackDAO;
import Model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author NganPT
 */
public class FeedbackController extends HttpServlet {

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
        String action = request.getServletPath();
        try {
            switch (action) {
                case "create":
                    addFeedback(request, response);
                    break;
                case "update":
                    updateFeedback(request, response);
                    break;
                case "delete":
                    deleteFeedback(request, response);
                    break;
                default:    //list
                    listFeedback(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
        }
    }

    private void listFeedback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO dao = new FeedbackDAO();
        List<Feedback> listFeedbacks = dao.getAllFeedbacks();

        request.setAttribute("listFeedback", listFeedbacks);
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
    }

    private void addFeedback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void updateFeedback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    
    private void deleteFeedback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        FeedbackDAO dao = new FeedbackDAO();
//        
//        String fId = request.getParameter("feedbackId");
//        
//        List<Feedback> listFeedbacks = dao.getAllFeedbacks();
//
//        request.setAttribute("listFeedback", listFeedbacks);
//        response.sendRedirect("feedback");
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
//        processRequest(request, response);
        doGet(request, response);
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
