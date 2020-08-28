

<%@page import="java.sql.*"%>
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
            MyConnection con = new MyConnection();
            if (request.getParameter("btnRegister") != null) {
                String name = request.getParameter("txtName");
                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                String confirmPassword = request.getParameter("txtCPassword");
                if (password.equals(confirmPassword)) {
                    int id = con.MaxColVal("EB_USER_MST", "EUM_ID");
                    boolean record = con.RecordExist("SELECT * FROM EB_USER_MST WHERE EUM_EMAIL='" + email + "'");
                    if (record) {
                        out.println("<script>alert('This email is already exists. Try to login');window.location='login.html';</script>");
                    } else {
                        String query = String.format("INSERT INTO EB_USER_MST VALUES(%d, '%s', '%s','%s')", id, name, email, password);
                        int i = con.DML(query);
                        if (i != 0) {
                            out.println("<script>alert('Registered successfully. Login to continue');window.location='login.html';</script>");
                        } else {
                            out.println("<script>alert('Failed to register');window.location='registration.html';</script>");
                        }
                    }
                } else {
                    out.println("<script>alert('Password and confirm password must match.');window.location='registration.html';</script>");
                }
            } else {
                response.sendRedirect("../registration.html");
            }
        %>
    </body>
</html>
