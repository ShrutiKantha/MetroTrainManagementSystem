<%@ page language="java" import="databaseconnection.*,java.sql.*" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


</head>

<body>
 <%
		String email=request.getParameter("email");
		//out.print(email);
		String password=request.getParameter("pass");
		//out.print(password);
	
		
		try
		{		
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/metrorail","root","ganesha464");
		Statement stm=conn.createStatement();
		ResultSet rs=stm.executeQuery("select * from user where email='"+email+"' and password='"+password+"' ");
		if(rs.next())
		{
		
		String Name=rs.getString("name");
		session.setAttribute("Name",Name);
		
		String Voterid=rs.getString("voterid");
		session.setAttribute("Voterid",Voterid);
		
		
		String e=rs.getString("email");
		String p=rs.getString("password");
		
		//out.print(e);
		//out.print(p);
		
		
		//if(email.equals(e) && password.equals(p))
		//{
		response.sendRedirect("userfront.jsp");
		}
		else
		{
		response.sendRedirect("wronglogin.jsp");
		}
		
		}
		catch(Exception e)
		{
		out.println(e);
		}
		
	  %>
	  
</body>
</html>
