<%@ page import="java.sql.*,databaseconnection.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

    String name=request.getParameter("name");
    String voterid=request.getParameter("vidno");
    String password=request.getParameter("pass");
    String email=request.getParameter("email");
    String dob=request.getParameter("dob");
    String gender=request.getParameter("gender");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail","root","ganesha464");
        Statement stmt=conn.createStatement();
        int i=stmt.executeUpdate("insert into new_table (name,voterid,password,email,dob,gender,mobile,address) values ('"+name+"','"+voterid+"','"+password+"','"+email+"','"+dob+"','"+gender+"','"+mobile+"','"+address+"')");
        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        out.print(e);
        e.printStackTrace();
    }
%>

</body>
</html>
