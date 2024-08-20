<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
	<%
	
	
	String trainname=(String)session.getAttribute("trainname");
	String e1=(String)session.getAttribute("e1");
	String xxx=(String)session.getAttribute("xxx");
	
	String reverse=(String)session.getAttribute("reverse");
	session.setAttribute("reverse",reverse);
	try
	{		
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
		Statement stm1=con1.createStatement();
	ResultSet rs1=stm1.executeQuery(" SELECT * from  traintime where no='"+trainname+"' and endtime BETWEEN '"+xxx+"' AND '"+e1+"'   ");
		if(rs1.next())
		{
		String fair=rs1.getString("endtime");
		session.setAttribute("fair",fair);
		//String reverse="reverse";
	    
		response.sendRedirect("where1.jsp");
		}
		
		else
		{
		response.sendRedirect("where3.jsp");
		
		}
		
		
		}
		catch(Exception es)
		{
		out.println(es);
		}
		%>