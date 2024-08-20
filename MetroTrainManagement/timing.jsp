<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <title>Travelling Train</title>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style>
        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white; /* White background */
            padding: 40px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Add top margin */
            width: 500px;
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
    <script type="text/javascript">
        function validateForm() {
            var fromStation = document.forms["f2"]["fair"].value;
            var toStation = document.forms["f2"]["fair1"].value;
            if (fromStation === "select") {
                alert("Please select a starting station.");
                return false;
            }
            if (toStation === "select") {
                alert("Please select an ending station.");
                return false;
            }
            if (fromStation === toStation) {
                alert("Starting and ending stations cannot be the same.");
                return false;
            }
        }
    </script>
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
                    <h2 class="text-center">Find Travelling Time</h2>
                    <form name="f2" action="timing1.jsp" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="fair">From</label>
                            <select name="fair" id="fair" class="form-control">
                                <option value="select">--Select Station 1--</option>
                                <% 
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("SELECT * FROM trainstations");
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
                                <% 
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("SELECT * FROM trainstations");
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
                        <div class="form-group text-center">
                            <input type="submit" name="submit" value="Show Me Timing" class="btn btn-primary">
                        </div>
                        <div class="text-center">
                            <a href="present.jsp">Train At Present Time</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
