<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />


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


</head>
<body>
<div id="Container"> 
  <div id="header_"> &nbsp;
  
  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/h.png" width="520" height="50"></div>
  
   
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
  <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    Metro Train Return Time!</h2>
  <%
	
	String name=request.getParameter("name");
	String stime=request.getParameter("timepick");
	
	
	%>
  <form name="f2" action="instrain.jsp" method="post" onsubmit="return reg()">
    <table align="center" height="250" width="500" bgcolor="#FFCC66">
      <tr> 
        <td width="143"></td>
        <td width="168"> 
      <tr > 
        <td  align="center"><font color="#FFFFFF" size="+2">Train Name</font>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td  align="left" class="s1"><input type="text" name="name" value="<%=name%>" ></td>
      </tr>
      <tr > 
        <td  align="center"><font color="#FFFFFF" size="+2">Start time</font>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td  align="left"><input type="text" name="stime1" value="<%=stime%>" ></td>
      </tr>
      <tr> 
        <td align="center"><font color="#FFFFFF" size="+2">Return Time</font>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</td>
        <td align="left"> <input style="font-family:monospace;" size=11 type="text" name="timepick"> 
          <input type="button" value="/\" onclick="timepicker.updown(1);"> <input type="button" value="\/" onclick="timepicker.updown(1);"> 
          <input type="button" value="//\\" onclick="timepicker.updown(60);"> 
          <input type="button" value="\\//" onclick="timepicker.updown(-60);">	
        </td>
      </tr>
      <tr> 
        <td align="center" colspan="2"><input type="submit" name="submit" value="Submit"> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr></td></tr>
    </table></div>
    
  </form>
</div>
  <div id="footer1_"> &nbsp;</div>
    
<div align=center></div></body>
</html>
