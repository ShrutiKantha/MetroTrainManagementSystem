<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>



<%
         int totalkm=0;
		 try
		{		
			Class.forName("com.mysql.jdbc.Driver");
			Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
		Statement s2=c2.createStatement();
		ResultSet rs2=s2.executeQuery("SELECT * from  trainstations");
		while(rs2.next())
		{
		String kmtotal=rs2.getString("distance");
		int km=Integer.parseInt(kmtotal);
		totalkm=totalkm+km;
		
        }
		}
		catch(Exception es)
		{
		out.println(es);
		}
		

//out.print(totalkm);
String reverse=(String)session.getAttribute("reverse");
out.print(reverse);
String not="not";

String e=(String)session.getAttribute("fair");
//request.getParameter("e");
out.print(e);
String e1=(String)session.getAttribute("e1");
out.print(e1);
		
 e=e.replace(":","");  
//out.print(e); 
 int i4=Integer.parseInt(e);
	//	out.print("__________");
	
e1=e1.replace(":","");  
//out.print(e1);  
		
int i5=Integer.parseInt(e1);
	int eee=i5-i4;
	out.print(eee);  
	
		
	
	

      if(eee>=0 && eee<=totalkm )
	 {
	  
	

		//int sno=1;
		out.print("RESULTS");
		int count=0;
	
		String stations=null;
		
		if(reverse.equals(not))
		{
				 
		try
		{		
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
		Statement stmn=conn.createStatement();
		ResultSet rsn=stmn.executeQuery(" SELECT * from  trainstations");
		while(rsn.next())
		{
		
		String disn=rsn.getString("distance");
		int sno=rsn.getInt("sno");
		
		int disn1=Integer.parseInt(disn);
				
		count=count+disn1;
		stations=rsn.getString("stations");
		
	
		if(eee<=count)
		{
		
		String revesenot="not";
		session.setAttribute("revese",revesenot);
				
		session.setAttribute("sno",sno);
		//out.print("notrevese");
		
		response.sendRedirect("where2.jsp");
		}
		
		
		}
		}
		catch(Exception es)
		{
		out.println(es);
		}
		
		
		
		
		
		
		}
		
		else
		{
		
		
		
		try
		{		
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
		Statement stmn=conn.createStatement();
		ResultSet rsn=stmn.executeQuery(" SELECT * from  trainstations ORDER BY sno DESC");
		while(rsn.next())
		{
		
		String disn=rsn.getString("distance");
		int sno=rsn.getInt("sno");
		
		int disn1=Integer.parseInt(disn);
		
		//int sno1=Integer.parseInt(sno);
		
		count=count+disn1;
		stations=rsn.getString("stations");
		
	
		if(eee<=count)
		{
				
		session.setAttribute("sno",sno);
		String revese="revese";
		session.setAttribute("revese",revese);

		//out.print("revese1");
		response.sendRedirect("where2.jsp");
		}
		
		
		}
		}
		catch(Exception es)
		{
		out.println(es);
		}
				
		}
				
		}
		
		else
		{
		response.sendRedirect("where3.jsp");
		}
			

		

		
		
		
		

%>


