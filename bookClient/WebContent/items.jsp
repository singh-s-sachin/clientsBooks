<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "items.Item" %>
    <%@ page import = "org.json.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Items</title>
<link rel="stylesheet" href="a.css">
</head>
<body>
<div class="container">
<h2>Items</h2>
<table style="width:100%">
<tr>
                    <th ><h3>Product name</h3></th>
                    <th ><h3>Product id</h3></th>
</tr>
<%!
public void fromBooks(String k,JspWriter out) throws IOException{
try {
    JSONObject resp = new JSONObject(k);
    JSONArray items=resp.getJSONArray("items");
       try{  
           Class.forName("com.mysql.jdbc.Driver");  
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
           Statement stmt=con.createStatement();
           stmt.executeUpdate("TRUNCATE table items");
           stmt.executeUpdate("TRUNCATE table items");
            for (int i = 0; i < items.length(); i++) {
               JSONObject jsonobject = items.getJSONObject(i);
               String name = jsonobject.getString("name");
               String id = jsonobject.getString("item_id");
               long idl=Long. parseLong(id);
               out.println("<tr><td>"+name+"</td><td>"+idl+"</td></tr>");
               stmt.executeUpdate("INSERT INTO items(id,name)values(\""+idl+"\",\""+name+"\")");
               }
           }catch(Exception e){
               System.out.print("Database denied connection"+e);
           }
}catch (JSONException err){
    out.println("Error fetching the items");
}
}
public void fromDB(JspWriter out) throws IOException{
	try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from items");
        while(rs.next()){
        	out.println("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getLong("id")+"</td></tr>");
        }
	}catch(Exception e){
        System.out.print("Database denied connection"+e);
    }
	
}
%>
<% 
Item ob= new Item();
String name = request.getParameter("name");
String rate = request.getParameter("rate");
String desc = request.getParameter("desc");
String pt = request.getParameter("pt");
if(name!=null){
	ob.addItem(name, rate, desc, pt);
	String k=ob.getItems();
	fromBooks(k,out);
}
else{
try{  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from items");
    if(rs.next())
    	fromDB(out);
    else{
    	String k=ob.getItems();
    	fromBooks(k,out);
    }   	
}
catch(Exception e){
	
}
}
%>
</table>
<form action="items.jsp" method="post">
<div class="container">
<label for="name"><b>Name</b></label>
    <input type="text" placeholder="Enter name" name="name" required><br>
   <label for="rate"><b>Rate</b></label>
    <input type="text" placeholder="Enter rate" name="rate" required><br>
    <label for="desc"><b>Description</b></label>
    <input type="text" placeholder="Describe" name="desc" required><br>
    <label for="pt"><b>Product type</b></label>
    <input type="text" placeholder="Enter product type" name="pt" required><br>
<button>Add an item</button>
</div>
</form>
</div>
</body>
</html>