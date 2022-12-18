<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SEARCH PAGE</title>
</head>
<body>
<h4 align="center"> <font size="20">EDIT BILL</font></h4>
<form action="Edit_page.jsp" method="get">
<table border = "3" align = "center">
	<tr><th>Bill No:</th>
	<td><label for="Bill_no"></label>
		<input type="number" id="Bill_no" name="Bill_no" value="0" required></td></tr>
	<tr></tr>
	<tr><td><input type="submit" value="SUBMIT"></td></tr>

</table>
</form>

<%

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
	
	ResultSet bmresultSet = stmt.executeQuery("select bill_no from bill_master");
	bmresultSet.last();
	
	String s = request.getParameter("Bill_no");
	if(s==null)
	{
	}
	else
	{
		if(s.length()== 0)
		{
		}
		else{
			int bno = Integer.parseInt(s);
	ResultSet rs= stmt.executeQuery("select * from Bill_master where bill_no = "+bno);
	
	while(rs.next())
		{
%>

<br>
<br>
<form action="After_edit.jsp" method="post">
<table border = "3" align="center">
	<tr><th>Bill No:</th>
		<td><label for="Bill_no"></label>
		<input type="number" id="Bill_no" name="Bill_no" value="<%= rs.getInt(1)%>" readonly></td>
	</tr>
	<tr><th>Name:</th>
		<td><label for="name"></label>
		<input type="text" name="cust_name" value="<%= rs.getString(2)%>"></td>
	</tr>
	<tr><th>Bill Date:</th>
		<td><label for="date"></label>
		<input type="date" name="date" value="<%=  rs.getDate(3) %>"></td>
	</tr>
	<tr><th>Address:</th>
		<td><label for="Address"></label>
		<textarea name="Address" rows="3" cols="40"><%= rs.getString(4)%></textarea></td>
	</tr>
	<tr><th>Mobile:</th>
		<td><label for="Mobile"></label>
		<input type="tel" name="Mobile" maxlength ="10" value="<%= rs.getString(5)%>"></td>
	</tr>
	<tr><th>Email:</th>
		<td><label for="Email"></label>
		<input type="email" name="Email" value="<%= rs.getString(6) %>"></td>
	</tr>
</table>
<center>
<br>
<input type="submit">
<input type="reset" value="CLEAR">
<br>
</center>
</form>


<% 	}
	}}
	
	
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