<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
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
</style>
</head>
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








<script type="text/javascript">
function reg()
{
var d=document.f2.fair.value;
if(document.f2.fair.selectedIndex==0)
{
alert("Select Train From");
return false;
}

var d=document.f2.fair1.value;
if(document.f2.fair1.selectedIndex==0)
{
alert("Select Train To");
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
 
      <div class="container mt-5">
        <div class="card shadow-sm bg-white rounded">
            <div class="card-body" style="padding: 40px;">
                <h2 class="card-title">Find Present Train</h2>

                <!-- Form -->
                <form name="f2" action="present1.jsp" method="post" onsubmit="return reg()">
                    <div class="form-group">
                        <label for="fair">From</label>
                        <select name="fair" id="fair" class="form-control">
                            <option value="select">--Select Station 1--</option>
                            <%-- Populate options with server-side data --%>
                            <%
                                try {
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from trainstations");
                                    while (rs.next()) {
                                        %>
                                        <option value="<%= rs.getString("sno") %>"><%= rs.getString("stations") %></option>
                                        <%
                                    }
                                } catch (Exception e) {
                                    out.println(e.getMessage());
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="fair1">To</label>
                        <select name="fair1" id="fair1" class="form-control">
                            <option value="select">--Select Station 2--</option>
                            <%-- Populate options with server-side data --%>
                            <%
                                try {
                                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                    Statement st1 = con1.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from trainstations");
                                    while (rs1.next()) {
                                        %>
                                        <option value="<%= rs1.getString("sno") %>"><%= rs1.getString("stations") %></option>
                                        <%
                                    }
                                } catch (Exception e1) {
                                    out.println(e1.getMessage());
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <input type="text" name="timepick" class="form-control" placeholder="Time">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Show Train is Now</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Include jQuery and Bootstrap JS from CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js" crossorigin="anonymous"></script>

    <!-- Add your custom JavaScript here -->
</body>
</html>