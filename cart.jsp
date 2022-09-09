<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<html>
<HEAD>
    <TITLE>Cart</TITLE>
</HEAD>
<Body>
<br>
<h1> Cart Page <h1>
<%
        session = request.getSession();
        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>)session.getAttribute("orders");
        int val = 0;
        if(orders == null)
        {
%>
<h2> Cart is Empty!<h2>
<a href="http://localhost:8080/prac/index.html"><button>Buy Now</button></a>
<%
        return;
        }
        while (orders.size() > val) {
            int orderno = val + 1;
%>

            <br><br>
         <h4>   Order No: <%= orderno %> <h4>
         <h4>   Medicine: <%= orders.get(val)[0] %><br> <h4>
         <h4>   Quantitiy: <%= orders.get(val)[1] %><br> <h4>

<%
            val = val + 1;
            
            }
            
        
%>
<a href="http://localhost:8080/prac/index.html"><button>Buy More</button></a><br><br>
<form action = "checkout" method="post">
    <input type="submit" value="Checkout">
</form>

