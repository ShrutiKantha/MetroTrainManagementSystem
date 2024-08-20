<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<!DOCTYPE html>
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
</head>

<body>
    <section class="header">
        <nav>
            <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;"></a>
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
    

    <!-- Form Section -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12" style="padding:'40px';">
                <!-- Form wrapper with white background and box shadow -->
                <div class="form-wrapper">
                    <h2 class="text-center">Find Travelling Fair</h2>
                    
                    <!-- The form is centered using Bootstrap's grid system -->
                    <form name="f2" action="fair1.jsp" method="post" onsubmit="return reg()">
                        <div class="form-group">
                            <label for="fair">From</label>
                            <select class="form-control" name="fair" id="fair">
                                <option value="select">--Select Station 1--</option>
                                <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from trainstations");
                                    while (rs.next()) {
                                %>
                                    <option value="<%=rs.getString("sno")%>"><%=rs.getString("stations")%></option>
                                <%
                                    }
                                } catch (Exception e1) {
                                    out.println(e1.getMessage());
                                }
                                %>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="fair1">To</label>
                            <select class="form-control" name="fair1" id="fair1">
                                <option value="select">--Select Station 2--</option>
                                <%
                                try {
                                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                    Statement st1 = con1.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from trainstations");
                                    while (rs1.next()) {
                                %>
                                    <option value="<%=rs1.getString("sno")%>"><%=rs1.getString("stations")%></option>
                                <%
                                    }
                                } catch (Exception e1) {
                                    out.println(e1.getMessage());
                                }
                                %>
                            </select>
                        </div>
                        
                        <div class="text-center">
                            <input type="submit" name="submit" value="Show Me Fair" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  </section>
    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
