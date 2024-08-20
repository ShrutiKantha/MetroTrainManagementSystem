<%@ page contentType="text/html; charset=" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<?php
$username="your username";              // username you got from 160by2.com website
$password="your password";             //your password
$to="99956xxxxx";                           //Phone number to send msg
$msg="TEST";                //Message to  send you can use url encode function if space exist in your message
echo('<a href="http://pravysoft.eu5org/sms.php?username='.$username.'&password='.$password.'&button=1&to='.$to.'&msg='.$msg.'">SEND SMS</a>');
?>


<%

String username="9566193155";

String password="232323"; 
String to="9566193155";  
String msg="TEST"; 
<a href="http://pravysoft.eu5org/sms.php?<%=id%>"></a>







/*
sendsms.init();
sendsms.server = “http://192.168.1.4/”;
sendsms.user = “9566193155”;
sendsms.password = “232323”;
sendsms.phonenumber = “+9566193155?;
sendsms.text = “This is a test message”;
sendsms.send();
*/

%>

</body>
</html>
