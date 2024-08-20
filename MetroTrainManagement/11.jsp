<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
  <meta name="viewport" content="with=device-width, initial-scale=1.0">
<link href="style.css" rel="stylesheet" type="text/css" />

 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/2?family=Poppins:wght@100;200;300;400;600;700&display=swag" rel='stylesheet'>

<script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>

<script type="text/javascript">

function timepicker()
{



var d = new Date();
d.setMinutes(d.getMinutes() + timepicker.h);
var p = function(n){return ':' + (n < 10? '0' + n : n);
},
h = d.getHours(),
m = p(d.getMinutes()),
//s = p(d.getSeconds()),
ampm = h >= 24? 'PM' : 'AM';
h = h%24 || 24;
h = h < 10? '\xa0' + h : h;
document.forms[0].elements['timepick'].value = h + m;
timepicker.timer = setTimeout(timepicker, 1000);
};
timepicker.h = 0;
timepicker.updown = function(n)
{
clearTimeout(timepicker.timer);
timepicker.h += n;
timepicker();
};
window.onload = timepicker;
</script>

<body>
<!-- <div id="Container"> 
 --><section class="header">
    <nav>
       <a href="index.html"><img src="images/logo (1).jpeg"></a>
         <div class="nav-links">
           <ul>
                <li><a href="alogin.jsp">HOME PAGE</a></li>
                <li><a href="about.jsp">ABOUT US</a></li>
                <li><a href="contact.jsp">CONTACT US</a></li>
                <li><a href="userlogin.jsp">USERLOGIN</a></li>
                <li><a href="admin.jsp">ADMIN</a></li>
           </ul>
        </div>
    </nav>
<div class="text-box">
  <h1>Book your train tickets at ease.</h1>
  <p>We saves your time both while purchasing, the check-in and during the travel. <br>Make your trip faster and more comfortable.</p>
</div>
</section>
 </body>
</html>

	<%
Connection conn=null;
Connection conn1=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;

try
{


conn=databasecon.getconnection();
ps=conn.prepareStatement ("UPDATE trainstations SET sno=sno+1 where  sno > 5 ORDER BY sno DESC "); 
ps.executeUpdate();
}
catch(Exception e)
{
}


try

{
conn1=databasecon.getconnection();

ps1=conn1.prepareStatement ("insert into trainstations(stations,distance) values (?,?) ");
String name="Stations";
String voterid="20";
ps1.setString(1,name);
ps1.setString(2,voterid);
ps1.executeUpdate();
}
catch(Exception e1)
{
}
 %>	
	
	<!---
	
	
  <form name="f2" action="alogin1a.jsp" method="post" onsubmit="return reg()">
    <table class="s1" width="423" height="120"  >
      <tr> 
        <td width="243"></td>
        <td width="168"> 
      <tr > 
        <td class="s1" align="right">Train Name&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td class="s1"><input type="text" name="name" ></td>
      </tr>
      <tr> 
        <td class="s1" align="right">Set EndTime&nbsp;&nbsp;</td>
        <td> <input  name="timepick"> </td>
      </tr>
      <tr> 
        <td align="right"><input type="submit" name="submit" value="Admin Login"></td>
        <td><input type="reset" name="reset" value="RESET"></td>
      </tr></td></tr>
    </table></div>
    
  </form>--->
    </body>
</html>
