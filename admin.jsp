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
<%= session %>
    <table style="min-width:1240px">
        <tr>
            <th>Order Id</th>
            <th>Medicine</th>
            <th>Quantity</th>
            <th>Username</th>
        </tr>
<%
    int total=0;
    while (rs.next()) {
                String medicine = rs.getString("medicine");
                Int q = rs.getInt("quantity");
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
    rs.next();
    int cpu1 = (rs.getInt("cpu"));
    int gpu1 = (rs.getInt("gpu"));
    rs.previous();
%>
    <tr>
        <th><%=cpu1%></th>
        <th><%=gpu1%></th>
        <th><%=hdd1%></th>
        <th><%=ram1%></th>
        <th><%=body1%></th>
        <th><%=display1%></th>
    </table>
            <h1>Change Order Status<h1>
            <form action=changestatus action=post><input type=text name=orderid placeholder="Order id"><input type=text
                    name=status placeholder="New status"><input type=submit value="Change Status"></form><br>
             <h1>Complete Order<h1>
            <form action=completeorder action=post><input type=text name=orderid placeholder="Order id">
                <input type=submit value="Change Status"></form><br>
            <h1>Search user<h1>
            <form action="searchuser.jsp" action=post><input type=text name=userid placeholder="Enter User id"><input
                    type=submit value="Search"></form><br>
            <h1>Delete Order<h1>
                    <form action=deleteorder action=post><input type=text name=orderid placeholder="Enter order
                            id"><input type=submit value="Delete"></form>
            
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