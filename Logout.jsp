

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("admin") != null) {
                session.removeAttribute("admin");
            }
            response.sendRedirect("Index.jsp");
        %>
    </body>
</html>
