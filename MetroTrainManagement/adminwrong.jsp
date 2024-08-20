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
	var a = document.f2.name.value;
	if(a=="")
	{
	alert ("Enter Admin name");
	document.f2.name.focus();
	return false;
	}
	
	
	
	
	var d=document.f2.pass.value;
	if(d=="")
	{
	alert ("Enter Admin password");
	document.f2.pass.focus();
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
    <li><a href="routemap.jsp"><font size="+1" color="#FFFF33">Maps</font> </a></li>
    <li><a href="trains.jsp"><font size="+1" color="#FF0000">TotalTrains</font> 
      </a></li>
    <li><a href="contact.jsp"><font size="+1" color="#0000FF">Contact</font> </a></li>
    <li><a href="userlogin.jsp"><font size="+1" color="#FFFFFF">UserLogin</font> 
      </a></li>
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
   <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome To Admin Page!</h2>
	<form name="f2" action="adminchk.jsp" method="post" onsubmit="return reg()">
	<table align="center" bgcolor="#FFCC66" width="400" height="250">
	<tr><td height="30"></td><td height="30"></td></tr>
	<tr><td align="center"><font color="#FFFFFF" size="+2">AdminName</font></td><td><input type="text" name="name"></td></tr>
	<tr><td height="10"></td><td height="10"></td></tr>
    <tr><td align="center"><font color="#FFFFFF" size="+2">Password</font></td><td><input type="password" name="pass"></td></tr>
	<tr><td align="right"><input type="submit" name="submit" value="Admin Login"></td><td><input type="reset" name="reset" value="RESET"></td></tr>
	<tr><td align="center" colspan="2"><font color="#FF0000" size="+1">ADMINNAME AND PASSWORD ARE INCORRECT</font></td></tr>
	<tr><td height="50"></td><td height="50"></td></tr>
	</table>
	</form>
		
	
  </div>
  <div id="footer1_"> &nbsp;</div>
    
<div align=center></div></body>
</html>
