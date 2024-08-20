<%@ page language="java" import="java.sql.*, databaseconnection.*" %>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Train Crossed Station</title>
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
            <a href="index.html"><img src="images/logo.jpeg" style="border-radius: 50%;" alt="Logo"></a>
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
<div class="form-wrapper">
    <h2 class="text-center">Train Crossed Station</h2>

    <form name="f2" action="fair1.jsp" method="post" onsubmit="return reg()">
        <table width="100%"  align="center" height="200">
            <tr><td colspan="2" height="60"></td></tr>

            <%
                int sno = (Integer) session.getAttribute("sno");
                String reverseDirection = (String) session.getAttribute("reverse");
                String trainCrossedStation = "";
                String trainDirection = "";

                if (reverseDirection.equals("not")) {
                    int correctSno = sno - 1;

                    try {
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT stations FROM trainstations WHERE sno = '" + correctSno + "'");

                        if (rs.next()) {
                            trainCrossedStation = rs.getString("stations");
                            trainDirection = "Forte ======>>>> KK Nagar";
                        }
                    } catch (SQLException e) {
                        out.println("Error retrieving data: " + e.getMessage());
                    }

                } else {
                    int correctSno = sno + 1;

                    try {
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT stations FROM trainstations WHERE sno = '" + correctSno + "'");

                        if (rs.next()) {
                            trainCrossedStation = rs.getString("stations");
                            trainDirection = "KK Nagar ======>>>> Forte";
                        }
                    } catch (SQLException e) {
                        out.println("Error retrieving data: " + e.getMessage());
                    }
                }
            %>

            <tr>
                <td align="center"><font color="#CC0033" size="+2"><%= trainDirection %></font></td>
            </tr>
            <tr>
                <td align="center">
                    <font color="#CC0033" size="+2">The Train Crossed Station is</font>
                    <font color="#3300FF" size="+2"> <%= trainCrossedStation %></font>
                </td>
            </tr>
            
            <tr><td colspan="2" height="20"></td></tr>
            <tr>
                <td colspan="2" align="center"></td>
            </tr>
            <tr><td height="100"></td><td height="100"></td></tr>
        </table>
    </form>
</div>

<div align="center"></div>
</body>
</html>
