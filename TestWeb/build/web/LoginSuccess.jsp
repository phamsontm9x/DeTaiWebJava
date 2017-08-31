<%-- 
    Document   : LoginSuccess
    Created on : Apr 13, 2017, 1:36:40 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập thành công</title>
    </head>
    <body>
        <%
            String ten = "";
            ten = (String) session.getAttribute("ten");
        %>   
        Chào mừng  <%=ten%> đã đăng nhập thành công
        <p><a href="index.jsp">Bấm vào đây để về trang chủ</a></p>
    </body>
</html>
