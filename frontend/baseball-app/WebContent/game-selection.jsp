<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="game" class="SJUBaseball.GameDAO" scope="session" />
<jsp:setProperty name="game" property="*"/> 

<jsp:useBean id="user" class="login.User" scope="session" />
<jsp:setProperty name="user" property="*"/>    
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SJU Pitcher Home Page</title>
</head>
<body>
<div align="center">
    <h2>Game List {user.getType()}</h2>
    <form action="pitches" method="get">
        Select a Game:&nbsp;
        <select name="game">
            <c:forEach items="${gameList}" var="game">
                <option value="${game.getOpposingTeam()}"
                    <c:if test="${game.getOpposingTeam() eq teamId}">selected="selected"</c:if>
                    >
                    ${game.getOpposingTeam()}
                </option>
            </c:forEach>
        </select>
        <select name="option">
            <option value="option1">1</option>
            <option value="option2">2</option>
          
        </select>
        <input type="submit" value="Submit" />
    </form>
</div>
</body>
</html>