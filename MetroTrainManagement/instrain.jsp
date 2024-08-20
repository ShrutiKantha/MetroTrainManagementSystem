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
ps=conn.prepareStatement ("insert into traintime (trainname,starttime,endtime) values (?,?,?)");

String name=request.getParameter("name");
out.print(name);
String starttime=request.getParameter("stime1");
out.print(starttime);
String returntime=request.getParameter("timepick");
out.print(returntime);

ps.setString(1,name);
ps.setString(2,starttime);
ps.setString(3,returntime);

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
