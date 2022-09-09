import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;

public class login1 extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/rsm";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement s = con.createStatement();
            String query = "select * from profile where username='" + id + "' AND password='" + pass + "'";
            ResultSet rs = s.executeQuery(query);

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("login", 1);
                res.sendRedirect("http://localhost:8080/prac/login.jsp");
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("login", 0);
                res.sendRedirect("http://localhost:8080/prac/login.jsp");
            }

        } catch (Exception e) {
            // out.println(e);
        }

    }
}
