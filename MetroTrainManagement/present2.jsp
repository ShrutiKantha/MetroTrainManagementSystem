<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>



<script type="text/javascript">
function reg()
{
var d=document.f2.fair.value;
if(document.f2.fair.selectedIndex==0)
{
alert("Select Syarting Point");
return false;
}



var e=document.f2.fair1.value;
if(document.f2.fair1.selectedIndex==0)
{
alert("Select Ending Point");
return false;
}

	if(d==e)
	{
	alert ("Select Correct Distance");
	//document.f2.fair1.select();
	return false;
	}
	

}

</script>





<body>
<div id="Container"> 
  <div id="header_"> &nbsp; 
  
  
  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/h.png" width="520" height="50"></div>
  
    
  <ul class="navi">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li><a href="userfront.jsp"><font size="+1" color="#00FF33">Home</font> </a></li>
    <li><a href="present.jsp"><font size="+1" color="#FFFF33">Back</font> </a></li>
    <li><a href="index.html"><font size="+1" color="#0000FF">Logout</font> </a></li>
    <li></li>
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
	Except Time To Travel</h2>
	<table width="400" bgcolor="#FFCC66" align="center" height="200">
	<tr><td colspan="2" height="60"></td></tr>
	

 <%
 
 
 

  
 
Connection con10=null;
Statement st10=null;
ResultSet rs10=null;
String ff=null;
try
{
  Connection con10 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
  st10=con10.createStatement();
rs10=st10.executeQuery("select max(sno) from presnttime");
while(rs10.next())
{
 ff=rs10.getString(1);
// out.print(ff);
}
}
catch(Exception e)
{
out.println(e.getMessage());
}
	
 
 
 
 
 
 
 
 
 
 
 
 
String ExpectTime=(String)session.getAttribute("expecttime");
 


try

{		
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
  Statement stm=con.createStatement();

ResultSet rs=stm.executeQuery("select * from presnttime where time > '"+ExpectTime+"' and sno='"+ff+"' ");
		if(rs.next())
		{
	%>	
		

<tr><td align="center">
<font color="#FF0000" size="+2">We Expect the Time is  :&nbsp;&nbsp;<%=ExpectTime%></font>
</td></tr>

<tr><td align="center">
<font color="#FF0000" size="+2"><blink>We Expect the Time is over so,the train may be gone</blink></font>
</td></tr>

		
<%
 
  }
  else
  {
  
  	%>
   <tr><td align="center">
<font color="#3300FF" size="+2">This Train is Available </font>
</td></tr>
  
  <tr><td align="center">
<font color="#3300FF" size="+2">We Expect the Time is  :&nbsp;&nbsp;<%=ExpectTime%></font>
</td></tr>
		
  <%
  }
  
  
  
  
		}
		catch(Exception e)
		{
		out.println(e);
		}
  
  
  

   %>
  		
<tr><td height="100"></td><td height="100"></td></tr>
</table>
  
  
  
  

  
  
  </div>
  <div id="footer1_"> &nbsp;</div>
  
  
  
  
<div align=center></div></body>
</html>
