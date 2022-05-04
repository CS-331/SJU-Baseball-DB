<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="play" class="SJUBaseball.Play"/>
<jsp:setProperty name="play" property="*"/> 
<%@page import="SJUBaseball.PlayDao"%>
<%@page import="SJUBaseball.inningDAO"%> 
<%
if(!inningDAO.inningExists(play.getOpposingTeam(), play.getDate(), play.getInningId(), play.getPitcherId())) {
	inningDAO.createNewInning(play.getOpposingTeam(), play.getDate(), play.getInningId(), play.getPitcherId());
}
int status=PlayDao.addPlay(play);
if(status>0)  out.print("You are successfully added pitch");
response.sendRedirect("newPitch.jsp");
%>