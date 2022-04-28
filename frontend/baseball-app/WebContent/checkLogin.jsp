
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="login.User" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check login</title>
    </head>
    <body>

     <%
          if(!user.isLoggedIn())
          {
           response.sendRedirect("login.html");  // Tell the browser to go to this page
           return; // do nothing more
          }
     %>

        <h3>Hello <%= user.getFirstName()+" "+user.getLastName() %> </h3>
       
    </body>
</html>