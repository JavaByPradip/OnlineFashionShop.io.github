
<%@page import="com.shonu.MyConnection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function Redirect()
            {
                setTimeout("location.href = 'Category.jsp';", 100);
            }
        </script>
    </head>
    <body onload="Javascript:Redirect()">
        <%
            MyConnection con = new MyConnection();
            String name = request.getParameter("txtCategory");
            if (request.getParameter("btnSubmit") != null) {
                int id = 0;
                ResultSet rs = con.ReadRecord("SELECT MAX(CAT_ID) FROM CATEGORY_MST");
                if (rs.next()) {
                    id = rs.getInt(1);
                }
                id++;
                int i = con.DML("INSERT INTO CATEGORY_MST(CAT_ID,CAT_NAME) VALUES(" + id + ",'" + name + "')");
                if (i == 0) {
                    out.println("<script>alert('Data not inserted');window.location='Category.jsp';</script>");
                    //response.sendRedirect("Category.jsp");
                } else {
                    out.println("<script>alert('Data inserted successfully');window.location='Category.jsp';</script>");
                    //response.sendRedirect("Category.jsp");
                }
            }
            if (request.getParameter("btnDelete") != null) {
                ResultSet rs = con.ReadRecord("SELECT COUNT(CAT_ID) FROM CATEGORY_MST");
                int count = 0;
                if (rs.next()) {
                    count = rs.getInt(1);
                }
                rs.close();
                String[] id = new String[count];
                for (int i = 0; i < count; i++) {
                    id[i] = request.getParameter("check" + i);
                }
                String catids[] = new String[count];
                for (int i = 0; i < count; i++) {
                    catids[i] = request.getParameter("catid" + i);
                }
                for (int i = 0; i < count; i++) {
                    if (id[i] != null) {
                        con.DML("DELETE FROM CATEGORY_MST WHERE CAT_ID=" + id[i]);
                    }
                }
            }
        %>
    </body>
