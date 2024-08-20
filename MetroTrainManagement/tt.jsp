<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
ampm = h >= 12? 'PM' : 'AM';
h = h%12 || 12;
h = h < 10? '\xa0' + h : h;
document.forms[0].elements['timepick'].value = h + m  + ampm;
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

</head>

<body>



<myTag:showDate/>


<form name="f2" action="timepick1.jsp" method="post" onsubmit="return reg()">

 <%
 
 
 
	
	
		try
		{		
		Connection con=databasecon.getconnection();
		Statement stm=con.createStatement();
		ResultSet rs=stm.executeQuery(" SELECT * from  traintime");
		while(rs.next())
		{
		String e=rs.getString("starttime");
		
		
		%> 

<%
Date date = new SimpleDateFormat("hh:mm").parse(e);
String a2= new SimpleDateFormat("hh:mm").format(date);
//out.print(a2);
String a3= new SimpleDateFormat("mm").format(date);
//out.print(a3);
String a4= new SimpleDateFormat("hh").format(date);
int i4=Integer.parseInt(a4);


//out.print(a4);
int i3=Integer.parseInt(a3);
int cou=40;
int result=i3+cou;
//out.print(result);

if(result>=60)
{
i4=i4+1;
//out.print(i4);

result=result-60;
//out.print(result);
String reee = String.valueOf(result);
String xxx=i4+reee;

xxx = new StringBuffer(xxx).insert(xxx.length()-2, ":").toString();
//out.print(xxx);
Date de = new SimpleDateFormat("hh:mm").parse(xxx);
String ak= new SimpleDateFormat("hh:mm").format(de);
out.print(ak);



}
else
{

String reee = String.valueOf(result);
//out.print(reee);

String xxx1=a4+reee;
//out.print(xxx1);

xxx1 = new StringBuffer(xxx1).insert(xxx1.length()-2, ":").toString();
//out.print(xxx);
Date de = new SimpleDateFormat("hh:mm").parse(xxx1);
String ak= new SimpleDateFormat("hh:mm").format(de);
out.print(ak);


}








 %>
 
	
	
		
		
		<%
		}
		}
		catch(Exception e)
		{
		out.println(e);
		}
		%>
		
	
		
	
		
	  
</body>
</html>
