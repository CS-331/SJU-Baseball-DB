<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enter New Pitch</title>
</head>
<body>
<div>

<h2>Enter Pitch</h2>
<form action="addPitch.jsp" method="post" enctype="multipart/form-data">
<h3>Game Date</h3>
<input type="text" name="date"></input>
<h3>Opposing Team</h3>
<input type="text" name="opposingTeam"></input>
<h3>Inning</h3>
<input type="text" name="inningID"></input>
<h3>Player</h3>
<select name="playerID" id="playerID">
<option value=test1>test1</option>
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
<input type="number" name="speed"></input>
<h3>Pitch Count</h3>
<input type="number" name="pitchCount"></input>
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
