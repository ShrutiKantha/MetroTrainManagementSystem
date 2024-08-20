<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="Container"> 
<div id="header_"> &nbsp; 

<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/h.png" width="520" height="50"></div>


  <ul class="navi">
    <li><a href="userfront.jsp"><font size="+1" color="#00FF33">Home</font> </a></li>
    <li><a href="routemap.jsp"><font size="+1" color="#FFFF33">Maps</font> </a></li>
    <li><a href="fair.jsp"><font size="+1" color="#FF0000">Fairs</font> </a></li>
    <li><a href="timing.jsp"><font size="+1" color="#0000FF">Timings</font> </a></li>
    <li><a href="ticket.jsp"><font size="+1" color="#FFFFFF">Tickets</font> </a></li>
    <li><a href="index.html"><font size="+1" color="#0000FF">Logout</font> </a></li>
  </ul>
</div>
  <div id="left_"> 
    <h2>latest events</h2>
    <p><span>Next Year</span> The Metro Train will start on coming Next Year in chennai. </p>
    <p>&nbsp;</p>
    <p>The Chennai Metro Rail is an upcoming rapid transit system in Chennai, Tamil Nadu, India. The Phase I of the project consisting of two corridors covering a length of 45.1 km is under construction. The elevated section of the project is scheduled to be operational by 2013 and the entire project is scheduled to be completed by the financial year 2014-2015. About 55% of the corridors in Phase I is underground and the remaining is elevated.</p>
    
  </div>
  <div id="right_"> 
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Find Travelling Fair</h2>
	<table width="400" bgcolor="#FFCC66" align="center" height="200">
	<tr><td colspan="2" height="60"></td></tr>
	

 <%
 
 
 String d1=(String)session.getAttribute("d1");
 out.print(d1);
 int distance=Integer.parseInt(d1);
 String fair=request.getParameter("fair");
//out.print(fair);






int start=0;


        try
		{		
		Connection con1=databasecon.getconnection();
		Statement stm1=con1.createStatement();
		ResultSet rs1=stm1.executeQuery("select distance from trainstations where station BETWEEN '"+start+"' AND '"+d1+"' ");
		while(rs1.next())
		{
		String tims=rs1.getString(1);
		
		

        }
        }
       catch(Exception e)
        {
        out.println(e);
        }

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 String traintime=request.getQueryString();
 out.print(traintime);
 
 
  Date date = new Date();
   out.print( "<h2 align=\"center\">" +date.toString()+"</h2>");
 
 
 
 
 Date date = new SimpleDateFormat("HH:mm").parse(traintime);
String a2= new SimpleDateFormat("HH:mm").format(date);
//out.print(a2);
String a3= new SimpleDateFormat("mm").format(date);
//out.print(a3);
String a4= new SimpleDateFormat("HH").format(date);
//out.print(a4);
int i4=Integer.parseInt(a4);
int i3=Integer.parseInt(a3);



int result=i3+distance;







if(result>=60)
{
i4=i4+1;
result=result-60;
String re = String.valueOf(i3);
String x=i4+":"+re;
SimpleDateFormat inFormat11 = new SimpleDateFormat("hh:mm");
SimpleDateFormat outFormat11 = new SimpleDateFormat("HH:mm");
String ti24 = outFormat11.format(inFormat11.parse(x));
}
else
{

String rme = String.valueOf(result);
//out.print(reee);

String x1=a4+":"+rme;
//out.print(x1);

SimpleDateFormat inFormat2 = new SimpleDateFormat("hh:mm");
SimpleDateFormat outFormat2 = new SimpleDateFormat("HH:mm");
String ti24 = outFormat2.format(inFormat2.parse(x1));
out.print(ti24);
}

		
	
		
	
		
	  %>
	  <tr><td height="100"></td><td height="100"></td></tr>
	  </table>
  </div>
  <div id="footer1_"> &nbsp;</div>
  
  
  
  
<div align=center></div></body>
</html>
