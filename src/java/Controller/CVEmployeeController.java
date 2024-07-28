/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import AutoID.AutoID;
import DAO.CVDAO;
import Model.CV;
import Util.Upload;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author Phan Thanh Dat
 */
@WebServlet(name = "CVEmployeeController", urlPatterns = {"/cv-employee"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class CVEmployeeController extends HttpServlet {

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
            out.println("<title>Servlet CVEmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CVEmployeeController at " + request.getContextPath() + "</h1>");
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
        action = action != null ? action.trim() : "";
        CVDAO cvDao = new CVDAO();
         String id = null;
            Cookie[] cookie = request.getCookies();
            for (Cookie c : cookie) {
                if (c.getName().equalsIgnoreCase("id")) {
                    id = c.getValue();
                }
            }
        switch (action) {
            case "edit":
                String cvId = request.getParameter("id");
                CV cv = cvDao.getCVById(cvId);
                request.setAttribute("cv", cv);
                request.getRequestDispatcher("editCV.jsp").forward(request, response);
                break;
            case "upload":
                request.getRequestDispatcher("uploadCV.jsp").forward(request, response);
                break;
            case "delete":
                String cvIdDelete = request.getParameter("id");
                cvDao.deleteCV(cvIdDelete);
                response.sendRedirect("cv-employee");
                break;
            default:
                
                List<CV> cvList = cvDao.getCVsByEmployeeId(id);
                request.setAttribute("cvList", cvList);
                request.getRequestDispatcher("cvList.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        action = action != null ? action.trim() : "";

        switch (action) {
            case "edit":
                this.editCV(request, response);
                break;
            case "upload":
                this.uploadCV(request, response);
                break;
        }
    }

    private void uploadCV(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String action = request.getParameter("action");
            String id = null;
            Cookie[] cookie = request.getCookies();
            for (Cookie c : cookie) {
                if (c.getName().equalsIgnoreCase("id")) {
                    id = c.getValue();
                }
            }
            Upload upload = new Upload();
            Part filePath = request.getPart("cvUpload");
            String pathDir = "./uploads/cv/";
            String uploadPath = getServletContext().getRealPath(pathDir);
            String fileName = upload.uploadFile(filePath, uploadPath);
            if (fileName == null) {
                response.sendRedirect("cv-employee?action=upload&errror=Please choose a cv");
                return;
            }
            CVDAO cvDao = new CVDAO();
            AutoID auto = new AutoID();
            String idCv= auto.setAutoId(cvDao.getCV());
            String fileNameSaveDb = pathDir + fileName;
            CV cv = new CV(idCv, fileNameSaveDb, id);
            cvDao.addCV(cv);
            response.sendRedirect("cv-employee");
        } catch (Exception e) {
            response.sendRedirect("cv-employee");
        }
    }

    private void editCV(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String action = request.getParameter("action");
            String id = null;
            Cookie[] cookie = request.getCookies();
            for (Cookie c : cookie) {
                if (c.getName().equalsIgnoreCase("id")) {
                    id = c.getValue();
                }
            }
                Upload upload = new Upload();
                Part filePath = request.getPart("cvUpload");
                String pathDir = "./uploads/cv/";
                String uploadPath = getServletContext().getRealPath(pathDir);
                String fileName = upload.uploadFile(filePath, uploadPath);
                String fileNameSaveDb = pathDir + fileName;
                if (fileName == null) {
                    fileNameSaveDb = request.getParameter("oldCV");
                }
                String cvId = request.getParameter("cvId");
                CVDAO cvDao = new CVDAO();

                CV cv = new CV(cvId, fileNameSaveDb, id);
                cvDao.updateCV(cv);
                response.sendRedirect("cv-employee");
            }catch (Exception e) {
            response.sendRedirect("cv-employee");
        }
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
