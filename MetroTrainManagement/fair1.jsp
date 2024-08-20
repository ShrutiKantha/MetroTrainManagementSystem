<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <title>Travelling Train</title>
    <meta charset="UTF-8" />
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet" type="text/css" />
	<style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white; /* White background */
            padding: 30px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Top margin */
            width: 400px; /* Width of the form box, adjust as needed */
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
            <a href="index.html"><img src="images/logo (1).jpeg" style="border-radius: 50%;"></a>
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
                <div class="col-md-8 form-wrapper"> <!-- Adjusted form width -->
                    <h2 class="text-center">Travelling Fair</h2>
					<br>
                    <% 
                    // Variables for user input
                    String fair = request.getParameter("fair");
                    String fair1 = request.getParameter("fair1");

                    if (fair != null && fair1 != null) {
                        int i4 = Integer.parseInt(fair);
                        int i5 = Integer.parseInt(fair1);

                        int totalDistance = 0;
                        String message = "";

                        // Determine the direction of travel
                        if (i5 > i4) {
                            int start = i4 + 1;
                            int end = i5;

                            // Calculate distance
                            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                 PreparedStatement ps = con.prepareStatement("SELECT distance FROM trainstations WHERE sno BETWEEN ? AND ?")) {
                                ps.setInt(1, start);
                                ps.setInt(2, end);

                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    totalDistance += rs.getInt("distance");
                                }
                            } catch (SQLException e) {
                                out.println("Database error: " + e.getMessage());
                            }
                        } else if (i5 < i4) {
                            int start = i5 + 1;
                            int end = i4;

                            // Calculate distance
                            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                 PreparedStatement ps = con.prepareStatement("SELECT distance FROM trainstations WHERE sno BETWEEN ? AND ?")) {
                                ps.setInt(1, start);
                                ps.setInt(2, end);

                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    totalDistance += rs.getInt("distance");
                                }
                            } catch (SQLException e) {
                                out.println("Database error: " + e.getMessage());
                            }
                        }

                        // Calculate total fare
                        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                             PreparedStatement ps = con.prepareStatement("SELECT amount FROM amount WHERE no = 1")) {
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                int perKmRate = rs.getInt("amount");
                                int totalFare = (totalDistance * perKmRate) + 3;
                                message = "The Travelling Fare is: RS " + totalFare + ".00";
                            }
                        } catch (SQLException e) {
                            out.println("Database error: " + e.getMessage());
                        }

                        // Display the message
                        if (!message.isEmpty()) {
                            out.println("<div class='alert alert-success'>" + message + "</div>");
                        }
                    }
                    %>
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
