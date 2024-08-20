<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Travelling Train</title>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet" type="text/css">
    <!-- Custom JavaScript -->
    <script type="text/javascript" src="datetimepicker.js"></script>
    <script type="text/javascript" src="script.js"></script>
    <style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            width: 700px;
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
   

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 form-wrapper">
                <h2 class="text-center">Find Present Train</h2>

                <form name="f2" action="ticketamount.jsp" method="post">
                    <table class="table">
                        <tr>
                            <td colspan="2">
                                <input type="text" name="now" readonly value="<%= new java.util.Date() %>" class="form-control">
                            </td>
                        </tr>
                        <tr>
                          <td>
                            <label for="voterId">Voter ID:</label>
                        </td>
                        <td>
                            <input type="text" id="voterId" placeholder="Enter Voter ID" value="<%= (String) session.getAttribute("Voterid") %>" readonly class="form-control">
                        </td>
                        </tr>
                        <tr>
                          <td>
                            <label for="name">Name:</label>
                        </td>
                        <td>
                            <input type="text" id="name" placeholder="Enter Name" value="<%= (String) session.getAttribute("Name") %>" readonly class="form-control">
                        </td>
                        </tr>
                        <tr>
                            <td><label for="from">From:</label></td>
                            <td>
                                <select name="fair" id="from" class="form-control">
                                    <option value="select">--Select Station 1--</option>
                                    <%
                                        try {
                                          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                          Statement stmt = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("SELECT * FROM trainstations");
                                            while (rs.next()) {
                                    %>
                                    <option value="<%= rs.getString("sno") %>"><%= rs.getString("stations") %></option>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            out.println("Error fetching stations: " + e.getMessage());
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="to">To:</label></td>
                            <td>
                                <select name="fair1" id="to" class="form-control">
                                    <option value="select">--Select Station 2--</option>
                                    <%
                                        try {
                                          Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                          Statement stmt1 = con1.createStatement();
                                            ResultSet rs1 = stmt1.executeQuery("SELECT * FROM trainstations");
                                            while (rs1.next()) {
                                    %>
                                    <option value="<%= rs1.getString("sno") %>"><%= rs1.getString("stations") %></option>
                                    <%
                                            }
                                            con1.close();
                                        } catch (Exception e) {
                                            out.println("Error fetching stations: " + e.getMessage());
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="submit" value="Get Ticket" class="btn btn-primary btn-block">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <span style="color: red;">* This ticket is valid up to 03:00 hours only.</span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
  </section>
</body>

</html>
