<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
  <meta name="viewport" content="with=device-width, initial-scale=1.0">
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/2?family=Poppins:wght@100;200;300;400;600;700&display=swag" rel='stylesheet'>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
   .header {
    min-height: 100vh;
    width: 100%;
    background-image:linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url("images/backgroung.jpg");
    background-position: center;
    background-size: cover;
    position: relative;
 }
 </style>
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
<!-- <div id="Container"> 
 --><section class="header">
    <nav>
       <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;"></a>
         <div class="nav-links">
           <ul>
                <li><a href="index.html">HOME</a></li>
                <li><a href="routemap.jsp">ROUTE MAP</a></li>
                <li><a href="contact.jsp">CONTACT</a></li>
                <li><a href="trains.jsp">TOTALTRAINS</a></li>
                <li><a href="userlogin.jsp">USERLOGIN</a></li>
           </ul>
        </div>
    </nav>
  <form class="contact" name="f2" action="adminchk.jsp" method="post" onsubmit="return reg()">
 <!--  <div class="content">
    <div class="container">
      <div class="contactInfo"> -->
         <div class="contactForm">
             <div class="loginform">
                 <form>
                   <h4>ADMIN PAGE</h4>
                   <br>
                   <div class="inputbox">
                    <input type="text" name="txt_uname" required="required">
                    <span>AdminName</span>
                   </div>
                   <div class="inputbox">
                    <input type="password" name="txt_pwd" required="required">
                    <span>Password</span>
                   </div>
                   <div class="inputbox">
                    <input type="submit" name="submit" value="Submit">
                    <input type="reset" name="reset" value="Reset">
                   </div>
                </form>
             </div>
        </div>
<!--     </div>
   </div>
  </div> -->
</form>
</div>
</section>

 </body>
</html>
