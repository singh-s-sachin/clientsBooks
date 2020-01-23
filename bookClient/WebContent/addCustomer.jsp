<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "customer.Customers" %>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="a.css">
</head>
<body>
<h1>Add customer</h1>
<%
String fn = request.getParameter("fn");
String ln = request.getParameter("ln");
String mail = request.getParameter("mail");
if(fn!=null){
	fn+=" "+ln;
	Customers cust=new Customers();
	cust.addCustomers(fn);
	try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
        Statement stmt=con.createStatement();
        stmt.executeUpdate("TRUNCATE table customers");
	}
	catch(Exception e){
		out.println(e);
	}
}
%>
<form action="addCustomer.jsp" method="post">
<div class="container">
    <label for="fn"><b>First name</b></label>
    <input type="text" placeholder="Enter first name" name="fn" required><br>

    <label for="ln"><b>Last name</b></label>
    <input type="text" placeholder="Enter last name" name="ln" required><br>

	<label for="mail"><b>Email</b></label><br>
    <input type="text" placeholder="Enter email" name="mail" required><br>
    <button type="submit">Add customer</button><br>
</div>
</form>
</body>
</html>