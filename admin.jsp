<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>

<html>
<HEAD>
    <TITLE>Admin dash </TITLE>
</HEAD>
<Body >
<br>

<%        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement s = con.createStatement();
            String query = "select * from orders" ;
            ResultSet rs = s.executeQuery(query); 
%>
<h2>Orders<h2>
    <table style="min-width:1240px">
        <tr>
            <th>Order Id</th>
            <th>Medicine</th>
            <th>Quantity</th>
            <th>Username</th>
        </tr>
<%
    
    while (rs.next()) {
                String medicine = rs.getString("medicine");
                int q = rs.getInt("quantity");
                String username = rs.getString("username");
                int orderid  = rs.getInt("orderid");

%>
    <tr>
        <th><%=orderid%></th>
        <th><%=medicine%></th>
        <th><%=q%></th>
        <th><%=username%></th>
        
    </tr>
<% } %>
</table><br><br>

<h2>Inventory<h2><br>
<table>
        <tr>
            <th>Medicine</th>
            <th>Quantity</th>
        </tr>
<%
    
     query = "select * from med" ;
     rs = s.executeQuery(query);
    while(rs.next()){
    String med = rs.getString("name");
    int quantity = rs.getInt("quantity");
    
%>
    <tr>
        <th><%=med%></th>
        <th><%=quantity%></th>
    </tr>
<%
    }
%>
    </table>
            <h1>Add Medicine<h1>
            <form action="addmed" action="post">
                <input type=text name=medname placeholder="Medicine Name">
                <input type=text name=quantity placeholder="quantity">
                <input type=submit value="Add">
            </form><br>
             
             
</body>
<%

    }
    catch(Exception e)
    {
        out.println(e);
    }
    finally {
        out.println("</body>");
        out.println("<html>");
        out.close();
    }

%>




</body> 
</html>