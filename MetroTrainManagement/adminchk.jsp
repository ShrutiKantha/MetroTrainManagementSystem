<%@ page import="java.sql.*" %>
<html>
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
	.form-wrapper {
            background-color: white; /* White background */
            padding: 40px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Add top margin */
            width: 500px;
            margin: auto; /* Center the box */
        }
	</style>
	</head>
<body>
	<section class="header">
		<nav>
		   <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;"></a>
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
		<div class="text-box">
    <h1>
        <%
            // Get parameters from request
            String uname = request.getParameter("txt_uname");
            String pwd = request.getParameter("txt_pwd");

            // Initialize database connection
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM admin WHERE user_name=? AND password=?");
                pstmt.setString(1, uname);
                pstmt.setString(2, pwd);
                
                // Execute the query
                ResultSet rs = pstmt.executeQuery();
                
                // Check if there is a match
                if (rs.next()) {
                    out.println("Welcome: " + uname);
        %>
                    
        <%
                } else {
                    // If username or password is incorrect
                    out.println("Invalid Password or User Name");
        %>
                    <div style="text-align: center;">
                        <a id="log" href="admin.jsp">
                            <button type="button" class="btn btn-info">Try again</button>
                        </a>
                    </div>
        <%
                }
                
                // Close the database connection
                con.close();
            } catch (SQLException e) {
                // Handle SQL exception
                out.println("An error occurred: " + e.getMessage());
        %>
                <div style="text-align: center;">
                    <a id="log" href="Login.jsp">
                        <button type="button" class="btn btn-info">Try again</button>
                    </a>
                </div>
        <%
            } catch (ClassNotFoundException e) {
                // Handle class not found exception
                out.println("JDBC Driver not found: " + e.getMessage());
        %>
                <div style="text-align: center;">
                    <a id="log" href="Login.jsp">
                        <button type="button" class="btn btn-info">Try again</button>
                    </a>
                </div>
        <%
            }
        %>
    </h1>
	</div>
</section>
</body>
</html>
