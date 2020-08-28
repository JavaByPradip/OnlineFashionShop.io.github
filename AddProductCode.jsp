

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
                int id = con.MaxColVal("EB_PRODUCT_MST", "EPM_ID");
                String name = request.getParameter("txtName");
                String brand = request.getParameter("txtBrand");
                String size = request.getParameter("txtSize");
                String color = request.getParameter("txtColor");
                String material = request.getParameter("txtMaterial");
                String price = request.getParameter("txtPrice");
                int categoryId = Integer.parseInt(request.getParameter("ddlCategory"));
                int quantity = Integer.parseInt(request.getParameter("numQuantity"));
                String query = String.format("INSERT INTO EB_PRODUCT_MST(EPM_ID, EPM_NAME, EPM_BRAND, EPM_SIZE, EPM_COLOR, EPM_MATERIAL, EPM_PRICE, ECM_ID, EPM_QUANTITY) VALUES(%d,'%s','%s','%s','%s','%s','%s',%d, %d)", id, name, brand, size, color, material, price, categoryId, quantity);
                int i = con.DML(query);
                if (i != 0) {
                    session.setAttribute("productId",id);
                    out.println("<script> alert('Inserted Successfully') ;window.location='../AddPhoto.jsp';</script>");
                } else {
                    out.println("<script> alert('Unable to insert') ;window.location='../AddProduct.jsp';</script>");
                }
            } else {
                out.println("<script> alert('Unauthorized') ;window.location='../Index.jsp';</script>");
            }
        %>
    </body>
</html>
