<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import = "invoice.Invoice" %>
        <%@ page import = "org.json.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="a.css">
<title>Confirm</title>
</head>
<body>
<%
Invoice ob=new Invoice();
String cid = request.getParameter("cid");
long fcid = Long.parseLong(cid);
String id = request.getParameter("id");
String[] item = id.split(";", 10);
try{
out.println("<h2>Confirmation</h2>");
out.println("<b>Customer id : "+fcid+"</b>");
out.println("<table><tr><th>Product</th><th>Quantity</th><tr>");
for(String a:item){
	a=a.replaceAll("\\s", "");
	System.out.println(a);
	String k[]=a.split(",",2);
	double t=Double.parseDouble(k[1]);
	out.println("<tr><td>"+k[0]+"</th><th>"+t+"</td><tr>");
	ob.addItems(k[0],t);
}
String resp=ob.generateInvoice(fcid);
try {
    JSONObject res = new JSONObject(resp);
    JSONObject inv=res.getJSONObject("invoice");
    String invid = inv.getString("invoice_id");
    invid=ob.getInvoice(invid);
    out.println("<br><b>Invoice downloaded:</b><br>"+invid);
}
catch(Exception e1){
	out.println("Error downloading pdf.");
}
out.println("<a href='invoice.jsp'><button>Done</button></a>");
}
catch(Exception e){
	out.println("Check the items format and try again");
}
%>
</body>
</html>