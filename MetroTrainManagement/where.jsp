<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Travelling Train</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <link href="style.css" rel="stylesheet" type="text/css" />
    <style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white; /* White background */
            padding: 40px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Top margin */
            width: 600px; /* Width of the form box */
            margin: auto; /* Center the box */
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
    <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
    <script type="text/javascript">
        function reg() {
            var d = document.f2.fair.value;
            if (document.f2.fair.selectedIndex == 0) {
                alert("Select Train Name");
                return false;
            }

            var e = document.f2.fair1.value;
            if (document.f2.fair1.selectedIndex == 0) {
                alert("Select Ending Point");
                return false;
            }

            if (d == e) {
                alert("Select Correct Distance");
                return false;
            }
        }

        function timepicker() {
            var d = new Date();
            d.setMinutes(d.getMinutes() + timepicker.h);
            var p = function(n) {
                return ':' + (n < 10 ? '0' + n : n);
            },
            h = d.getHours(),
            m = p(d.getMinutes()),
            ampm = h >= 24 ? 'PM' : 'AM';
            h = h % 24 || 24;
            h = h < 10 ? '\xa0' + h : h;
            document.forms[0].elements['timepick'].value = h + m;
            timepicker.timer = setTimeout(timepicker, 1000);
        };
        timepicker.h = 0;
        timepicker.updown = function(n) {
            clearTimeout(timepicker.timer);
            timepicker.h += n;
            timepicker();
        };
        window.onload = timepicker;
    </script>
</head>

<body>
    <section class="header">
        <nav>
            <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;" alt="Logo"></a>
            <div class="nav-links">
                <ul>
                    <li><a href="fair.jsp">FAIRS</a></li>
                    <li><a href="where.jsp">TRAIN WHERE?</a></li>
                    <li><a href="ticket.jsp">TICKETS</a></li>
                    <li><a href="timing.jsp">TIMINGS</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </div>
        </nav>
   
    <!-- Form Section -->
     <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 form-wrapper">
                <h2 class="text-center">Find Train Where?</h2>
				<br>
                <form name="f2" action="where0.jsp" method="post" onsubmit="return reg()">
                    <table width="100%" align="center">
                        <tr>
                            <td align="right">
                                <label for="fair"><font color="#000" size="+1">Train Name:</font></label>
                            </td>
                            <td>
                                <select name="fair" id="fair" class="form-control">
                                    <option value="select">--Select Station 1--</option>
                                    <% 
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("SELECT * FROM traintime");
                                        while (rs.next()) {
                                            %>
                                            <option value="<%= rs.getString("no") %>"><%= rs.getString("trainname") %></option>
                                            <% 
                                        }
                                    } catch (Exception e) {
                                        out.println(e.getMessage());
                                    }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="20"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="text" name="timepick" class="form-control" placeholder="Time Pick">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" height="20"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
								<input type="submit" name="submit" value="Show Me Fair" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
	</section>
	<!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>


</body>

</html>
