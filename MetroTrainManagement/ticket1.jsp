<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Include your custom CSS if any -->
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
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
<div class="container mt-5"> 
    <div class="row">
        <div class="col-12"> 
            <h1 class="text-center">MetroTrain Ticket</h1>
            <div class="card">
                <div class="card-body" >
                    <% 
                    String vid = (String) session.getAttribute("Voterid");
                    String name = (String) session.getAttribute("Name");
                    String station1 = (String) session.getAttribute("fair");
                    String station2 = (String) session.getAttribute("fair1");
                    String now = (String) session.getAttribute("now");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                    Statement stm = con.createStatement();
                    ResultSet rs = stm.executeQuery("SELECT stations FROM trainstations WHERE sno = '" + station1 + "'");
                    String stat1 = "";
                    if (rs.next()) {
                        stat1 = rs.getString(1);
                    }

                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
                    Statement stm1 = con1.createStatement();
                    ResultSet rs1 = stm1.executeQuery("SELECT stations FROM trainstations WHERE sno = '" + station2 + "'");
                    String stat2 = "";
                    if (rs1.next()) {
                        stat2 = rs1.getString(1);
                    }
                    %>
                    <p><strong>Date and Time:</strong> <%= now %></p>
                    <p><strong>Name:</strong> <%= name %></p>
                    <p><strong>Voter ID:</strong> <%= vid %></p>
                    <p><strong>From:</strong> <%= stat1 %></p>
                    <p><strong>To:</strong> <%= stat2 %></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-12">
            <table class="table table-bordered">
                <tr>
                    <td class="text-center">
                        <button class="btn btn-primary" onclick="printpage();">Print this page</button>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <span style="color: red;">* This ticket is valid up to 03:00 Hrs only.</span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script>
function printpage() {
    window.print();
}
</script>
</body>
</html>
