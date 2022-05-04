<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SJUBaseball.GameDAO"%>
<%@page import="SJUBaseball.PitcherDAO"%>
<%@page import="SJUBaseball.Game"%>
<%@page import="SJUBaseball.Pitcher"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
GameDAO game_dao = new GameDAO();
PitcherDAO pitcher_dao = new PitcherDAO();
List<Game> gameList = game_dao.getGames();
List<Pitcher> pitcherList = pitcher_dao.getPitchers();
pageContext.setAttribute("gameList", gameList);
pageContext.setAttribute("pitcherList", pitcherList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enter New Pitch</title>
</head>
<body>
<div>
<h2>Enter Pitch</h2>
<form name="play" action="addPitch.jsp" method="post">
<h3>Game Date</h3>
<select name="date">
	<c:forEach items="${gameList}" var="game">
    	<option value="${game.getDate()}">
                    ${game.getDate()}
    	</option>
	</c:forEach>
</select>
<h3>Opposing Team</h3>
<select name="opposingTeam">
	<c:forEach items="${gameList}" var="game">
    	<option value="${game.getOpposingTeam()}">
                    ${game.getOpposingTeam()}
    	</option>
	</c:forEach>
</select>
<h3>Inning</h3>
<select name="inningId">
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
<h3>Player</h3>
<select name="pitcherId">
	<c:forEach items="${pitcherList}" var="pitcher">
    	<option value="${pitcher.getPlayerID()}">
                    ${pitcher.getfName()} ${pitcher.getlName()}
    	</option>
	</c:forEach>
</select>
<h3>Pitch Type</h3>
<select name="pitchType" id="pitchType">
<option value=FB>Fastball</option>
<option value=CRV>Curveball</option>
<option value=SLD>Slider</option>
<option value=CTR>Cutter</option>
<option value=SPL>Splitter</option>
</select>
<h3>Speed</h3>
<input type="number" name="speed"/>
<h3>Pitch Count</h3>
<input type="number" name="pitchCount"/>
<h3>Play result</h3>
<select name="playResult"   id="playResult">
<option value=O>Hit-out</option>
<option value=I>Hit-in</option>
<option value=W>Walk</option>
<option value=F>Foul</option>
<option value=K>Strikeout</option>
<option value=0>No Result</option>
</select>
<br>
<input type="submit" value="add pitch"></input>
</form>

</div>

</body>
</html>
