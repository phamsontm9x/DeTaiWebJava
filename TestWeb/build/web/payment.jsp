<%-- 
    Document   : payment
    Created on : May 10, 2017, 8:50:16 AM
    Author     : Hieu
--%>

<%@page import="function.RandomKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang thanh toán trực tuyến</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            int MaHD = RandomKey.randomKeyInt();
            String macb = (String) request.getParameter("macb");
            String macbve = "";
            String tongtien_str = request.getParameter("total");
            String matknhan="1234567890123";
            int tongtien = Integer.parseInt(tongtien_str);
            String type = request.getParameter("type");
        %>
        <div class="login-page">
            <div class="form">
        
             <form  class="login-form" method="post" action="LuuHoaDon_Servlet">
            <h1> THANH TOÁN TRỰC TUYẾN</h1>
            
            <div >
            Mã Tài khoản: <input type="text" name="remitterID" required>
            <br>
            Mã Pin <input type="password" name="password" required>
            <br>
            
            Số tiền : <br>
             <input type="text" value="<%=request.getParameter("total") %>" class="field left" readonly>
            <input type="hidden" name="total" value="<%=tongtien%>">
            <% if (request.getParameter("macbve") != null) {
                    macbve = request.getParameter("macbve");

            %>
            <input type="hidden" name="macbve" value="<%=macbve%>">
           

            <%}%>
            <input type="hidden" name="receiverID" value="<%= matknhan %>">
            <input type="hidden" name="amount" value="<%=request.getParameter("total")%>">
            <input type="hidden" name="orderID" value="<%=MaHD%>">
            <input type="hidden" name="macb" value="<%=macb%>">
            <input type="hidden" name="type" value="<%=type%>">
            <br>
            </div>
            <input class="login login-submit" type="submit" value="Xác nhận">

            
             </form>
            </div>
        </div>
    </body>
</html>