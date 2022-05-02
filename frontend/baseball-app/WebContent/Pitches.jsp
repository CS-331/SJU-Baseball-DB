<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
<jsp:useBean id="game" class="SJUBaseball.GameDAO" scope="session" />
<jsp:setProperty name="game" property="*"/> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Plays From Game VS ${selectedTeam}</title>
</head>
<body>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption>
            Plays From Game VS ${selectedTeam}
            </caption>
            <tr>
                <th>Inning</th>
                <th>Pitch Type</th>
                <th>Strike</th>
                <th>Speed</th>
                <th>Play Result</th>
            </tr>
            <c:forEach var="play" items="${playList}">
                <tr>
                    <td><c:out value="${play.getInningId()}" /></td>
                    <td><c:out value="${play.getPitchType()}" /></td>
                    <td><c:out value="${play.getStrike()}" /></td>
                    <td><c:out value="${play.getSpeed()}" /></td>
                    <td><c:out value="${play.getPlayResult()}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>