<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "token.Token" %>
    <%@ page import = "item.*" %>

 <% Token t=new Token();
	out.println(t.setup("1000.QNT0DCUTG3E0BANNF6CA27BDMZCO8H","ebeb94b2a626c736092a2df14ea111b822ce5daed7","1000.3fe69c391f06756a30b93ec4f21be0d5.15bdad57571441d34967c0324cd87f9b","https://www.google.com","703797559"));
      out.println(t.getToken());
      %>--%>
 <html>
    <head>
        <title>Invoice | Zoho Books | UK</title>
        <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "token.Token" %>
    
<link rel="stylesheet" href="a.css">
    </head>
    <body >
        <%
        	Token t=new Token();
       		t.resetSetup();
            String cid = request.getParameter("cid");
            String uri = request.getParameter("uri");
            String rt = request.getParameter("rt");
            String csc = request.getParameter("csc");
            String org_id = request.getParameter("oid");
            String oAuth=t.setup(cid, csc, rt, uri, org_id);
        %>
        <div class="container">
        <h1>Zoho Invoice</h1>
        <iframe src="invoice.jsp" width="64%" height="38%"></iframe>
        <iframe src="items.jsp" width="35%" height="100%" align="right"></iframe>
        <iframe src="customer.html" width="64%" height="61%"></iframe>
        <a href="index.html"><button>Log off</button></a></div>
    </body>
</html>