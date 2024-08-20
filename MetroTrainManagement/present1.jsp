<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="with=device-width, initial-scale=1.0">
		 <title>Travelling Train</title>
		 <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	
		 <link href="style.css" rel="stylesheet" type="text/css">
		 <link rel="preconnect" href="https://fonts.gstatic.com">
	  <link href="https://fonts.googleapis.com/2?family=Poppins:wght@100;200;300;400;600;700&display=swag" rel='stylesheet'>
	  <style>
	  .header {
		min-height: 100vh;
		width: 100%;
		background-image:linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url("images/backgroung.jpg");
		background-position: center;
		background-size: cover;
		position: relative;
	}
	.form-wrapper {
            background-color: white; /* White background */
            padding: 40px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Add top margin */
            width: 500px;
            margin: auto; /* Center the box */
        }
	</style>
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
	<section class="header">
		<nav>
			<a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;" alt="Logo"></a>
			<div class="nav-links">
				<ul>
					<li><a href="userfront.jsp">HOME</a></li>
					<li><a href="where.jsp">TRAIN WHERE?</a></li>
					<li><a href="ticket.jsp">TICKETS</a></li>
					<li><a href="timing.jsp">TIMINGS</li>
					<li><a href="index.html">LOGOUT</a></li>
				</ul>
			</div>
		</nav>
		<div class="form-wrapper"> 
			<h2 class="text-center">Find Travelling Fair</h2>
			<table style="border: none;" class="table">

				<tr>
					<td colspan="2" height="60"></td>
				</tr>
				<tr>
					<td align="center">
						<font style="color: red;" size="+2">Train Names for Now</font>
					</td>
				</tr>

 <%
String d1=request.getParameter("fair");
session.setAttribute("d1",d1);
		
String d2=request.getParameter("fair1");
		
String time=request.getParameter("timepick");


Date date2 = new SimpleDateFormat("hh:mm").parse(time);
String time2= new SimpleDateFormat("hh:mm aa").format(date2);




Connection coon=null;
PreparedStatement pps=null;

try
{

	 coon = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
	pps=coon.prepareStatement ("insert into presnttime (time) values (?)");
pps.setString(1,time2);
int x=pps.executeUpdate();
}
catch(Exception e)
{
out.println(e.getMessage());
}







		
		
Date date = new SimpleDateFormat("HH:mm").parse(time);
String a2= new SimpleDateFormat("HH:mm").format(date);
String a3= new SimpleDateFormat("mm").format(date);
String a4= new SimpleDateFormat("HH").format(date);
int i4=Integer.parseInt(a4);
int i3=Integer.parseInt(a3);
i4=i4+1;
String reee = String.valueOf(i3);
String xxx=i4+":"+reee;
SimpleDateFormat inFormat = new SimpleDateFormat("hh:mm");
SimpleDateFormat outFormat = new SimpleDateFormat("HH:mm");
String time24 = outFormat.format(inFormat.parse(xxx));

int ii3=Integer.parseInt(a3);
i4=i4-2;
String ree = String.valueOf(ii3);
String xxx1=i4+":"+ree;
SimpleDateFormat inFormat1 = new SimpleDateFormat("hh:mm");
SimpleDateFormat outFormat1 = new SimpleDateFormat("HH:mm");
String t24 = outFormat1.format(inFormat1.parse(xxx1));

		

		
		
		
		int d11=Integer.parseInt(d1);
		
		int d22=Integer.parseInt(d2);
		
		int i=d22-d11;
		
		
		if(i>0)
		{
		
        String tims=null;
		 String tname=null;
		try
		{		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
			Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery("select trainname,starttime from traintime where starttime BETWEEN '"+t24+"' AND '"+time24+"'");
		while(rs.next())
		{
		
		tname=rs.getString(1);
		session.setAttribute("tname",tname);
		
        tims=rs.getString("starttime");
		session.setAttribute("tims",tims);
        
		
		%>
		<tr><td align="center"><font color="#000000" size="+2"><%=tname%></font></td></tr>
		
		<%
		
				
}
}
catch(Exception e)
{
out.println(e);
}
}
	
		
		
		else
		
		
		
		{
		
        String tims=null;
		 String tname=null;
		try
		{		
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
			Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery("select trainname,endtime from traintime where endtime BETWEEN '"+t24+"' AND '"+time24+"'");
		while(rs.next())
		{
		
		tname=rs.getString(1);
		session.setAttribute("tname",tname);
		
        tims=rs.getString("endtime");
		session.setAttribute("tims",tims);
        
		
%>
<tr><td align="center">
<font color="#FFFFFF" size="+2"><a href="distance1.jsp?<%=tims%>"><%=tname%></a></font>
</td></tr>
		
		<%
		
				
}
}
catch(Exception e)
{
out.println(e);
}

		
		
       }
		
		
	
		
	
		
	  %>
	  <tr><td height="100"></td><td height="100"></td></tr>
	  </table>
  </div>
  <div id="footer1_"> &nbsp;</div>
  
  
  
  
<div align=center></div></body>
</html>
