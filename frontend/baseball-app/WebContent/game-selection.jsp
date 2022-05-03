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
    <form action="pitches" method="get">
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
        
        <h4>Select An Inning</h4>
        <select name="inning">
        	<option value="None">None</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>   
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option> 
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>        
        </select>
        
        <h4>Game Statistics</h4>
        <select name="options">
        	<option value="None">None</option>
            <option value="numPitchType">Get Number Of Pitches For Each Pitch Type</option>
            <option value="numPitches">Get Number Of Pitches Thrown in Game</option>
            <option value="percentHits">Get % Of Pitches Resulting In A Hit</option>
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