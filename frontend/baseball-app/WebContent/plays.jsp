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
	<a href="game-selection.jsp"><img src="back.png" width="50" height="50"></a>
	<a href="home.jsp"><img src="sju-baseball.jpg" width="50" height="50"></a>
    <div align="center">
    <%-- if there is a date but no inning or option selected --%>
    <c:if test="${date!='' && option == 'None' }">
     <table border="1" cellpadding="5">
            <h3>
            ${team} Game on ${date}
            </h3>
            <tr>
                <th>Inning</th>
                <th>Pitch Count</th>
                <th>Pitch Type</th>
                <th>Speed</th>
                <th>Play Result</th>
            </tr>
            <c:forEach var="play" items="${playList}">
                <tr>
                    <td><c:out value="${play.getInningId()}" /></td>
                    <td><c:out value="${play.getPitchCount()}" /></td>
                    <td><c:out value="${play.getPitchType()}" /></td>
                    <td><c:out value="${play.getSpeed()}" /></td>
                    <td><c:out value="${play.getPlayResult()}" /></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
    <%-- if there is a date an option selected --%>
    
    <c:if test="${date!='' && option == 'percentHits' }">
    	Percent Hits Resulting in a Strike Against ${team} on ${date}: <b>${percent*100}%</b>
    </c:if>
    
    <%-- if there is an option selected then everything needs to be selected --%>
       
    </div>
</body>
</html>