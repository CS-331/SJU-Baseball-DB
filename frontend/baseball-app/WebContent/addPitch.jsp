<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SJUBaseball.PlayDao"%>  
<jsp:useBean id="play" class="SJUBaseball.Play"/>
<jsp:setProperty name="play" property="*"/> 
<%  
int status=PlayDao.addPlay(play);  
if(status>0)  
out.print("You are successfully registered");  
  
%> 