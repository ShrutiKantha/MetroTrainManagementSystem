<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>

 <%
 
 
 String d1=(String)session.getAttribute("d1");
  //out.print(d1);
 int distance=Integer.parseInt(d1);
 
 String time=(String)session.getAttribute("time");
  //out.print(time);
session.setAttribute("time",time);

String traintime=request.getQueryString();
 //out.print(traintime);
 
int count1=1;

if(count1!=distance)

{

        int start=1;
        int count=0;

        try
		{		
                        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
		Statement stm1=con1.createStatement();
		ResultSet rs1=stm1.executeQuery("select distance from trainstations where sno BETWEEN '"+start+"' AND '"+d1+"' ");
		while(rs1.next())
		{
		String tims=rs1.getString(1);
		int dis=Integer.parseInt(tims);
		
		count=count+dis;
	
		

        }
	
			
Date date = new SimpleDateFormat("hh:mm").parse(traintime);
String a2= new SimpleDateFormat("hh:mm aa").format(date);

String a3= new SimpleDateFormat("mm").format(date);
String a4= new SimpleDateFormat("hh").format(date);
int i4=Integer.parseInt(a4);
String aaa= new SimpleDateFormat("aa").format(date);
int i3=Integer.parseInt(a3);
int result=i3+count;
if(result>=60)
{
i4=i4+1;
result=result-60;
String reee = String.valueOf(result);
String expecttime=i4+":"+reee+aaa;
out.print(expecttime);
session.setAttribute("expecttime",expecttime);
response.sendRedirect("present2.jsp");
}
else
{

String reee = String.valueOf(result);
String expecttime=a4+":"+reee+aaa;
//out.print(expecttime);

session.setAttribute("expecttime",expecttime);
response.sendRedirect("present2.jsp");
}
			
	
        }
       catch(Exception e)
        {
        out.println(e);
        }

 
 
 
 
 }
 else
 {
 
 
 
 

Date date = new SimpleDateFormat("hh:mm").parse(traintime);
String expecttime= new SimpleDateFormat("hh:mm aa").format(date);
session.setAttribute("expecttime",expecttime);
 
  //out.println(expecttime);

 response.sendRedirect("present2.jsp");
 // out.println("Distance single");
 }
 
 
 

 
 
 
 
 
 
 
 
 %>