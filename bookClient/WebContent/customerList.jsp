<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "customer.Customers" %>
    <%@ page import = "org.json.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>List of Customers  <button onClick="window.location.reload();">Refresh Page</button></h1>
<table style="width:100%">
<tr>
                    <th ><h3>Customer name</h3></th>
                    <th ><h3>Customer id</h3></th>
</tr>
<%!
public void fromBooks(JspWriter out) throws IOException{
try {
	Customers ob=new Customers();
	String k=ob.getCustomers();
    JSONObject resp = new JSONObject(k);
    JSONArray items=resp.getJSONArray("contacts");
       try{  
           Class.forName("com.mysql.jdbc.Driver");  
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
           Statement stmt=con.createStatement();
           stmt.executeUpdate("TRUNCATE table customers");
            for (int i = 0; i < items.length(); i++) {
               JSONObject jsonobject = items.getJSONObject(i);
               String name = jsonobject.getString("contact_name");
               String id = jsonobject.getString("contact_id");
               String type=jsonobject.getString("contact_type");
               if(type.compareTo("customer")==0){
               long idl=Long. parseLong(id);
               out.println("<tr><td>"+name+"</td><td>"+idl+"</td></tr>");
               stmt.executeUpdate("INSERT INTO customers(id,name)values(\""+idl+"\",\""+name+"\")");
            	}
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
        ResultSet rs=stmt.executeQuery("select * from customers");
        while(rs.next()){
        	out.println("<tr><td>"+rs.getString("name")+"</td><td>"+rs.getLong("id")+"</td></tr>");
        }
	}catch(Exception e){
        System.out.print("Database denied connection"+e);
    }
	
}
%>
<%
try{  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/credentials","root","");  
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from customers");
    if(rs.next())
    	fromDB(out);
    else{
    	fromBooks(out);
    }   	
}
catch(Exception e){
System.out.println(e);	
}
%>
</table>
</body>
</html>