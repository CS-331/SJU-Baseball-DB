<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="user" class="login.User" scope="session" />
<jsp:setProperty name="user" property="*"/>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Pitcher Stats</title>
	</head>
	<body>
		<a href="home.jsp"><img src="sju-baseball.jpg" width="50" height="50"></a>
    	<h1>Pitcher Dashboard</h1>
	   	<form action="pitcher" method="get">
	        <h4>Select a Pitcher</h4>
	        <select name="pitcher">
	            <c:forEach items="${pitcherList}" var="pitcher">
	                <option value="${pitcher.getfName()} ${pitcher.getlName()}">
	                    ${pitcher.getfName()} ${pitcher.getlName()}
	                </option>
	            </c:forEach>
	        </select>
	        <br>
	        <br>
	        <input type="submit" value="Submit" />
	    </form>
	</body>
</html>