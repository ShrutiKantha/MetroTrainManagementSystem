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
	var a = document.f2.newname.value;
	if(a=="")
	{
	alert ("Enter NewStation name");
	document.f2.newname.focus();
	return false;
	}
	var d=document.f2.newkm.value;
	if(d=="")
	{
	alert ("KM from Previous Station");
	document.f2.newkm.focus();
	return false;
	}
	
	var v=document.f2.nextkm.value;
	if(v=="")
	{
	alert ("KM from New Station");
	document.f2.nextkm.focus();
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
    <li><a href="index.html"><font size="+1" color="#FF0000">Logout</font> </a></li>
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
	
		
	<form name="f2" action="bstation2.jsp" method="post" onsubmit="return reg()">
	
	
	
	<table width="400" bgcolor="#FFCC66" align="center" height="200">
	<tr><td colspan="2" height="60"></td></tr>
	

 <%
 
 
 String Stat=request.getParameter("fair");
//out.print(Stat);
 int stt=Integer.parseInt(Stat); 
  int nexts=stt+1;
  //out.print(nexts);

 // <%

        String sname=null;
		
        try
		{		
		Connection con2=databasecon.getconnection();
		Statement stmt2=con2.createStatement();
		ResultSet rs2=stmt2.executeQuery("SELECT stations from trainstations where sno='"+Stat+"' ");
		while(rs2.next())
		{
		 sname=rs2.getString("stations");
		
		
		}
		}
		catch(Exception es)
		{
		out.println(es);
		}
		//out.print(sname);
       
      
 
Connection con10=null;
Statement st10=null;
ResultSet rs10=null;
String sno=null,station=null,distance=null;
try
{
con10=databasecon.getconnection();
st10=con10.createStatement();
rs10=st10.executeQuery("select sno,stations,distance  from trainstations where sno > '"+Stat+"' ");
while(rs10.next())
{
 sno=rs10.getString(1);
 //out.print(sno);
 station=rs10.getString(2);
 //out.print(station);
 distance=rs10.getString(3);
 //out.print(distance);

Connection c1=null;
PreparedStatement p1=null;
try
{
c1=databasecon.getconnection();
p1=c1.prepareStatement ("insert into temp (sno,stations,distance) values (?,?,?)");

p1.setString(1,sno);
p1.setString(2,station);
p1.setString(3,distance);
int x=p1.executeUpdate();
            
 }
 catch(Exception e)
  {
   out.println(e.getMessage());
    }

Connection c2=null;
try
{
c2=databasecon.getconnection();
PreparedStatement p2=c2.prepareStatement("delete  from trainstations where sno > '"+Stat+"'  ");
p2.executeUpdate();

}
catch(Exception e2)
{
out.println(e2.getMessage());
}



}
}
catch(Exception e)
{
out.println(e.getMessage());
}
	

 
 
 
 %>	
		
<tr><td width="230"></td><td width="170"></td></tr>
<tr><td align="left">
<font color="#0000FF" size="+1.5">Previous Station name</font> </td><td align="left"><font color="#0000FF" size="+1.5"><%=sname%></font>
</td></tr>
<tr><td colspan="2" height="5"></td></tr>
<tr><td align="left">
<font color="#0000FF" size="+1.5">New Station name </font> </td><td align="left"><font color="#0000FF" size="+1.5"><input type="text" name="newname"></font>
</td></tr>

<tr><td colspan="2" height="5"></td></tr>



<tr><td align="left">
<font color="#0000FF" size="+1.5">KM From Previous station </font> </td><td align="left"><input type="text" name="newkm">
</td></tr>

<%
 
 
 
 
 
 
 
 
   String nextstation=null;
		
        try
		{		
		Connection con3=databasecon.getconnection();
		Statement stmt3=con3.createStatement();
		ResultSet rs3=stmt3.executeQuery("SELECT stations from temp where sno='"+nexts+"' ");
		while(rs3.next())
		{
		 nextstation=rs3.getString("stations");
		
		
		}
		}
		catch(Exception es1)
		{
		out.println(es1);
		}
		
 
 session.setAttribute("nextstation",nextstation);
 
 %>
 
 
 <tr><td colspan="2" height="5"></td></tr>



<tr><td align="left">
<font color="#0000FF" size="+1.5">Next Station name</font> </td><td align="left"><font color="#0000FF" size="+1.5"><%=nextstation%></font>
</td></tr>

 
 
 <tr><td colspan="2" height="5"></td></tr>



<tr><td align="left">
<font color="#0000FF" size="+1.5">KM From New station </font> </td><td align="left"><input type="text" name="nextkm">
</td></tr>

 <%
 
 
 
 
   %>
  		
  
  
  <tr><td colspan="2" height="20"></td></tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="submit" value="submit">&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="RESET"></td></tr>
	
	
	
	<tr><td height="70"></td><td height="70"></td></tr>
	</table>
	</form>

  
  

  
  
  </div>
  <div id="footer1_"> &nbsp;</div>
  
  
  
  
<div align=center></div></body>
</html>
