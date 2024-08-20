<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.util.date.*,java.util.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
String newname=request.getParameter("newname");
String newkm=request.getParameter("newkm");
String nextname=(String)session.getAttribute("nextstation");
String nextkm=request.getParameter("nextkm");


try
{
Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("update temp set distance='"+nextkm+"' where stations='"+nextname+"'");
ps.executeUpdate();

}
catch(Exception e1)
{
out.println(e1.getMessage());
}



Connection con12=null;
Statement st12=null;
ResultSet rs12=null;
String ff=null;
try
{
con12=databasecon.getconnection();
st12=con12.createStatement();
rs12=st12.executeQuery("select max(sno) from trainstations");
while(rs12.next())
{
 ff=rs12.getString(1);
// out.print(ff);
}
}
catch(Exception e12)
{
out.println(e12.getMessage());
}

int ff1=Integer.parseInt(ff);
int ff11=ff1+1;
String ff2 = String.valueOf(ff11);

Connection c11=null;
PreparedStatement p11=null;
try
{
c11=databasecon.getconnection();
p11=c11.prepareStatement ("insert into trainstations (sno,stations,distance) values (?,?,?)");

p11.setString(1,ff2);
p11.setString(2,newname);
p11.setString(3,newkm);

int x1=p11.executeUpdate();
            
 }
 catch(Exception e)
  {
   out.println(e.getMessage());
    }















Connection con10=null;
Statement st10=null;
ResultSet rs10=null;
String sno=null,station=null,distance=null;
try
{
con10=databasecon.getconnection();
st10=con10.createStatement();
rs10=st10.executeQuery("select sno,stations,distance  from temp");
while(rs10.next())
{
 sno=rs10.getString(1);
 //out.print(sno);
 station=rs10.getString(2);
  //out.print(station);
 distance=rs10.getString(3);
  //out.print(distance);
int sno1=Integer.parseInt(sno);
int sno11=sno1+1;
String sno2 = String.valueOf(sno11);
Connection c1=null;
PreparedStatement p1=null;
try
{
c1=databasecon.getconnection();
p1=c1.prepareStatement ("insert into trainstations (sno,stations,distance) values (?,?,?)");

p1.setString(1,sno2);
p1.setString(2,station);
p1.setString(3,distance);
int x=p1.executeUpdate();
            
 }
 catch(Exception e)
  {
   out.println(e.getMessage());
    }

Connection c2=null;
try
{
c2=databasecon.getconnection();
PreparedStatement p2=c2.prepareStatement("delete from temp");
p2.executeUpdate();

}
catch(Exception e2)
{
out.println(e2.getMessage());
}



}
}
catch(Exception e)
{
out.println(e.getMessage());
}

response.sendRedirect("alogin.jsp");

%>
</body>
</html>
