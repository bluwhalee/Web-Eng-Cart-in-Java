<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Online Pharmacy</h1>

<%        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement s = con.createStatement();
            String query = "select * from med" ;
            ResultSet rs = s.executeQuery(query); 
            while (rs.next()) {
                String med = rs.getString("name");
%>   
        
            <h3><%=med%></h3>
            <form action="cart" method="post">
                <input type="hidden" name="medicine" value=<%=med%>>
                <input type="number" name="quantity" placeholder="Quantity">
                <input type="submit" value="Add to Cart">
            </form>
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
%>
        
</body>
</html>