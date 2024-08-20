<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Travelling Train</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<!-- Link to Bootstrap CSS -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<!-- Link to custom styles -->
		<link href="style.css" rel="stylesheet" type="text/css" />
		<style>
			/* Styling for the form wrapper */
			.form-wrapper {
				background-color: white; /* White background */
				padding: 40px; /* Padding around the form */
				border-radius: 10px; /* Rounded corners */
				box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
				margin-top: 30px; /* Add top margin */
			}
	  .header {
		min-height: 100vh;
		width: 100%;
		background-image:linear-gradient(rgba(4,9,30,0.7),rgba(4,9,30,0.7)),url("images/backgroung.jpg");
		background-position: center;
		background-size: cover;
		position: relative;
	}
		</style>
<script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>




<script type="text/javascript">
	function reg()
	{
	var a = document.f2.name.value;
	if(a=="")
	{
	alert ("Enter a name");
	document.f2.name.focus();
	return false;
	}
	
	if(!isNaN(a))
	{
	alert ("Enter a alphabet");
	document.form1.name.select();
	return false;
	}
	
	
	
	var vid=document.f2.vidno.value;
	if(vid=="")
	{
	alert ("Enter Voter ID");
	document.f2.vidno.focus();
	return false;
	}
	
	
	
	var d=document.f2.pass.value;
	if(d=="")
	{
	alert ("Enter a password");
	document.f2.pass.focus();
	return false;
	}
		
	
	var z=document.f2.email.value;
	if(z=="")
	{
	alert ("enter Your mail id");
	document.f2.email.focus();
	return false;
	}
	
	
	var emailfilter=/^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i
	var c=emailfilter.test(document.f2.email.value);
	if(c==false)
	{
	alert(" Enter valid Mail ID");
	document.f2.email.select();
	return false;
	}
	

	
	
	
	var f=document.f2.dob.value;
	if(f=="")
	{
	alert ("Pick date");
	document.f2.dob.focus();
	return false;
	}
	
	
	
	if ( ( f2.gender[0].checked == false ) && ( f2.gender[1].checked == false ) )
	{
	alert ( "Select Gender: Male or Female" );
	return false;
	}
	
	
	
	var h=document.f2.mobile.value;
	if(h=="")
	{
	alert ("Enter mobile number");
	document.f2.mobile.focus();
	return false;
	}
	if(h.length!=10)
	{
	alert ("Enter valid mobile number");
	document.f2.mobile.focus();
	return false;
	}	
	var g=document.f2.address.value;
	if(g=="")
	{
	alert ("Enter address");
	document.f2.address.focus();
	return false;
	}
	}
	
	</script>




</head>
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
                <li><a href="trains.jsp">TOTOLTRAINS</a></li>
                <li><a href="admin.jsp">ADMIN</a></li>
           </ul>
        </div>
    </nav>
	<form class="contact" name="f2" action="insert.jsp" method="post" onsubmit="return reg()" style="width: 100%; margin:auto;">
 <!--  <div class="content">
    <div class="container">
      <div class="contactInfo"> -->
         <div class="contactForm" style="align-items: center;">
             <div class="loginform">
                 <form>
                   <h4>USER REGISTRATION</h4>
                   <div class="inputbox">
                    <input type="text" name="name" required="required">
                    <span>Enter Name</span>
                   </div>
                   <div class="inputbox">
                    <input type="text" name="vidno" required="required">
                    <span>VoterID No</span>
                   </div>
                   <div class="inputbox">
                    <input type="password" name="pass" required="required">
                    <span>Password</span>
                   </div>
                   <div class="inputbox">
                    <input type="text" name="email" required="required">
                    <span>Email</span>
                   </div>
                   <div class="inputbox">
<!--                    <span>Date Of Birth</span>
 -->                <input type="date" name="dob" required="required">
	                </div>
                   </div>
                   <div class="inputbox">
                    <input type="text" name="mobile" required="required">
                    <span>Mobile No</span>
                   </div>
                   <div class="inputbox1">
	            	<br><input type="radio"  name="gender" value="Male" required="required">&nbsp;&nbsp;<span>Male</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            	<input type="radio"  name="gender" value="Male" required="required">&nbsp;&nbsp;<span>Female</span>
                   </div>                   
                   <div class="inputbox">
                    <input type="text" name="address" required="required">
                    <span>Address</span>
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
