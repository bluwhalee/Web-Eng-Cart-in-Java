import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;

public class cart extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();
        out.println("<html><body");
        out.println("<h1>Cart<h1>");
        String medicine = req.getParameter("medicine");
        int quanity = Integer.valueOf(req.getParameter("quantity"));

        try {
            HttpSession session = req.getSession();
            List<String[]> cartitems = new ArrayList<String[]>();
            if (session.getAttribute("orders") != null) {
                cartitems = (List<String[]>) session.getAttribute("orders");

            }
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "root");

            String query = "select * from med where name=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, medicine);

            ResultSet rs = ps.executeQuery();
            rs.next();
            int val = 0;
            int b = 0;
            while (cartitems.size() > val) {

                if ((cartitems.get(val)[0].equals(medicine))) {

                    int q = Integer.parseInt(cartitems.get(val)[1]);
                    q = q + quanity;
                    quanity = q;
                    cartitems.remove(val);

                    val = cartitems.size() + 5;
                }

            }

            if (quanity <= (rs.getInt("quantity"))) {

                cartitems.add(new String[] { medicine, (Integer.toString(quanity)) });
                session.setAttribute("orders", cartitems);
                res.sendRedirect("http://localhost:8080/prac/cart.jsp");
            }

        } catch (Exception e) {
            // out.println(e);
        }

    }
}
