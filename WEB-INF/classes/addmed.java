import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;

public class addmed extends HttpServlet {
    public void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();
        out.println("<html><body");
        out.println("<h1>Cart<h1>");
        String medicine = req.getParameter("medname");
        int quanity = Integer.valueOf(req.getParameter("quantity"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "root");

            String query = "INSERT INTO med(name, quantity) VALUES(?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, medicine);
            ps.setInt(2, quanity);

            int  rs = ps.executeUpdate();
            if(rs != 0)
            {
                res.sendRedirect("http://localhost:8080/prac/admin.jsp");
            }
            else{
                out.println("<h1>Error</h1>");
            }


        } catch (Exception e) {
            // out.println(e);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
