/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.ApplyDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import DAO.staticDAO;
import Model.Company;
import Model.Employee;
import Model.Post;
import Model.ViewPost;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class HomeController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            PostDAO dao = new PostDAO();
            List<Post> list = dao.getAllPost();

            request.setAttribute("jobPosts", list);
            List<String> majors = null;
            try {
                majors = dao.getMajor();
            } catch (SQLException ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("majors", majors);

            List<String> locations = null;
            try {
                locations = dao.getLocation();
            } catch (SQLException ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("locations", locations);

            List<String> jobTypes = Arrays.asList("Fulltime", "Partime", "Freelancer", "Intern");
            request.setAttribute("jobTypes", jobTypes);

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    // Get cookie name and value

                    String id = cookie.getValue();
                    String name = cookie.getName();
                    String firstChar = id.substring(0, 1);
                    if (name.equalsIgnoreCase("id")) {
                        if (firstChar.contains("A")) {
                            setAtributeForHomeAdmin(request, response);
                            request.getRequestDispatcher("Admin/HomeAdmin.jsp").forward(request, response);
                        } else if (firstChar.contains("C")) {

                            getCompany(request, response, id);
                        } else if (firstChar.contains("E")) {
                            getPost(request, response);
                            break;
                        }

                    }
                }
                

                String indexPage = request.getParameter("index");
                if (indexPage == null) {
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);

                int count = list.size();
                int endPage = count / 5;
                if (count % 5 != 0) {
                    endPage++;
                }
                List<Post> lista = dao.pagingPost(index);                                            
                request.setAttribute("listqq", lista);
                request.setAttribute("endP", endPage);
                request.setAttribute("tag", index);
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {

                request.setAttribute("listqq", list);
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    private void getPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String Idemploy = null;
            Cookie[] cookieid = request.getCookies();
            for (Cookie cookie : cookieid) {
                if (cookie.getName().equalsIgnoreCase("id")) {
                    Idemploy = cookie.getValue();
                }
            }

            EmployeeDAO ne = new EmployeeDAO();
            Employee e = ne.getAllEmployeeById(Idemploy);
            PostDAO dao = new PostDAO();

            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int count = dao.getTotalPostNoDraft();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }

            List<Post> list = dao.pagingPost(index);
            List<String> viewPost = new ArrayList<>();

            for (Post post : list) {

                ViewPost vp = dao.getViewPost(post.getId());
                if (vp != null) {
                    viewPost.add(vp.getViewPost() + "");
                } else {
                    viewPost.add("0");
                }
            }
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nameEmployee", e);
            request.setAttribute("view", viewPost);

            request.setAttribute("listpost", list);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
            request.getRequestDispatcher("HomeEmployee.jsp").
                    forward(request, response);

        } catch (ServletException | IOException ex) {
            System.out.println(ex);
        }
    }

    public void setAtributeForHomeAdmin(HttpServletRequest request, HttpServletResponse response) {
        int countUser, countCompany, countEmployee, countApplied, countAccepted, countRejected;
        List<String> listTopMajor = new ArrayList<>();
        List<String> nameOfTopMajor = new ArrayList<>();
        List<String> listPost5Day = new ArrayList<>();
        try {
            AccountDAO aD = new AccountDAO();
            ApplyDAO appDAO = new ApplyDAO();
            staticDAO sD = new staticDAO();
            listTopMajor = sD.getTop5Major(2);
            nameOfTopMajor = sD.getTop5Major(1);
            listPost5Day = sD.getPost5Day();
            countApplied = appDAO.countApply();
            countAccepted = appDAO.countApplyAccept();
            countRejected = appDAO.countApplyReject();
            countUser = aD.countAccount("");
            countCompany = aD.countAccount("C");
            countEmployee = aD.countAccount("E");
            request.setAttribute("countUser", countUser);
            request.setAttribute("countCompany", countCompany);
            request.setAttribute("countEmployee", countEmployee);
            request.setAttribute("countAccepted", countAccepted);
            request.setAttribute("countRejected", countRejected);
            request.setAttribute("countApplied", countApplied);
            request.setAttribute("listTopMajor", listTopMajor);
            request.setAttribute("nameOfTopMajor", nameOfTopMajor);
            request.setAttribute("listPost5Day", listPost5Day);

        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
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

    private void getCompany(HttpServletRequest request, HttpServletResponse response, String id) {
        try {
            PostDAO daoa = new PostDAO();

            String Company = id;
            CompanyDAO dao = new CompanyDAO();
            Company a = dao.getUser(Company);
            request.setAttribute("br", a);

            String Idcompany = null;

            Cookie[] cookieid = request.getCookies();
            for (Cookie cookie : cookieid) {
                if (cookie.getName().equalsIgnoreCase("id")) {
                    Idcompany = cookie.getValue();
                }
            }
            //phan trang 
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int count = daoa.getTotalPostNoDraft(Idcompany);
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            List<Post> list = daoa.getAllPostByIdCompany(Idcompany, index);
            EmployeeDAO eml = new EmployeeDAO();

            List<Employee> lidd = eml.getAllEmployee();
            request.setAttribute("listE", lidd);
            request.setAttribute("listq", list);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
            request.getRequestDispatcher("HomeCompany.jsp").
                    forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
