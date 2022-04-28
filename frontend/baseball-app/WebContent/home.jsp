<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="user" class="login.User" scope="session" />
 <jsp:setProperty name="user" property="*"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SJU Pitcher Home Page</title>
</head>
<body>
TODO HOME PAGE
<%
Integer type = user.getType();
String msg;
if(type == 0)
{
	msg = "Player";
}
else
{
	msg = "Coach";
}
out.println("<br><a>" + msg + "</a><br>");
out.println("<a href='login.html'> <button>logout</button></a>");
%>

</body>
</html>