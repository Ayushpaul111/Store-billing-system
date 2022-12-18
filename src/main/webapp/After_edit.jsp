<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EDIT SUCCESSFUL</title>
</head>
<body>

<%
String date,name,Email,Address,Mobile = null;
Statement stmt;
PreparedStatement update;
Connection con;
String url = "jdbc:mysql://localhost:3306/bill_system";
String uq = "UPDATE bill_master SET cust_name = ? , bill_date = ? , cust_address = ? , cust_mobile = ? , cust_email = ? WHERE bill_no = ?";

try{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	
	String s = request.getParameter("Bill_no");
	int bno = Integer.parseInt(s);
	name=request.getParameter("cust_name");
	Address=request.getParameter("Address");
	Mobile=request.getParameter("Mobile");
	Email=request.getParameter("Email");
	//date=request.getParameter("date");
	
	update = con.prepareStatement(uq);
	update.setString(1, name);
	update.setDate(2, java.sql.Date.valueOf(request.getParameter("date")));
	update.setString(3, Address);
	update.setString(4,Mobile);
	update.setString(5, Email);
	update.setInt(6, bno);
	update.executeUpdate();
	
	//stmt.executeUpdate("update bill_master set cust_name= '"+name+"'where bill_no ="+bno);
	//ResultSet rs= stmt.executeQuery("select * from Bill_master where bill_no = "+bno);
	
//	while(rs.next())
	//	out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getDate(3) + " " + rs.getString(4) + " " + rs.getString(5) + " " + rs.getString(6) + "    ");
		ResultSet rs= stmt.executeQuery("select * from Bill_master where bill_no = "+bno);
	
	while(rs.next())
	{
%>

<br>
<br>

<table border = "3" align="center">
<tr><th>Bill No:</th>
	<td><label for="Bill_no"></label>
	<%= rs.getInt(1)%></td>
</tr>
<tr><th>Name:</th>
	<td><label for="name"></label>
	<%= rs.getString(2)%></td>
</tr>
<tr><th>Bill Date:</th>
	<td><label for="date"></label>
	<%=  rs.getDate(3) %></td>
</tr>
<tr><th>Address:</th>
	<td><label for="Address"></label>
	<%= rs.getString(4)%></td>
</tr>
<tr><th>Mobile:</th>
	<td><label for="Mobile"></label>
	<%= rs.getString(5)%></td>
</tr>
<tr><th>Email:</th>
	<td><label for="Email"></label>
	<%= rs.getString(6) %></td>
</tr>
</table>



<% 	}


	

con.close();
}
catch(Exception ex){
	out.println(ex);
}

%>
<br>
<center>
<form action="Main.html">
	<input type="submit" value="MAIN MENU">
</form>
</center>


</body>
</html>