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
		<h1><a href="home.jsp"><img src="sju-baseball.jpg" width="50" height="50"></a><div align="center">Create New Game</h1></div>
   		<form name="new-game-info" action="/baseball-app/new-game" method="get"><br/><br/>
         	Opponent: <input type="text" name="opposingTeam" size="35" /><br/><br/>
         	<!-- Date needs to be formatted like sql ','YYYY-MM-DD'-->
         	<label>Date (YYYY-MM-DD): <input type="text" name="gameDate"/></label><br/><br/>
         	<input type ="submit" value="Submit" /><input type="reset" value="Clear" /><br/>
   		</form>
	</body>
</html>