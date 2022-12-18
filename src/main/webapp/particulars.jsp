<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PARTICULARS</title>
</head>
<body>


<h4 align="center"> <font size="20" >PARTICULARS</font></h4>


<% 
Statement stmt;
Connection con;
PreparedStatement update;
String url = "jdbc:mysql://localhost:3306/bill_system";
String uq = "INSERT INTO bill_details (billno,slno,particulars,qty,rate,amount) values (?,?,?,?,?,?)";

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	
	update = con.prepareStatement(uq);
	
	ResultSet bmresultSet = stmt.executeQuery("select bill_no from bill_master");
	bmresultSet.last();
	int bno = bmresultSet.getInt(1);
	bmresultSet.close();
	
	
	ResultSet rs = stmt.executeQuery("select * from particular_master_data");
	%>
	
	<form action="After_particulars.jsp" method="post">
	<table border = "3" align="center">
		<tr><th>Particulars</th>
			<th>Quantity</th>
			<th>Rate</th>
			
		</tr>
		<% 
		int i=1;
		while(rs.next())
	{
	%>
		<tr>
			<td><label for="particulars"></label>
			<input type="text" name="particulars<%=i%>" id="particulars<%=i%>" value="<%=rs.getString(1)%>" readonly></td>
			<td><label for="Quantity"></label>
			<input type="number" name="Quantity<%=i%>" id="Quantity<%=i%>" value="0" min="0"></td>
			<td><label for="rate"></label>
			<input type="number" name="rate<%=i%>" id="rate<%=i%>" value="<%=rs.getInt(2)%>"></td>
		</tr>
		<% 
		i++;
	}
		
		
		%>
	</table>
	
			
	
	<%
	
	
	
	con.close();
	}
		 catch(Exception ex){
			System.out.println(ex);
		}
%>

<br>
	
	</form>


<br>
<br>
<center>
<form action="Main.html">
<input type="submit" value = "MAIN MENU">
</form>
</center>

</body>
</html>