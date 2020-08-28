

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
                int productId = Integer.parseInt(request.getParameter("hdnId"));
                int quantity = Integer.parseInt(request.getParameter("txtQty"));

                String email = request.getParameter("txtEmail");
                String password = request.getParameter("pwdPassword");
                String checkQuery = String.format("SELECT * FROM EB_USER_MST WHERE EUM_EMAIL ='%s' AND EUM_PASSWORD ='%s'", email, password);
                if (con.RecordExist(checkQuery)) {
                    int id = con.MaxColVal("EB_CART_DTL", "ECD_ID");
                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                    String currentDate = formatter.format(date);
                    int userId = Integer.parseInt(con.ReadOneData("EB_USER_MST", "EUM_ID", "EUM_EMAIL='" + email + "' AND EUM_PASSWORD='" + password + "'"));
                    double price = Double.parseDouble(con.ReadOneData("EB_PRODUCT_MST", "EPM_PRICE", "EPM_ID="+productId));
                    String query = String.format("INSERT INTO EB_CART_DTL VALUES(%d,'%s',%d,%.2f,%d, %d)", id, currentDate, quantity, price, userId, productId);
                    int i = con.DML(query);
                    if (i != 0) {
                        session.setAttribute("productId", id);
                        out.println("<script> alert('Added to Cart') ;window.location='Category.jsp';</script>");
                    } else {
                        out.println("<script> alert('Failed to Add)' ;window.location='Single.jsp?" + productId + "';</script>");
                    }
//                    out.println(query);
                }
                

            } else {
                out.println("<script> alert('Unauthorized') ;window.location='../Index.jsp';</script>");
            }
        %>
    </body>
</html>
