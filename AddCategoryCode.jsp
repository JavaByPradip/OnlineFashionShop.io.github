

<%@page import="java.sql.ResultSet"%>
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
            if (request.getParameter("btnSubmit") != null) {
                int id = con.MaxColVal("EB_CATEGORY_MST", "ECM_ID");
                String name = request.getParameter("txtCategory");
                String checkQuery = String.format("SELECT * FROM EB_CATEGORY_MST WHERE ECM_NAME='%s'", name);
                if (con.RecordExist(checkQuery)) {
                    out.println("<script> alert('Category already Exists.') ;window.location='AddCategories.jsp';</script>");
                } else {
                    String query = String.format("INSERT INTO EB_CATEGORY_MST VALUES(%d,'%s')", id, name);
                    int i = con.DML(query);
                    if (i != 0) {
                        out.println("<script> alert('Inserted Successfully') ;window.location='AddCategories.jsp';</script>");
                    } else {
                        out.println("<script> alert('Unable to insert') ;window.location='AddCategories.jsp';</script>");
                    }
                }
            } else if (request.getParameter("btnDelete") != null) {
                ResultSet rs = con.ReadRecord("SELECT COUNT(ECM_ID) FROM EB_CATEGORY_MST");
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
                int j = 0;
                for (int i = 0; i < count; i++) {

                    if (id[i] != null) {
                        j = con.DML("DELETE FROM EB_CATEGORY_MST WHERE ECM_ID=" + id[i]);
                    }
                }
                if (j != 0) {
                    out.println("<script> alert('Removed Successfully') ;window.location='AddCategories.jsp';</script>");
                } else {
                    out.println("<script> alert('Unable to remove') ;window.location='AddCategories.jsp';</script>");
                }
            } else {
                out.println("<script> alert('Unauthorised') ;window.location='../Index.jsp';</script>");
            }
        %>
    </body>
</html>
