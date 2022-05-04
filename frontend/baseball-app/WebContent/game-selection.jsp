<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="user" class="login.User" scope="session" />
<jsp:setProperty name="user" property="*"/>    
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SJU Pitcher Home Page</title>
</head>
<body>
    <a href="home.jsp"><img src="sju-baseball.jpg" width="50" height="50"></a>
    <h1>Game Dashboard</h1>
    <form action="pitches" method="post">
        <h4>Select a Game</h4>
        <select name="game">
            <c:forEach items="${gameList}" var="game">
                <option value="${game.getOpposingTeam()}"
                    <c:if test="${game.getOpposingTeam() eq teamId}">selected="selected"</c:if>
                    >
                    ${game.getOpposingTeam()}
                </option>
            </c:forEach>
        </select>
        
        <h4>Select A Date</h4>
        <label>Date (YYYY-MM-DD): <input type="text" name="gameDate"/></label>
        
        <h4>Game Statistics</h4>
        <select name="options">
        	<option value="None">None</option>
            <option value="percentHits">Get % Of Pitches Resulting In A Strike</option>
            <c:if test="${user.getType() == 1}">
            <option value="edit">Edit Game Data</option>
            </c:if>
          
        </select>
        <br>
        <br>
        <input type="submit" value="Submit" />
    </form>
</body>
</html>
