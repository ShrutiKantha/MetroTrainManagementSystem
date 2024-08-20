<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
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
    <li><a href="index.html"><font size="+1" color="#00FF33">Home</font> </a></li>
    <li><a href="alogin1.jsp"><font size="+1" color="#FF0000">NewTrain</font> </a></li>
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
    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Find Travelling Time</h2>
	
	
	
	<form name="f2" action="bstation1.jsp" method="post" onsubmit="return reg()">
	<table width="500" bgcolor="#FFCC66" align="center" height="200">
	<tr><td colspan="2" height="60"></td></tr>
	
	
	
	<tr><td align="right"><font color="#FFFFFF" size="+1">Select Which station's Next want?</font></td>
	<td align="center">
	
	<select name="fair">
	<option value="select">--Select Station 1--</option>
<%
try
{
Connection con=databasecon.getconnection();
          Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from trainstations");
           while(rs.next()){
           %>

<option value="<%=rs.getString("sno")%>"><%=rs.getString("stations")%></option>


<%
           }
		   }
		   catch(Exception e1)
		   {
		   out.println(e1.getMessage());
		   }
%>
</select>
</td>
</tr>


	
<tr><td colspan="2" height="20"></td></tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="submit" value="Next"></td></tr>
	<tr><td colspan="2" align="center"></td></tr>
	<tr><td height="20"></td><td height="20"></td></tr>
	
	<tr><td height="70"></td><td height="70"></td></tr>
	</table>
	</form>
	
		
  </div>
  <div id="footer1_"> &nbsp;</div>
  
  
  
  
<div align=center></div></body>
</html>
