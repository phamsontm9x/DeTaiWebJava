<%-- 
    Document   : DonHang
    Created on : Aug 18, 2017, 11:05:08 AM
    Author     : My PC
--%>

<%@page import="dao.DonHangDAOImpl"%>
<%@page import="model.DonHang"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn Hàng</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        <link href="css/stylenew.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/coin-slider.min.js"></script>
    </head>
    <body>
        <div class="body">
            <div class="menu_nav" style="margin-bottom: 50px;margin-top: -180px;margin-right:200px;">
                <ul>
                    <li><a href="index.jsp" style="margin-bottom: 20px;">TRANG CHỦ </a></li>
                    <li><a href="News.jsp" style="margin-bottom: 20px;">THÔNG TIN </a></li>
                    <li><a href="about.jsp"style="margin-bottom: 20px;">CHÚNG TÔI </a></li>
                        <%  String ten = "";
                                    ten = (String) session.getAttribute("ten");
                                    if (ten.equals("") || ten == null) { %>
                    <li><a href="RegisterLogin.jsp"style="margin-bottom: 20px;">ĐĂNG NHẬP </a></li>
                        <%} else {%>
                    <li class="dropdown">
                        <a href="Logout.jsp" style="margin-bottom: 20px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ĐĂNG XUẤT <span class="caret"></span></a>
                    </li>
                    <%}
                    %>
                </ul>
            </div>
            <%
                String mail = (String) session.getAttribute("email");
                DonHangDAOImpl DH = new DonHangDAOImpl();
                ArrayList<DonHang> dsdh = DH.getListDonHang(mail);
                ArrayList<String> listngay = DH.getNgayHD(mail);
            %>
            <div class="showtable">
                <h2 style="margin-left: 500px;">THÔNG TIN ĐƠN HÀNG</h2>

                <table class="Formtable" border="5" style="margin-left:450px">
                    <tr>
                        <th>Ngày Đặt</th>
                        <th>Mail Đặt Vé</th>
                        <th></th>            
                    </tr>
                    <% for (String ngay : listngay) {%>
                    <tr>
                        <td><%=ngay%></td>
                        <td><%=mail%></td>
                        <td>
                            <form method="Post" action="XemDonHang.jsp">
                                <input type="hidden" name ="ngay" value="<%=ngay%>">
                                <input type="hidden" name ="mail" value="<%=mail%>">
                                <input type="submit" value="Xem Chi Tiết">
                            </form>
                        </td>
                    </tr><%}%>
                </table>
            </div>
        </div>
    </body>
</html>
