<%@ page import="java.sql.*,databaseconnection.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Connection conn=null;
PreparedStatement ps=null;

try
{

conn=databasecon.getconnection();
ps=conn.prepareStatement ("insert into trainstations (stations,distance) values (?,?)");


String starttime=request.getParameter("station");
out.print(starttime);
String returntime=request.getParameter("km");
out.print(returntime);

ps.setString(1,starttime);
ps.setString(2,returntime);


int x=ps.executeUpdate();

            if(x==0)
                {
                response.sendRedirect("alogin.jsp");}
            else
                {
                response.sendRedirect("alogin.jsp");
                }
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
   
%>

</body>
</html>
