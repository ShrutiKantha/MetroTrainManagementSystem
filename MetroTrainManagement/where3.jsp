<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Travelling Train</title>
    <meta charset="UTF-8" />
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style>
        /* Set white background color for the body */
        body {
            background-color: white;
        }

        /* Styling for the form wrapper */
        .form-wrapper {
            background-color: white; /* White background */
            padding: 30px; /* Padding around the form */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Box shadow */
            margin-top: 30px; /* Top margin */
            width: 400px; /* Width of the form box */
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
                    <li><a href="timing.jsp">TIMINGS</li></a>
                    <li><a href="index.html">LOGOUT</a></li>
                </ul>
            </div>
        </nav>

        <div class="form-wrapper">
            <h2 class="text-center">Train Crossed Station</h2>
            <form name="f2" action="fair1.jsp" method="post" onsubmit="return reg()">
                <table width="100%">
                    <tr>
                        <td colspan="2" height="60"></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <font color="#CC0033" size="+2">The Train is Not Available for Now </font>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" height="20"></td>
                    </tr>
                </table>
            </form>
        </div>
    </section>
</body>

</html>
