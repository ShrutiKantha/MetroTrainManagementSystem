
<%@ page  import="java.sql.*,databaseconnection.*"  %>
<%@ page import="java.util.date.*,java.util.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	
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
	var a = document.f2.station.value;
	if(a=="")
	{
	alert ("Enter NewStation name");
	document.f2.station.focus();
	return false;
	}
	var d=document.f2.km.value;
	if(d=="")
	{
	alert ("KM from Last Station");
	document.f2.km.focus();
	return false;
	}
	}	
	</script>
 <body>
 
 <%
Statement st=null;
ResultSet rs=null;
String stat=null;
Connection con1=null;
int id=0;
try
{
con1=databasecon.getconnection();
st=con1.createStatement();
rs=st.executeQuery("select max(sno) from trainstations");
while(rs.next())
{
id=rs.getInt(1);

//System.out.println(id);


}
}
catch(Exception e)
{
out.println(e.getMessage());
}
%>

  
<div id="Container"> 
<div id="header_"> &nbsp; 

<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/h.png" width="520" height="50"></div>

   
  <ul class="navi">
    <li><a href="index.html"><font size="+1" color="#00FF33">Home</font> </a></li>
    <li><a href="alogin1.jsp"><font size="+1" color="#FFFF33">NewTrain</font> </a></li>
    <li><a href="stations.jsp"><font size="+1" color="#FF0000">NewStations</font> 
      </a></li>
    <li><a href="totaltrains.jsp"><font size="+1" color="#0000FF">TotalTrains</font> </a></li>
    <li><a href="index.html"><font size="+1" color="#FFFFFF">Logout</font> </a></li>
  </ul>
</div>
 
<div id="left_"> 
    <h2>Wordings</h2>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I'd give anything but I won't give up on you
I'd say anything, but not goodbye
I will run &nbsp; with your &nbsp; changes and I'm &nbsp;always on your &nbsp;side
And there's not a word &nbsp;I've ever heard, that would make me change my mind.
</br>
</br>
  &nbsp;&nbsp;&nbsp;Words they'll try to shake you
Don't let them break you
Or stop your world from turning
When words keep you from feeling good
Use them as fire wood and let 'em burn
</br>
</br>

Let them burn</br>
Let them burn
 </p>
    <p><span>Next Year</span>Another Route MetroTrain will start on coming Next Year in chennai. </p>
  </div>




  <div id="right_"> 
   <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upload The Stations</h2>
<form name="f2" action="insertstation.jsp" method="post" onsubmit="return reg()">
<table align="center" height="280"  width="380" bgcolor="#FFCC66">

<%
Connection con2=null;
Statement st2=null;
ResultSet rs2=null;
try
{
con2=databasecon.getconnection();
st2=con2.createStatement();
rs2=st2.executeQuery("select stations from trainstations where sno='"+id+"'");
while(rs2.next())
{
stat=rs2.getString(1);
%>

<tr><td align="center"><font color="#FFFFFF" size="+1">Last Station</font></td><td><input value="<%=stat%>" type="text" name="name"></td></tr>
<%
}
}
catch(Exception e)
{
out.println(e.getMessage());
}

%>
<tr><td align="center"><font color="#FFFFFF" size="+1">New Station</font></td><td><input type="text" name="station"></td></tr>
<tr><td align="center"><font color="#FFFFFF" size="+1">KM from Last station</font></td><td><input type="text" name="km"></td></tr>	
<tr><td align="right"><input type="submit" name="submit" value="SUBMIT"></td><td><input type="reset" name="reset" value="RESET"></td>      </tr>
<tr><td height="20"></td><td height="20"></td></tr>
<tr><td align="center" colspan="2"><font color="#0000FF" size="+1"><a href="bstation.jsp">Insert Between Two Stations</a></font></td></tr>

<tr><td height="20"></td><td height="20"></td></tr>
</table>
</form>
		
</div>
<div id="footer1_"> &nbsp;</div>   
<div align=center></div>
</body>
</html>
