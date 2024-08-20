<%@ page language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>
<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
    <title>Train Checker</title>
    <meta charset="UTF-8">
</head>
<body>

<%
    int totalKm = 0;
    
    // Calculate the total distance if needed
    try {
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
        Statement s2 = c2.createStatement();
        ResultSet rs2 = s2.executeQuery("SELECT SUM(distance) as total_distance FROM trainstations");
        if (rs2.next()) {
            totalKm = rs2.getInt("total_distance");
        }
        rs2.close();
        s2.close();
        c2.close();
    } catch (Exception es) {
        out.println("Error calculating total distance: " + es.getMessage());
    }

    String trainName = request.getParameter("fair");
    String e1 = request.getParameter("timepick");
    
    session.setAttribute("e1", e1);
    
    SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");
    Date currentTime = timeFormatter.parse(e1);
    
    // Calculate the time one hour before the current time
    long oneHourBeforeMillis = currentTime.getTime() - (60 * 60 * 1000);
    Date oneHourBefore = new Date(oneHourBeforeMillis);
    String oneHourBeforeStr = timeFormatter.format(oneHourBefore);
    
    // Check for trains running between one hour before and the current time
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail", "root", "ganesha464");
        Statement stm = con.createStatement();
        
        String query = "SELECT * FROM traintime WHERE starttime <= ? AND endtime >= ? AND no = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, e1); // Current time
        ps.setString(2, oneHourBeforeStr); // One hour before current time
        ps.setString(3, trainName); // Train name
        
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            // Train is available within the time range
            session.setAttribute("fair", rs.getString("starttime"));
            session.setAttribute("reverse", "not");
            
            response.sendRedirect("where1.jsp");
        } else {
            // Train is not available within the time range
            session.setAttribute("trainname", trainName);
            session.setAttribute("e1", e1);
            session.setAttribute("xxx", oneHourBeforeStr);
            session.setAttribute("reverse", "reverse");
            
            response.sendRedirect("where01.jsp");
        }
        
        rs.close();
        ps.close();
        stm.close();
        con.close();
    } catch (Exception es) {
        out.println("Error fetching train data: " + es.getMessage());
    }
%>

</body>
</html>
