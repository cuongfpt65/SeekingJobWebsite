/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ApplyDAO;
import DAO.CVDAO;
import DAO.CompanyDAO;
import DAO.EmployeeDAO;
import DAO.PostDAO;
import Model.Apply;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class SearchController extends HttpServlet {

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
            out.println("<title>Servlet SearchController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchController at " + request.getContextPath() + "</h1>");
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

        if (action.equalsIgnoreCase("Apply")) {
            String search = request.getParameter("searchApply");
            showListApply(request, response, search);
        }

        processRequest(request, response);
    }

    public void showListApply(HttpServletRequest request, HttpServletResponse response, String search) throws ServletException, IOException {
        Cookie[] cookie = request.getCookies();
        String id = null;
        for (Cookie c : cookie) {
            if (c.getName().equalsIgnoreCase("id")) {
                id = c.getValue();
            }
        }
        if (id != null) {
            List<Apply> list = new ArrayList<>(getListApply(id, search));
            if (list != null) {
                PostDAO post = new PostDAO();
                EmployeeDAO em = new EmployeeDAO();
                CVDAO cv = new CVDAO();
                List<ApplyController.Applies> showList = new ArrayList<>();
                String tilte = null;
                for (Apply apply : list) {
                    if (post.getPostByID(apply.getPostId()) != null) {
                        tilte = post.getPostByID(apply.getPostId()).getTitle();
                    } else {
                        tilte = "Post is deleted";

                    }

                    String Name = em.getAllEmployeeById(apply.getEmpoyeeId()).getFirstName();
                    String C = cv.getCVByCVId(apply.getCvId()).getFileName();
                    showList.add(new ApplyController.Applies(tilte, Name, C, apply.getApplyId(), apply.getStatus()));

                }
                request.setAttribute("list", list);
                request.setAttribute("listApply", showList);
                request.getRequestDispatcher("ListApplied.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("ListApplied.jsp").forward(request, response);
            }
        }

    }

    public List<Apply> getListApply(String id, String title) {
        ApplyDAO dao = new ApplyDAO();
        return dao.searchApply(id, title);

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
        String searchCompany = request.getParameter("searchCompany");
        String postForCompany = request.getParameter("searchPost");
        if (searchCompany != null) {
            try {
                String txt = request.getParameter("searchC");
                searchListCompany(request, response, txt);
            } catch (Exception ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (postForCompany != null) {
            String searchC = request.getParameter("search");
            getCompany(request, response, searchC);
        } else {
            String textSearch = request.getParameter("searchQuery");

            String[] lo = request.getParameterValues("locations");
            String[] ma = request.getParameterValues("majors");
            String[] ty = request.getParameterValues("jobTypes");
            PostDAO dao1 = new PostDAO();
            List<Post> list2 = dao1.getAllPost();
            List<String> viewPost = new ArrayList<>();
            for (Post post : list2) {

                ViewPost vp = dao1.getViewPost(post.getId());
                if (vp != null) {
                    viewPost.add(vp.getViewPost() + "");
                } else {
                    viewPost.add("0");
                }
            }
            request.setAttribute("view", viewPost);
            int minSalary = 0;
            int maxSalary = 0;
            String filtter = Fillter(lo, ma, ty, minSalary, maxSalary, textSearch);
            request.removeAttribute("listqq");
            PostDAO dao = new PostDAO();
            List<Post> list = dao.getFillterSearch(filtter);
            request.setAttribute("listpost", list);
            request.setAttribute("listqq", list);
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
            getPost(request, response);
        }

        processRequest(request, response);
    }

    private void getCompany(HttpServletRequest request, HttpServletResponse response, String txt) {
        try {
            PostDAO daoa = new PostDAO();

            CompanyDAO dao = new CompanyDAO();

            String Idcompany = null;

            Cookie[] cookieid = request.getCookies();
            for (Cookie cookie : cookieid) {
                if (cookie.getName().equalsIgnoreCase("id")) {
                    Idcompany = cookie.getValue();
                }
            }
            Company a = dao.getUser(Idcompany);
            request.setAttribute("br", a);
            //phan trang 
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int count = daoa.getTotalPostNoDraftFind(Idcompany,txt);
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            List<Post> list = daoa.getAllPostByIdCompanyFinding(Idcompany, index, txt);
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

    private void searchListCompany(HttpServletRequest request, HttpServletResponse response, String txt) throws Exception {
        CompanyDAO dao = new CompanyDAO();
        List<Company> list = dao.searchCompany(txt);
        if (list != null) {
            request.setAttribute("listc", list);
            if (list.size() == 0) {
                request.setAttribute("fail", "Not found Company!");
            }
        } else {
            request.setAttribute("fail", "Not found Company!");
        }
        String Idemploy = null;
        Cookie[] cookieid = request.getCookies();
        for (Cookie cookie : cookieid) {
            if (cookie.getName().equalsIgnoreCase("id")) {
                Idemploy = cookie.getValue();
            }
        }
        if (Idemploy != null) {
            request.getRequestDispatcher("listCompanyEmployee.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("listCompanyGuest.jsp").forward(request, response);
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
            List<Post> list = dao.getAllPost();
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
            if (Idemploy != null) {
                request.getRequestDispatcher("HomeEmployee.jsp").
                        forward(request, response);
            } else {
                request.getRequestDispatcher("home.jsp").
                        forward(request, response);
            }

        } catch (ServletException | IOException ex) {
            System.out.println(ex);
        }
    }

    public String Fillter(String[] lo, String[] ma, String[] ty, int minSalary, int maxSalary, String search) {

        String fillter = "";
        if (lo != null) {
            for (int i = 0; i < lo.length; i++) {
                if (i < lo.length - 1) {
                    fillter += "p.location like N'%" + lo[i] + "%' OR ";
                } else {
                    fillter += "p.location like N'%" + lo[i] + "%'";
                }
            }
            if (ma != null) {
                fillter += " AND ";
            }
        }
        if (ma != null) {

            for (int i = 0; i < ma.length; i++) {
                if (i < ma.length - 1) {
                    fillter += "p.major like '%" + ma[i] + "%' OR ";
                } else {
                    fillter += "p.major like '%" + ma[i] + "%'";
                }
            }
            if (ty != null) {
                fillter += " AND ";
            }

        }

        if (ty != null) {

            for (int i = 0; i < ty.length; i++) {
                if (i < ty.length - 1) {
                    fillter += "p.jobTypes like '%" + ty[i] + "%' OR ";
                } else {
                    fillter += "p.jobTypes like '%" + ty[i] + "%'";
                }
            }
            if (search != null) {
                fillter += "AND";
            }
        }
        if (search != null) {
            fillter += "p.title like '%" + search + "%' OR "
                    + "p.description like '%" + search + "%'";
        }
        return fillter;
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
