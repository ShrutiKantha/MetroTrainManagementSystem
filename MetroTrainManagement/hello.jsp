<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<%


int sno=(Integer)session.getAttribute("sno");
out.print(sno);


int correct=sno-1;


try
		{		
		Connection con=databasecon.getconnection();
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery(" SELECT * from  trainstations where sno='"+correct+"'");
		while(rs.next())
		{
		String e=rs.getString("stations");
		out.print(e);
		}
		}
		catch(Exception es)
		{
		out.println(es);
		}




%>
</body>
</html>
