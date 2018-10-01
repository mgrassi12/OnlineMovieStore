package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head class = \"header\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>New User Registration</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"blockbuster.css\">\n");
      out.write("        <img src=\"blockbuster_logo.png\" alt=\"Blockbuster Logo\" class=\"logo\">\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body class = \"body\">\n");
      out.write("        <h1>Register</h1>\n");
      out.write("        <!-- needs to post to main.jsp, not account -->\n");
      out.write("        <form action=\"main.jsp\" method=\"post\">\n");
      out.write("            <table>\n");
      out.write("                <tr><td>Full Name</td><td><input size=\"32\" type=\"text\" name=\"name\"></td></tr>\n");
      out.write("                <tr><td>Email</td><td><input size=\"32\" type=\"email\" name=\"email\"></td></tr>\n");
      out.write("                <tr><td>Password</td><td><input size=\"32\" type=\"password\" name=\"password\"></td></tr>\n");
      out.write("                <tr><td>Phone Number</td><td><input size=\"16\" type=\"tel\" name=\"phone\"></td></tr>\n");
      out.write("                <tr><td>Address</td><td><input size=\"128\" type=\"text\" name=\"address\"></td></tr>\n");
      out.write("                <tr><td></td><td><input type=\"submit\" value=\"Register\"> </td></tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
