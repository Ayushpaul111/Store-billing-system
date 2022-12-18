<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BILLING SYSTEM</title>
</head>
<body>
<body>

<% 
Statement stmt;
Connection con;
String url = "jdbc:mysql://localhost:3306/bill_system";
try{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	ResultSet bmresultSet = stmt.executeQuery("select bill_no from bill_master");
	bmresultSet.last();
	int bno = bmresultSet.getInt(1);
	
%>
<h4 align="center"> <font size="20" >BILLING SYSTEM</font></h4>
<form action="After_input.jsp" method="post">
<table border = "3" align="center">
	<tr><th>Bill No:</th>
		<td><label for="Bill_no"></label>
		<%= bno %></td>
	</tr>
	<tr><th>Name:</th>
		<td><label for="name"></label>
		<input type="text" id="name" name="cust_name"></td>
	</tr>
	<tr><th>Bill Date:</th>
		<td><label for="date"></label>
		<input type="date" id="date" name="date"></td>
	</tr>
	<tr><th>Address:</th>
		<td><label for="Address"></label>
		<textarea id="Address" name="Address" rows="3" cols="40"></textarea></td>
	</tr>
	<tr><th>Mobile:</th>
		<td><label for="Mobile"></label>
		<input type="tel" id="Mobile" name="Mobile" maxlength="10"></td>
	</tr>
	<tr><th>Email:</th>
		<td><label for="Email"></label>
		<input type="email" id="Email" name="Email"></td>
	</tr>
</table>
<center>
<br>
<input type="submit">
<input type="reset" value="CLEAR">
<br>
</center>
</form>
<br>

<%
	
con.close();
}
	 catch(Exception ex){
		System.out.println(ex);
	}


	
	
%>
<center>
<form action="Main.html">
<input type="submit" value = "MAIN MENU">
</form>
</center>

</body>
</html>