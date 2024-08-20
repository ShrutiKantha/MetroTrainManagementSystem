<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>


<html>
<head>
<title>Travelling Train</title>
</head>
<script language="javascript" type="text/javascript" src="datetimepicker.js">
</script>

<script type="text/javascript">

function timepicker()
{



var d = new Date();
d.setMinutes(d.getMinutes() + timepicker.h);
var p = function(n){return ':' + (n < 10? '0' + n : n);
},
h = d.getHours(),
m = p(d.getMinutes()),
//s = p(d.getSeconds()),
ampm = h >= 24? 'PM' : 'AM';
h = h%24 || 24;
h = h < 10? '\xa0' + h : h;
document.forms[0].elements['timepick'].value = h + m;
timepicker.timer = setTimeout(timepicker, 1000);
};
timepicker.h = 0;
timepicker.updown = function(n)
{
clearTimeout(timepicker.timer);
timepicker.h += n;
timepicker();
};
window.onload = timepicker;
</script>




<body>




 <%
  String time=(String)session.getAttribute("time");
  out.print(time);
session.setAttribute("time",time);
 
Connection con10=null;
Statement st10=null;
ResultSet rs10=null;
String ff=null;
try
{
con10=databasecon.getconnection();
st10=con10.createStatement();
rs10=st10.executeQuery("select max(sno) from trainstations");
while(rs10.next())
{
 ff=rs10.getString(1);
 //out.print(ff);
}
}
catch(Exception e)
{
out.println(e.getMessage());
}
		
 

 int count1=Integer.parseInt(ff);
 //out.print(count1); 
 
 
  
 String d1=(String)session.getAttribute("d1");
 //out.print(d1);
 int distance=Integer.parseInt(d1);
 

String traintime=request.getQueryString();
 //out.print(traintime);
 
 


if(count1!=distance)

{

        int start=1;
        int count=0;
		
		
		int distance11= distance+1;

        try
		{		
		Connection con1=databasecon.getconnection();
		Statement stm1=con1.createStatement();
		ResultSet rs1=stm1.executeQuery("select distance from trainstations where sno BETWEEN '"+distance11+"' AND '"+count1+"' ");
		while(rs1.next())
		{
		String tims=rs1.getString(1);
		
		int dis=Integer.parseInt(tims);
		//out.print(dis);
		count=count+dis;
	
		

        }
	
		//out.print(count);
	
Date date = new SimpleDateFormat("hh:mm").parse(traintime);
String a2= new SimpleDateFormat("hh:mm aa").format(date);

String a3= new SimpleDateFormat("mm").format(date);
String a4= new SimpleDateFormat("hh").format(date);
int i4=Integer.parseInt(a4);
String aaa= new SimpleDateFormat("aa").format(date);
int i3=Integer.parseInt(a3);
int result=i3+count;
if(result>=60)
{
i4=i4+1;
result=result-60;
String reee = String.valueOf(result);
String expecttime=i4+":"+reee+aaa;
out.print(expecttime);
session.setAttribute("expecttime",expecttime);
response.sendRedirect("present2.jsp");
}
else
{

String reee = String.valueOf(result);
String expecttime=a4+":"+reee+aaa;
//out.print(expecttime);

session.setAttribute("expecttime",expecttime);
response.sendRedirect("present2.jsp");
}
			
	
        }
       catch(Exception e)
        {
        out.println(e);
        }

 
 
 
 
 }
 else
 {
 
 
 
 

Date date = new SimpleDateFormat("hh:mm").parse(traintime);
String expecttime= new SimpleDateFormat("hh:mm aa").format(date);
session.setAttribute("expecttime",expecttime);

//out.println(expecttime);

 response.sendRedirect("present2.jsp");
// out.println("Distance single");
 }
 
 
 

 
 
 
 
 

 
 
 %>
 </body>
</html>
