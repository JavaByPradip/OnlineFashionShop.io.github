

<%@page import="com.shonu.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            MyConnection con=new MyConnection();
            if(request.getParameter("btnLogin")!=null)
            {
                String tableName = "EB_USER_MST", emailColumn="EUM_EMAIL", passwordColumn="EUM_PASSWORD", sessionVariable="user", url="../UserHome.jsp" ;
                String adminEmail = "admin@eraboutique.com", adminPassword= "admin";
                
                String username=request.getParameter("txtUsername");
                String password=request.getParameter("txtPassword");
                if(username.equals(adminEmail) && password.equals(adminPassword)) {
                    tableName = "EB_ADMIN_MST";
                    emailColumn="EAM_USERNAME";
                    passwordColumn="EAM_PASSWORD";
                    sessionVariable="admin";
                    url="../admin/AdminHome.jsp";
                }
                 String query=String.format("SELECT* FROM "+tableName+" WHERE "+emailColumn+"='%s' AND "+passwordColumn+"='%s'",username,password);
                boolean record=con.RecordExist(query);
                if(record)
                {
                    session.setAttribute(sessionVariable, username);
                    response.sendRedirect(url);
                }
                else
                {
                    out.println("<script> alert('Invalid credentials') ;window.location='../Index.jsp';</script>");
                }
//                 out.println(query);
            }
            else
            {
                  out.println("<script> alert('Unauthorised') ;window.location='../Index.jsp';</script>");
            }
        %>
        
    </body>
</html>
