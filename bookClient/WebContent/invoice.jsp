<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invoicing</title>
<h2>Generate invoice</h2>
<link rel="stylesheet" href="a.css">
</head>
<body>
<form action="generate.jsp" method="post">
<div class="container">
<label for="cid"><b>Customer ID</b></label>
    <input type="text" placeholder="Enter Customer_id" name="cid" required><br>

    <label for="csc"><b>Item ID's</b></label>
    <input type="text" placeholder="Enter item_id,quantity for each item where, items are seperated by comma( ; )." name="id" required><br>
    <button type="submit">Create invoice</button><br>
</div>
</form>
</body>
</html>