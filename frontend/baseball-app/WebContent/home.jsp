<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="user" class="login.User" scope="session" />
<jsp:setProperty name="user" property="*"/> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Player Home Page</title>
<style>
		.button {
		  border: none;
		  color: white;
		  padding: 16px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  transition-duration: 0.4s;
		  cursor: pointer;
		}
		
		.button1 {
		  background-color: white; 
		  color: black; 
		  border: 2px solid #FF0000;
		}
		
		.button1:hover {
		  background-color: #FF0000;
		  color: white;
		}
</style>
</head>
<body>
<div align="center">
<h1>
Welcome ${user.getFirstName()}!
</h1>
<h2>
Selection an Option Below
</h2>
<button onclick="location.href ='/baseball-app/menu'" class="button button1">View Games</button>
<button class="button button1">View Pitcher Statistics</button>
<button onclick="location.href = 'NewGame/NewGame.html'" class="button button1">New Game</button>
</div>


</body>
</html>