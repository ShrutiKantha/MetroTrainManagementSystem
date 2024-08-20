<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <title>Train Schedule</title>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet" type="text/css">

    <style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            width: 500px;
            margin: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
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
                    <li><a href="index.html">HOME</a></li>
                    <li><a href="routemap.jsp">ROUTE MAP</a></li>
                <li><a href="contact.jsp">CONTACT</a></li>
                <li><a href="userlogin.jsp">USERLOGIN</a></li>
                <li><a href="admin.jsp">ADMIN</a></li>
                </ul>
            </div>
        </nav>
 
    <main class="form-wrapper">
        <section>
            <h2 class="text-center">Train Schedule</h2>

            <!-- Form to display train schedule -->
            <form name="f2" method="post">
                <table align="center">
                    <thead>
                        <tr>
                            <th>Train Name</th>
                            <th>Leave From Forte</th>
                            <th>Leave From KK Nagar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Declare variables to store train data
                            String trainName, departureTime, returnTime;

                            // Establish database connection and execute query
                            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                 PreparedStatement ps = conn.prepareStatement("SELECT trainname, starttime, endtime FROM traintime");
                                 ResultSet rs = ps.executeQuery()) {
                                // Iterate through the result set and display data
                                while (rs.next()) {
                                    trainName = rs.getString("trainname");
                                    departureTime = rs.getString("starttime");
                                    returnTime = rs.getString("endtime");
                        %>
                        <tr>
                            <td><%= trainName %></td>
                            <td><%= departureTime %></td>
                            <td><%= returnTime %></td>
                        </tr>
                        <%
                                }
                            } catch (SQLException e) {
                                out.println("Error retrieving data: " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </form>
        </section>
    </main>
    <br>
    <br>
</section>

</body>

</html>
