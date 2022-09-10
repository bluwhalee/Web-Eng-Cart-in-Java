import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class checkout extends HttpServlet {
    orderDAO oa = orderDAO.getOD();

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + "Checkout Page" + "</h1>");
        HttpSession session = request.getSession();

        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>) session.getAttribute("orders");
        if (orders == null) {
            out.println("<h2> Cart is Empty!<h2><a href=" + "http://localhost:8080/prac/index.html"
                    + "><button>Buy Now</button></a>");
        }

        int val = 0;
        while (orders.size() > val) {
            int orderno = val + 1;
            out.println("<br><br>");
            out.println("Order No: " + orderno + "<br>");
            out.println("Medicine: " + orders.get(val)[0] + "<br>");
            out.println("Quantity: " + orders.get(val)[1] + "<br>");
            oa.addorder(orders.get(val)[0], Integer.parseInt(orders.get(val)[1]), "zarrar");
            val = val + 1;
        }
        out.println("<h2> Order Succsesfull<h2>");
        out.println("<a href=" + "http://localhost:8080/prac/index.html" + "><button>Buy More<button></a>");

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
