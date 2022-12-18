<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VIEW INVENTORY</title>
</head>
<body>

<h1 align="center"> <font size="20" >VIEW INVENTORY</font></h1>

<%

Statement stmt;
PreparedStatement update;
Connection con;
String url = "jdbc:mysql://localhost:3306/bill_system";


try{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	
	ResultSet rs= stmt.executeQuery("select * from inventory");
	%>
	
	<br>
	<br>
	
	
	
	<style>
	table {
    border-collapse: separate;
    border-spacing: 0 1em;
    text-align: center;
    padding: 10px;
}
td,th {

    padding: .5em;
    padding: .5em;
}
	</style>
	
	
	
	<table border = "3" align="center">


<%
	while(rs.next())
		{
%>


	<tr><th>Item ID</th>
		<th>Items</th>
		<th>Quantity</th>
	</tr>
	
	<tr>
		<td><label for="Item_ID"></label>
		<%= rs.getInt(1)%></td>
			
		<td><label for="Items"></label>
		<%= rs.getString(2)%></td>
		
		<td><label for="Quantity"></label>
		<%=  rs.getInt(3) %></td>
	</tr>
	
	

<% 	}

	
con.close();
}
catch(Exception ex){
	out.println(ex);
}
%>


</table>


<br>
<center>
<form action="Main.html">
	<input type="submit" value="MAIN MENU">
</form>


</center>
</body>
</html>