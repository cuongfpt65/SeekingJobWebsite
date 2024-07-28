/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filter;

import jakarta.servlet.AsyncContext;
import jakarta.servlet.DispatcherType;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpUpgradeHandler;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
@WebFilter("/*")

public class LoginFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public LoginFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String uri = httpRequest.getRequestURI();

        // Kiểm tra nếu file JSP tồn tại hay không
        if (uri.endsWith(".jsp") && httpRequest.getServletContext().getResource(uri) == null) {
            // Chuyển hướng về trang chủ nếu file JSP không tồn tại
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Home");
            return;
        } else {
            String Idemploy = null;
            Cookie[] cookieid = httpRequest.getCookies();

            if (cookieid != null) {
                for (Cookie cookie : cookieid) {
                    if (cookie.getName().equalsIgnoreCase("id")) {
                        Idemploy = cookie.getValue();
                        break;
                    }
                }
            }

            if (Idemploy == null && uri.endsWith(".jsp")) {
                if (!(uri.endsWith("AboutUs.jsp") || uri.endsWith("Contact.jsp")
                        || uri.endsWith("DetailCompanyForEmployeeGuest.jsp") || uri.endsWith("listCompanyGuest.jsp")
                        || uri.endsWith("DetailPostGuest.jsp") || uri.endsWith("home.jsp"))) {
                    httpRequest.getRequestDispatcher("/Login.jsp").forward(httpRequest, httpResponse);
                    return;
                }
            } else if (Idemploy != null && Idemploy.contains("E") && uri.endsWith(".jsp")) {
                if (!(uri.endsWith("AboutUsEmployee.jsp") || uri.endsWith("AddPost1.jsp")
                        || uri.endsWith("ApplyHistory.jsp") || uri.endsWith("ContactEmployee.jsp")
                        || uri.endsWith("DetailCompanyForEmployee.jsp") || uri.endsWith("DetailPostEmployee.jsp")
                        || uri.endsWith("DetailEmployee.jsp") || uri.endsWith("HomeEmployee.jsp")
                        || uri.endsWith("ListCompany.jsp") || uri.endsWith("Otp.jsp")
                        || uri.endsWith("cvList.jsp") || uri.endsWith("editCV.jsp")
                        || uri.endsWith("editProfile.jsp") || uri.endsWith("emailCode.jsp")
                        || uri.endsWith("employeeDetail.jsp") || uri.endsWith("employeeProfile.jsp")
                        || uri.endsWith("employeePro.jsp") || uri.endsWith("listCompanyEmployee.jsp")
                        || uri.endsWith("uploadCV.jsp"))) {

                    httpRequest.getRequestDispatcher("/Home").forward(httpRequest, httpResponse);
                    return;
                }
            } else if (Idemploy != null && Idemploy.contains("C") && uri.endsWith(".jsp")) {
                if (!(uri.endsWith("AboutUsCompany.jsp") || uri.endsWith("AddPost1.jsp")
                        || uri.endsWith("ContactCompany.jsp") || uri.endsWith("DetailCompanyForCompany.jsp")
                        || uri.endsWith("DetailDraftPostCompany.jsp") || uri.endsWith("DetailPostCompany.jsp")
                        || uri.endsWith("DraftPost.jsp") || uri.endsWith("HomeCompany.jsp")
                        || uri.endsWith("ListCompany.jsp") || uri.endsWith("List.jsp")
                        || uri.endsWith("Otp.jsp") || uri.endsWith("editProfileCom.jsp")
                        || uri.endsWith("emailCode.jsp") || uri.endsWith("employeeDetail.jsp")
                        || uri.endsWith("employeeProfile.jsp") || uri.endsWith("postDetails.jsp")
                        || uri.endsWith("postDetailsDraft.jsp") || uri.endsWith("staticCompany.jsp")
                        || uri.endsWith("update.jsp") || uri.endsWith("updatePost.jsp")
                        || uri.endsWith("updatePostDraft.jsp"))) {
                    httpRequest.getRequestDispatcher("/Home").forward(httpRequest, httpResponse);
                    return;
                }
            } else if (Idemploy != null && Idemploy.contains("A") && uri.endsWith(".jsp")) {
        if (!(uri.endsWith("CompanyManagement.jsp") || uri.endsWith("EmployeeManagement.jsp") || 
              uri.endsWith("HomeAdmin.jsp") || uri.endsWith("PostManagement.jsp") || 
              uri.endsWith("staticAdmin.jsp"))) {
            httpRequest.getRequestDispatcher("/Login.jsp").forward(httpRequest, httpResponse);
            return;
        }
    }
        }

            // Nếu đã đăng nhập, tiếp tục chuỗi filter/servlet
            chain.doFilter(request, response);

            if (debug) {
                log("LoginFilter:doFilter()");
            }

            Throwable problem = null;
            try {
                chain.doFilter(request, response);
            } catch (Throwable t) {
                // If an exception is thrown somewhere down the filter chain,
                // we still want to execute our after processing, and then
                // rethrow the problem after that.
                problem = t;
                t.printStackTrace();
            }

            doAfterProcessing(request, response);

            // If there was a problem, we want to rethrow it if it is
            // a known type, otherwise log it.
            if (problem != null) {
                if (problem instanceof ServletException) {
                    throw (ServletException) problem;
                }
                if (problem instanceof IOException) {
                    throw (IOException) problem;
                }
                sendProcessingError(problem, response);
            }
        }
        /**
         * Return the filter configuration object for this filter.
         */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("LoginFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("LoginFilter()");
        }
        StringBuffer sb = new StringBuffer("LoginFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
