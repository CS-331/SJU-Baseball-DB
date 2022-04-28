<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="user" class="login.User" scope="session" />
 <jsp:setProperty name="user" property="*"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
          session.setMaxInactiveInterval(1800);  // 30 minute time out
          user.login("Your username", "Your Password");
          if(user.isLoggedIn())
          {
            out.println("Hello "+user.getFirstName()+" "+user.getLastName()+"<br/>");
          	response.sendRedirect("home.jsp");
          }
          else
          {
        	  out.println("Invalid login<br />"); 
          }
            
         out.println("<a href='checkLogin.jsp'>check</A>");
        %>

    </body>
</html>