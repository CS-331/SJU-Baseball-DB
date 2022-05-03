<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="newGame" class="login.GameBean" scope="session" />
<jsp:setProperty name="newGame" property="*"/> 

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>New Game</title>
	</head>
	<body>
	<%
		session.setMaxInactiveInterval(1800);  // 30 minute time out
    	boolean gameCreated = newGame.createNewGame();
		if (gameCreated) {
			//GameScreen
			response.sendRedirect("game-screen.jsp");
		} else {
			response.sendRedirect("NewGame.html");
		}
	%>

	</body>
</html>