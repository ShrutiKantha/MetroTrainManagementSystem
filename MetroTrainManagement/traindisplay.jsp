<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="shortcut icon" type="x-icon" href="media/icon.png">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.*"%>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
%>
<html>
    <head>
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

<!--<link rel="stylesheet" href="css/style.css">-->
<link rel="stylesheet" href="css/display.css">
<link rel="shortcut icon" type="x-icon" href="media/icon.png">
<table cellspacing="20" cellpadding="10">
<tr id="mcells">
<td >id</td>
<td>Train Name</td>
<td>Departure Time</td>
<td>Return Time</td>
</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/metro","root","root");
    stmt=conn.createStatement();
    String sql = ("select * from total_trains");
    rs= stmt.executeQuery(sql);
    while(rs.next()){
    %>
        <tr>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("Train Name") %></td>
        <td><%=rs.getString("Departure Time") %></td>
        <td><%=rs.getString("Return Time") %></td>
       
        </tr>
    <%
    }
conn.close();
} 
catch (Exception e)
{
    e.printStackTrace();
}
%>
</table>
</body>
</html>