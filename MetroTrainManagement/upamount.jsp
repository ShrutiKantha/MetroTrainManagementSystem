<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.util.date.*,java.util.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
String a=request.getParameter("name");

int mid1=1;

try
{
Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("update amount set amount='"+a+"' where no='"+mid1+"'");
ps.executeUpdate();
response.sendRedirect("alogin.jsp");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}
%>
</body>
</html>
