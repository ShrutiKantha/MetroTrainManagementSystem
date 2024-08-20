<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>

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
            <a href="index.html"><img src="images/logo.jpeg" alt="Logo"></a>
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

        <div id="right_">
            <h2>Pay For This Ticket Amount</h2>
            <%
                String vid = (String) session.getAttribute("Voterid");
                String name = (String) session.getAttribute("Name");
                String station1 = request.getParameter("fair");
                String station2 = request.getParameter("fair1");
                String now = request.getParameter("now");
                session.setAttribute("now", now);
            %>
            
            <div class="form-wrapper">
                <form name="f2" action="ticket1.jsp" method="post" onsubmit="return reg()">
                    <div class="form-group">
                        <label>Current Date:</label>
                        <input type="text" name="now" class="form-control" readonly value="<%= new java.util.Date() %>">
                    </div>
                    <div class="form-group">
                        <label>Voter ID:</label>
                        <input type="text" name="voterId" class="form-control" value="<%= vid %>" readonly placeholder="Voter ID">
                    </div>
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="name" class="form-control" value="<%= name %>" readonly placeholder="Name">
                    </div>
                    
                    <%
                        // Process fare and fare1 parameters and calculate the total amount.
                        String fare = request.getParameter("fair");
                        session.setAttribute("fair", fare);
                        String fare1 = request.getParameter("fair1");
                        session.setAttribute("fair1", fare1);
                        int i4 = Integer.parseInt(fare);
                        int i5 = Integer.parseInt(fare1);
                        int difference = i5 - i4;

                        if (difference > 0) {
                            // If fare1 is greater than fare, calculate the distance and amount
                            int totalDistance = 0;
                            try {
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT distance FROM trainstations WHERE sno BETWEEN '" + (i4 + 1) + "' AND '" + i5 + "'");
                                while (rs.next()) {
                                    totalDistance += rs.getInt("distance");
                                }
                                int totalAmount = totalDistance + 3; // Assuming some fixed cost of 3
                                con.close();
                            %>

                            <div class="form-group">
                                <label>The Amount: RS.</label>
                                <input type="text" name="total" class="form-control" value="<%= totalAmount %>" readonly>
                            </div>
                            <%
                            } catch (Exception e) {
                                out.println("Error calculating total amount: " + e.getMessage());
                            }
                        } else {
                            // If fare is greater than fare1, calculate the distance and amount
                            int totalDistance = 0;
                            try {
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT distance FROM trainstations WHERE sno BETWEEN '" + (i5 + 1) + "' AND '" + i4 + "'");
                                while (rs.next()) {
                                    totalDistance += rs.getInt("distance");
                                }
                                int totalAmount = totalDistance + 3; // Assuming some fixed cost of 3
                                con.close();
                            %>
                            <div class="form-group">
                                <label>The Amount: RS.</label>
                                <input type="text" name="total" class="form-control" value="<%= totalAmount %>" readonly>
                            </div>
                            <%
                            } catch (Exception e) {
                                out.println("Error calculating total amount: " + e.getMessage());
                            }
                        }
                    %>

                    <div class="form-group">
                        <label>Select Bank:</label>
                        <select name="bank" class="form-control">
                            <option value="select">--Select Bank--</option>
                            <option value="IndianBank">IndianBank</option>
                            <option value="IndianOverseasBank">IndianOverseasBank</option>
                            <option value="HDFC">HDFC</option>
                            <option value="ICICI">ICICI</option>
                            <option value="StateBank">StateBank</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Bank PIN Number:</label>
                        <input type="text" name="pin" class="form-control" placeholder="Enter Bank PIN">
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="pass" class="form-control" placeholder="Enter Password">
                    </div>
                    <div class="form-group">
                        <label>Amount Entered:</label>
                        <input type="number" name="amt" class="form-control" placeholder="Enter Amount" min="0">
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" name="submit" class="btn btn-primary">PAY FOR IT</button>
                        <button type="reset" name="reset" class="btn btn-secondary">RESET</button>
                    </div>
                </form>
            </div>
        </div>
		<br>
		<br>
    </section>
</body>

</html>
