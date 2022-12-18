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


<h4 align="center"> <font size="20" >CONFIRM PARTICULARS</font></h4>


<% 
Statement stmt;
Connection con;
PreparedStatement update;
String url = "jdbc:mysql://localhost:3306/bill_system";
String uq = "INSERT INTO bill_details(bill_no, slno , particulars , qty , rate , amount)  VALUES (?, ? ,? ,? , ? ,?) ";

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(url,"root","adi123");
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	         ResultSet.CONCUR_READ_ONLY);
	
	
	ResultSet bmresultSet = stmt.executeQuery("select bill_no from bill_master");
	bmresultSet.last();
	int bno = bmresultSet.getInt(1);
	
	
	
	
	update = con.prepareStatement(uq);
	
	ResultSet i=stmt.executeQuery("SELECT COUNT(slno) from bill_details WHERE billno = "+bno);
	i.next();
	int x=i.getInt(1);
	
	
	for(int j=1;j<=x;j++)
	{
		String quant = "Quantity"+j;
		quant = request.getParameter(quant).toString();
		String parti = "particulars"+j;
		parti = request.getParameter(parti).toString();
		String ra  = "rate"+j;
		ra = request.getParameter(ra).toString();
		
		if(Integer.parseInt(quant) > 0)
		{
	
	
	
	update.setInt(1,bno);
	update.setInt(2,j);
	update.setString(3, parti);
	update.setInt(4,Integer.parseInt(quant));
	update.setInt(5,Integer.parseInt(ra));
	update.setInt(6,(Integer.parseInt(ra)*Integer.parseInt(quant)));
	
	
	update.executeUpdate();
	
	}
		
	}
	
	%>
	
	<form action="Display.jsp" method="post">
	<table border = "3" align="center">
		<tr><th>Particulars</th>
			<th>Quantity</th>
			<th>Rate</th>
			<th>Amount</th>
			
		</tr>
		<% 
		
		ResultSet rs = stmt.executeQuery("select * from bill_details WHERE billno = "+bno);
		
		while(rs.next())
	{
			
			%>
		<tr>
			<td><label for="particulars"></label>
			<input type="text" name="particulars" id="particulars" value="<%=rs.getString(3)%>"></td>
			
			<td><label for="Quantity"></label>
			<input type="number" name="Quantity" id="Quantity" value="<%=rs.getInt(4)%>"></td>
			
			<td><label for="rate"></label>
			<input type="number" name="rate" id="rate" value="<%=rs.getInt(5)%>"></td>
			
			<td><label for="Amount"></label>
			<input type="number" name="Amount" id="Amount" value="<%=rs.getInt(6)%>">
			</td>
		</tr>
		<% 
		
	}
		
		%>

		</table>
	<center>
<input type="submit">
<input type="reset" value="CLEAR">
<br>
</center>
	</form>
			
	<%
	
	
	
	con.close();
	}
		 catch(Exception ex){
			System.out.println(ex);
		}
%>



<br>
<br>
<center>
<form action="Main.html">
<input type="submit" value = "MAIN MENU">
</form>
</center>

</body>
</html>