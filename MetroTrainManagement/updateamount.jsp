<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.util.date.*,java.util.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />


<script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>


</head>
<body>

<%

        String kmtotal=null;
		
        try
		{		
		Connection c2=databasecon.getconnection();
		Statement s2=c2.createStatement();
		ResultSet rs2=s2.executeQuery("SELECT amount from amount where no="+1+" ");
		while(rs2.next())
		{
		 kmtotal=rs2.getString("amount");
		
		
		}
		}
		catch(Exception es)
		{
		out.println(es);
		}
		
       
       int perkm=Integer.parseInt(kmtotal);
	   
%>





<div id="Container"> 
  <div id="header_"> &nbsp; 
    <ul class="navi">
      <li><a href="index.html"><font size="+1" color="#00FF33">Home</font> </a></li>
      <li><a href="alogin1.jsp"><font size="+1" color="#FFFF33">NewTrain</font> 
        </a></li>
      <li><a href="stations.jsp"><font size="+1" color="#FF0000">NewStations</font> 
        </a></li>
      <li><a href="totaltrains.jsp"><font size="+1" color="#0000FF">TotalTrains</font> 
        </a></li>
      <li><a href="index.html"><font size="+1" color="#FFFFFF">Logout</font> </a></li>
    </ul>
  </div>
  <div id="left_"> 
    <h2>Wordings</h2>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I'd give anything 
      but I won't give up on you I'd say anything, but not goodbye I will run 
      &nbsp; with your &nbsp; changes and I'm &nbsp;always on your &nbsp;side 
      And there's not a word &nbsp;I've ever heard, that would make me change 
      my mind. </br> </br> &nbsp;&nbsp;&nbsp;Words they'll try to shake you Don't 
      let them break you Or stop your world from turning When words keep you from 
      feeling good Use them as fire wood and let 'em burn </br> </br> Let them 
      burn</br> Let them burn </p>
    <p><span>Next Year</span>Another Route MetroTrain will start on coming Next 
      Year in chennai. </p>
  </div><div id="right_">
  <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upload 
    New Metro Train!</h2>
  <form name="f2" action="upamount.jsp" method="post" onsubmit="return reg()">
    <table align="center" height="250" width="450" bgcolor="#FFCC66">
      <tr> 
        <td class="s1" align="center"><font color="#FFFFFF" size="+2">Present 
          Amount per KM</font></td>
        <td ><input type="text" name="name1" value="<%=perkm%>" ></td>
      </tr>
      <tr > 
        <td class="s1" align="center"><font color="#FFFFFF" size="+2">Update Amount 
          per KM</font></td>
        <td ><input type="text" name="name" ></td>
      </tr>
      <tr> 
        <td align="right"><input type="submit" name="submit" value="Update "></td>
        <td><input type="reset" name="reset" value="RESET"></td>
      </tr>
    </table></div>
    
  </form>
</div>
  <div id="footer1_"> &nbsp;</div>
    
<div align=center></div></body>
</html>
