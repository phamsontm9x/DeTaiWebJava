<%-- 
    Document   : XemDonHang
    Created on : Jul 29, 2017, 8:34:33 AM
    Author     : My PC
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page import="model.HangHangKhong"%>
<%@page import="dao.HangHangKhongDAOImpl"%>
<%@page import="dao.HanhKhachDAOImpl"%>
<%@page import="model.HanhKhach"%>
<%@page import="model.TuyenBay"%>
<%@page import="dao.TuyenBayDAOImpl"%>
<%@page import="dao.ChuyenBayDAOImpl"%>
<%@page import="model.ChuyenBay"%>
<%@page import="model.DonHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DonHangDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem Đơn Hàng</title>
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
                            try {
                                ten = (String) session.getAttribute("ten");
                                if (ten.equals("") || ten == null) { %>
                    <li><a href="RegisterLogin.jsp"style="margin-bottom: 20px;">ĐĂNG NHẬP </a></li>
                        <%} else {%>

                    <li><a href="DonHang.jsp"style="margin-bottom: 20px;">Xem Đơn Hàng</a></li>
                    <li class="dropdown">
                        <a href="Logout.jsp" style="margin-bottom: 20px;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ĐĂNG XUẤT <span class="caret"></span></a>

                    </li>

                    <%}

                    } catch (Exception e) { %>
                    <li><a href="RegisterLogin.jsp"style="margin-bottom: 20px;">ĐĂNG NHẬP </a></li>
                        <%}%>
                </ul>
            </div>
            <%
                String mail = (String) session.getAttribute("email");
                DonHangDAOImpl DH = new DonHangDAOImpl();
                ArrayList<DonHang> dsdh = DH.getListDonHang(mail);
                ChuyenBayDAOImpl CB = new ChuyenBayDAOImpl();
                TuyenBayDAOImpl TB = new TuyenBayDAOImpl();
                HanhKhachDAOImpl HK = new HanhKhachDAOImpl();
                HangHangKhongDAOImpl HHK = new HangHangKhongDAOImpl();
                DiaDiemDAOImpl dd = new DiaDiemDAOImpl();
                ArrayList<String> listngay = DH.getNgayHD(mail);
                String ngayCT = request.getParameter("ngay");

            %>
            <div class="showtable">
                <h2 style="margin-left: 500px;">THÔNG TIN ĐƠN HÀNG</h2>

                <% for (String ngay : listngay) {%>
                <table class="Formtable" border="5" style="margin-left:100px">
                    <tr>
                        <th>Ngày Đặt</th>
                        <th>Mail Đặt Vé</th>
                        <th></th>            
                    </tr>
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
                    </tr>
                    <% if (ngayCT.equals(ngay)) {%>
                    <table class="Formtable" border="5" style="margin-left:100px">
                        <tr>
                            <th>STT</th>
                            <th>Tên Hành Khách</th>
                            <th>CMND</th>
                            <th>Mã Chuyến Bay</th>
                            <th>Chặng Bay</th>
                            <th>Giờ Bay</th>
                            <th>Giá</th>
                            <th>Trạng Thái</th>            
                        </tr>
                        <%  int i = 1;
                            for (DonHang dh : DH.getListDonHang(mail)) {
                                ChuyenBay cb = CB.getEleChuyenBay(dh.getMaCB());
                                TuyenBay tb = TB.getEleTuyenBay(cb.getMaTB());
                                dh.setNgayTao(dh.getNgayTao().substring(0, dh.getNgayTao().length() - 10));
                                String ngayTao = dh.getNgayTao().trim();
                                HanhKhach hk = HK.getHanhKhachbymahk(dh.getCMND(), dh.getMaCB());
                        %>
                        <% if (ngayCT.equals(ngayTao)) {%>
                        <tr>
                            <td><%=i++%></td>
                            <td><%=hk.getHoTen()%></td>
                            <td><%=dh.getCMND()%></td>
                            <td><%=dh.getMaCB()%></td>
                            <th><%=dd.getTenDD(tb.getMaDi())%>-<%=dd.getTenDD(tb.getMaDen())%></th>
                            <td><%=cb.getNgayDi()%><br>
                                <%=tb.getGioDi()%></td>
                            <td><%=dh.getGia()%></td>
                            <td><%=dh.getTrangThai()%></td>
                            <% if (dh.getTrangThai().equals("Chưa thanh toán")) {%>
                            <td><form  method="POST" action="HuyDonHang_Servlet">
                                    <input type="hidden" name="cmnd" value="<%=dh.getCMND()%>">
                                    <input type="hidden" name="macb" value="<%=dh.getMaCB()%>">
                                    <input type="hidden" name="ngay" value="<%=ngayCT%>">
                                    <input class="buttomexit" type="submit" value="HỦY">
                                </form></td>
                            <%}%>
                        </tr>
                        <%}
                        }
                    }%>
                    </table>
                    <br>
                    <br>
                    </font>
                </table>
                <%}%>
            </div>
            <div class="fbg">
                <div class="fbg_resize">
                    <div class="col c1">
                        <h2>Theme</h2>
                        <a href="#"><img src="images/gal1.jpg" width="100" height="75" alt="" class="gal" /></a> 
                        <a href="#"><img src="images/gal2.jpg" width="100" height="75" alt="" class="gal" /></a>
                        <a href="#"><img src="images/gal3.jpg" width="100" height="75" alt="" class="gal" /></a> 
                        <a href="#"><img src="images/gal4.jpg" width="100" height="75" alt="" class="gal" /></a> 
                        <a href="#"><img src="images/gal5.jpg" width="100" height="75" alt="" class="gal" /></a> 
                        <a href="#"><img src="images/gal6.jpg" width="100" height="75" alt="" class="gal" /></a> </div>
                    <div class="col c2">
                        <h2>Overview</h2>
                        <p>Thông tin bản quyền</p>
                        <ul class="fbg_ul">
                            <li><a >CheapAirline Pty Ltd., số GPĐKKD: 33069720243.</a></li>
                            <li><a >CheapAirline Regional Services Pte Ltd, số GPĐKKD: 201229688K. Số Giấy phép kinh doanh đại lý du lịch của Singapore: 02495</a></li>
                            <li><a >CheapAirline Japan Co., Ltd., số Giấy phép kinh doanh đại lý du lịch của Công ty CheapAirline Holidays K.K.: 1829</a></li>
                        </ul>
                    </div>
                    <div class="col c3">
                        <h2><span>Contact</span> us</h2>
                        <p class="contact_info"> <span>Address:</span>97 Man Thiện, Phường Hiệp Phú Q9 TP.HCM<br />
                            <span>Telephone:</span> +18001000<br />
                            <span>FAX:</span> +458 4578<br />
                            <span>Others:</span> +301  0125  01258<br />
                            <span>E-mail:</span> <a href="mail.google.com">vemaybay@gmail.com</a> </p>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>

        </div>
    </body>
</html>
