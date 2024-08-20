<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="with=device-width, initial-scale=1.0">
   <title>Travelling Train</title>
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
 </style>
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
  <form class="contact" name="f2" action="chk.jsp" method="post" onsubmit="return reg()">
   
 <!--  <div class="content">
    <div class="container">
      <div class="contactInfo"> -->
         <div class="contactForm">
             <div class="loginform">
                 <form>
                  <h3 style="color: red;">*Enter Correct Username and password</h3>
                  <br>
                   <h4>USER LOGIN</h4>
                   <div class="inputbox">
                    <input type="text" name="email" required="required">
                    <span>Email</span>
                   </div>
                   <div class="inputbox">
                    <input type="password" name="pass" required="required">
                    <span>Password</span>
                   </div>
                   <div class="inputbox">
                    <input type="submit" name="submit" value="Login">
                    <input type="reset" name="reset" value="Reset">
                   </div>
                    <div class="inputbox">
                     <a href="newuser.jsp">New User</a>
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


