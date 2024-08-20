<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Travelling Train</title>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet" type="text/css">
    <style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white; /* White background */
            padding: 40px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Add top margin */
            width: 500px;
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
</head>
<body>
    <section class="header">
        <nav>
            <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;" alt="Logo"></a>
            <div class="nav-links">
                <ul>
                    <li><a href="userfront.jsp">HOME</a></li>
                    <li><a href="where.jsp">TRAIN WHERE?</a></li>
                    <li><a href="ticket.jsp">TICKETS</a></li>
                    <li><a href="timing.jsp">TIMINGS</a></li>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </div>
        </nav>
    

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 form-wrapper">
                <h2 class="text-center">Find Travelling Time</h2>
				<br>                
                <% 
                    String fair = request.getParameter("fair");
                    String fair1 = request.getParameter("fair1");
                    
                    int i4 = Integer.parseInt(fair);
                    int i5 = Integer.parseInt(fair1);
                    
                    int i = i5 - i4;
                    int totalTime = 0;
                    
                    try {
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                        Statement stmt = con.createStatement();
                        
                        if (i > 0) {
                            int i44 = i4 + 1;
                            ResultSet rs = stmt.executeQuery("SELECT distance FROM trainstations WHERE sno BETWEEN '" + i44 + "' AND '" + i5 + "'");
                            while (rs.next()) {
                                totalTime += rs.getInt("distance");
                            }
                        } else {
                            int i55 = i5 + 1;
                            ResultSet rs = stmt.executeQuery("SELECT distance FROM trainstations WHERE sno BETWEEN '" + i55 + "' AND '" + i4 + "'");
                            while (rs.next()) {
                                totalTime += rs.getInt("distance");
                            }
                        }
                        
                        con.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                    
                    out.println("<div class=' text-center'>");
                    out.println("<p><strong>The Travelling Time is:</strong> <span style='color:red;'>" + totalTime + " Minutes</span></p>");
                    out.println("</div>");
                %>
            </div>
        </div>
    </div>
</section>
</body>
</html>
