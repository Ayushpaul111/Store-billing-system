<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EDIT INVENTORY</title>
</head>
<body>

<h1 align="center"> <font size="20" >VIEW INVENTORY</font></h1>

<%

Statement stmt;
PreparedStatement update;
Connection con;
String url = "jdbc:mysql://localhost:3306/bill_system";



try{
	int count=0;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	
	
	//ResultSet c= stmt.executeQuery("select ItemID from inventory");
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
	
	
	<form action="After_invedit.jsp" method="post">	
	<table border = "3" align="center">

	<tr><th>Item ID</th>
		<th>Items</th>
		<th>Quantity</th>
	</tr>


<%
	
	
	
	ResultSet rs= stmt.executeQuery("select * from inventory");
	int i=0;
	
	
	while(rs.next())
		{
		
%>


	<tr>
		<td><label for="Item_ID"></label>
		<input type="number" id="Item_ID<%=rs.getInt(1)%>" name="Item_ID" value="<%= rs.getInt(1)%>" readonly></td>
			
		<td><label for="Items"></label>
		<input type="text" id ="Items<%=rs.getInt(1)%>" name="Items" value="<%= rs.getString(2)%>"></td>
		
		<td><label for="Quantity"></label>
		<input type="number" id="Quantity<%=rs.getInt(1)%>" name="Quantity" value="<%=  rs.getInt(3) %>"></td>
	</tr>
	
	

<% 	}
		
	
con.close();
}
catch(Exception ex){
	out.println(ex);
}
%>


</table>
<center>
<input type="submit">
<input type="reset" value="CLEAR">
<br>
</center>

</form>


<br>
<center>
<form action="Main.html">
	<input type="submit" value="MAIN MENU">
</form>


</center>
</body>
</html>