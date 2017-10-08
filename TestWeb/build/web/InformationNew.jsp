<%-- 
    Document   : vidu
    Created on : Jul 25, 2017, 10:47:46 AM
    Author     : My PC
--%>

<%@page import="dao.HangHangKhongDAOImpl"%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page import="model.TuyenBay"%>
<%@page import="dao.TuyenBayDAOImpl"%>
<%@page import="model.ChuyenBay"%>
<%@page import="dao.ChuyenBayDAOImpl"%>
<%@page import="model.HanhKhach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/stylenew.css" rel="stylesheet" type="text/css"/>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vi du</title>
    </head>
    <body>
        <div class="body">
            <div class="main">
                <div class="header">
                    <div class="header_resize">
                        <div class="menu_nav">
                            <ul>
                                <li class="active"><a href="index.jsp"><span>Trang chủ</span></a></li>
                                <li><a href="News.jsp"><span>Thông tin</span></a></li>
                                <li> <a href="Logout.jsp" style="margin-bottom: 20px;" >ĐĂNG XUẤT</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <%
                request.setCharacterEncoding("UTF-8");
                String type = session.getAttribute("type").toString();
                int TongTien = 0;
                int soluong = Integer.parseInt(session.getAttribute("soluong").toString());
                int giavedi = 0, giaveve = 0;
                //String email = request.getAttribute("email").toString();
                String maStr = request.getAttribute("macb").toString();
                int macb = Integer.parseInt(maStr);

                if (type.equals("oneway")) {
                    ChuyenBayDAOImpl CB = new ChuyenBayDAOImpl();
                    ChuyenBay cb = new ChuyenBay();
                    cb = CB.getEleChuyenBay(macb);
                    TuyenBayDAOImpl TB = new TuyenBayDAOImpl();
                    TuyenBay tb = new TuyenBay();
                    tb = TB.getEleTuyenBay(cb.getMaTB());
                    DiaDiemDAOImpl DD = new DiaDiemDAOImpl();
                    HangHangKhongDAOImpl hhk = new HangHangKhongDAOImpl();

            %>

            <div class="clr"></div>
            <div class="clr"></div>
            <div class="clr"></div>
            <div class="" style="margin-bottom: 100px;">
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <h1 class="Confirmtb1h1" >Thông tin về Chuyến Bay</h1>
                <h2 class="Confirmtb1h2" style="margin-left: 500px;">Thông tin về chuyến bay đi</h2>




                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <table class="showtable" border="3" style="margin-top: -150px;" >
                    <tr>
                        <th>Mã Chuyến Bay</th>
                        <th>Hãng Hàng Không</th>
                        <th>Địa điểm Đi</th>
                        <th>Ngày Đi</th>
                        <th>Giờ Khởi Hành</th>
                        <th>Địa điểm Đến</th>
                        <th>Ngày Đến</th>
                        <th>Giờ Đến</th>


                    </tr>
                    <% tb.setGioDen(tb.getGioDen().substring(0, tb.getGioDen().length() - 8));%>
                    <td><%=cb.getMaCB()%></td>
                    <td><%=hhk.getTenHHK(tb.getMaHHK())%></td>
                    <td><%=DD.getTenDD(tb.getMaDi())%></td>
                    <td><%=cb.getNgayDi()%></td>
                    <td><%=tb.getGioDi()%></td>
                    <td><%=DD.getTenDD(tb.getMaDen())%></td>
                    <td><%=cb.getNgayDen()%></td>
                    <td><%=tb.getGioDen()%></td>
                </table>

                <h2 class="Confirmtb1h2" style="margin-left: 500px;margin-top: 100px;">Thông tin Hành khách</h2> 
                <div class="clr"></div>
                <table class="showtable" border="3" style="margin-top: -150px; margin-left: 250px;" >
                    <tr>
                        <th>Họ Tên </th>
                        <th>CMND</th>
                        <th>Số Điện thoại</th>
                        <th>Hành Lý (kg)</th>
                        <th>Loại Vé</th>
                        <th>Địa Chỉ</th>
                        <th>Tổng tiền</th>    
                    </tr>        
                    <%for (int i = 1; i <= soluong; i++) {
                            HanhKhach temp = (HanhKhach) session.getAttribute("tthkdi" + i);
                            int hanhly = temp.getHanhLy();
                            int giahl = 0;
                            if (hanhly < 10) {
                                giahl = 0;
                            } else if (hanhly == 10) {
                                giahl = 200000;
                            } else if (hanhly == 20) {
                                giahl = 250000;
                            } else if (hanhly < 30.0) {
                                giahl = 300000;
                            }
                    %> 


                    <tr>
                        <td><%=temp.getHoTen()%></td>
                        <td><%=temp.getCMND()%></td>
                        <td>0<%=temp.getSoDT()%></td>
                        <%if (temp.getHanhLy() >= 10) {%>
                        <td>Gói: <%=temp.getHanhLy()%> kg</td>
                        <%} else { %>
                        <td>Không đăng kí</td>
                        <% }%>
                        <%
                            if (temp.getLoaiVe().equals("Eco")) {
                                if (tb.getMaHHK().equals("VNA")) {
                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 50000 + 70000 + 10000);
                                } else if (tb.getMaHHK().equals("VJ")) {
                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 60000 + 75000 + 33000);
                                } else if (tb.getMaHHK().equals("BL")) {

                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 60000 + 33000 + 50000);
                                }
                        %>
                        <td>Eco</td>
                        <%} else {
                            if (tb.getMaHHK().equals("VNA")) {
                                giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 50000 + 70000 + 10000);
                            } else if (tb.getMaHHK().equals("VJ")) {
                                giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 60000 + 75000 + 33000);
                            } else if (tb.getMaHHK().equals("BL")) {

                                giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 60000 + 33000 + 50000);
                            }
                        %>
                        <td>Vip</td>
                        <%}
                            TongTien += (giavedi + giahl);
                        %>
                        <td><%=temp.getDChi()%></td>
                        <td><%=giavedi + giahl%></td>
                    </tr>
                    <%}%>
                    <tr>
                        <td>Tổng chi phí</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><%=TongTien%></td>
                    </tr>
                </table>
            </div>
            <%}%>

            <% 
                if (type.equals("roundtrip")) {

                    ChuyenBayDAOImpl CB = new ChuyenBayDAOImpl();
                    ChuyenBay cb = new ChuyenBay();
                    cb = CB.getEleChuyenBay(macb);
                    TuyenBayDAOImpl TB = new TuyenBayDAOImpl();
                    TuyenBay tb = new TuyenBay();
                    tb = TB.getEleTuyenBay(cb.getMaTB());
                    DiaDiemDAOImpl DD = new DiaDiemDAOImpl();
                    HangHangKhongDAOImpl hhk = new HangHangKhongDAOImpl();
            %>
            <div class="Confirmback">
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <h1 class="Confirmtb1h1">Thông tin về Chuyến Bay</h1>
                <h2 class="Confirmtb1h2">Thông tin về chuyến bay đi</h2>
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <table class="Formtable" border="3" >
                    <tr>
                        <th>Mã Chuyến Bay</th>
                        <th>Hãng Hàng Không</th>
                        <th>Địa điểm Đi</th>
                        <th>Ngày Đi</th>
                        <th>Giờ Khởi Hành</th>
                        <th>Địa điểm Đến</th>
                        <th>Ngày Đến</th>
                        <th>Giờ Đến</th>


                    </tr>

                    <td><%=cb.getMaCB()%></td>
                    <td><%=hhk.getTenHHK(tb.getMaHHK())%></td>
                    <td><%=DD.getTenDD(tb.getMaDi())%></td>
                    <td><%=cb.getNgayDi()%></td>
                    <td><%=tb.getGioDi()%></td>
                    <td><%=DD.getTenDD(tb.getMaDen())%></td>
                    <td><%=cb.getNgayDen()%></td>
                    <td><%=tb.getGioDen()%></td>
                </table>
                <%
                    String macbveStr = request.getAttribute("macbve").toString();
                    int macbve = Integer.parseInt(macbveStr);
                    ChuyenBay cbve = new ChuyenBay();
                    cbve = CB.getEleChuyenBay(macbve);
                    TuyenBay tbve = new TuyenBay();
                    tbve = TB.getEleTuyenBay(cbve.getMaTB());
                    HangHangKhongDAOImpl hhkve = new HangHangKhongDAOImpl();
                %>
                <h2 class="Confirmtb1h2">Thông tin về chuyến bay về</h2>
                <div class="clr"></div>
                <div class="clr"></div>
                <div class="clr"></div>
                <table class="Formtable" border="3" >
                    <tr>
                        <th>Mã Chuyến Bay</th>
                        <th>Hãng Hàng Không</th>
                        <th>Địa điểm Đi</th>
                        <th>Ngày Đi</th>
                        <th>Giờ Khởi Hành</th>
                        <th>Địa điểm Đến</th>
                        <th>Ngày Đến</th>
                        <th>Giờ Đến</th>


                    </tr>

                    <td><%=cbve.getMaCB()%></td>
                    <td><%=hhk.getTenHHK(tbve.getMaHHK())%></td>
                    <td><%=DD.getTenDD(tbve.getMaDi())%></td>
                    <td><%=cbve.getNgayDi()%></td>
                    <td><%=tbve.getGioDi()%></td>
                    <td><%=DD.getTenDD(tbve.getMaDen())%></td>
                    <td><%=cbve.getNgayDen()%></td>
                    <td><%=tbve.getGioDen()%></td>
                </table>
                <h2 class="Confirmtb1h2">Thông tin Hành khách</h2> 
                <div class="clr"></div>
                <table class="Formtable" border="3">
                    <tr>
                        <th>Họ Tên </th>
                        <th>CMND</th>
                        <th>Số Điện Thoại</th>
                        <th>Hành Lý Đi(kg)</th>
                        <th>Hành Lý Về(kg)</th>
                        <th>Loại Vé Đi</th>
                        <th>Loại Vé Về</th>
                        <th>Địa Chỉ</th>
                        <th>Tổng tiền</th>    
                    </tr>        
                    <%for (int i = 1; i <= soluong; i++) {
                            HanhKhach temp = (HanhKhach) session.getAttribute("tthkdi" + i);
                            HanhKhach tempve = (HanhKhach) session.getAttribute("tthkve" + i);
                            int hanhly = temp.getHanhLy(), hanhlyve = tempve.getHanhLy();
                            int giahldi = 0, giahlve = 0;
                            if (hanhly < 10) {
                                giahldi = 0;
                            } else if (hanhly == 10) {
                                giahldi = 200000;
                            } else if (hanhly == 20) {
                                giahldi = 250000;
                            } else if (hanhly < 30.0) {
                                giahldi = 300000;
                            }
                            if (hanhlyve < 10) {
                                giahldi = 0;
                            } else if (hanhlyve == 10) {
                                giahlve = 200000;
                            } else if (hanhlyve == 20) {
                                giahlve = 250000;
                            } else if (hanhlyve < 30.0) {
                                giahlve = 300000;
                            }
                    %> 


                    <tr>
                        <td><%=temp.getHoTen()%></td>
                        <td><%=temp.getCMND()%></td>
                        <td>0<%=temp.getSoDT()%></td>
                        <%if (hanhly >= 10) {%>
                        <td>Gói: <%=hanhly%> kg</td>
                        <%} else { %>
                        <td>Không đăng kí</td>
                        <% }%><%if (hanhlyve >= 10) {%>
                        <td>Gói: <%=hanhlyve%> kg</td>
                        <%} else { %>
                        <td>Không đăng kí</td>
                        <% }%>

                        <%
                            if (temp.getLoaiVe().equals("Eco")) {
                                if (tb.getMaHHK().equals("VNA")) {
                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 50000 + 70000 + 10000);
                                } else if (tb.getMaHHK().equals("VJ")) {
                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 60000 + 75000 + 33000);
                                } else if (tb.getMaHHK().equals("BL")) {

                                    giavedi = (tb.getGiaThuong() + tb.getGiaThuong() * 10 / 100 + 60000 + 33000 + 50000);
                                }
                        %>
                        <td>Eco</td>
                        <%} else {
                            if (temp.getLoaiVe().equals("Vip")) {
                                if (tb.getMaHHK().equals("VNA")) {
                                    giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 50000 + 70000 + 10000);
                                } else if (tb.getMaHHK().equals("VJ")) {
                                    giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 60000 + 75000 + 33000);
                                } else if (tb.getMaHHK().equals("BL")) {

                                    giavedi = (tb.getGiaVIP() + tb.getGiaVIP() * 10 / 100 + 60000 + 33000 + 50000);
                                }
                        %>
                        <td>Vip</td>
                        <%}
                            }
                            if (tempve.getLoaiVe().equals("Eco")) {
                                if (tbve.getMaHHK().equals("VNA")) {
                                    giaveve = (tbve.getGiaThuong() + tbve.getGiaThuong() * 10 / 100 + 50000 + 70000 + 10000);
                                } else if (tbve.getMaHHK().equals("VJ")) {
                                    giaveve = (tbve.getGiaThuong() + tbve.getGiaThuong() * 10 / 100 + 60000 + 75000 + 33000);
                                } else if (tbve.getMaHHK().equals("BL")) {

                                    giaveve = (tbve.getGiaThuong() + tbve.getGiaThuong() * 10 / 100 + 60000 + 33000 + 50000);
                                }
                        %>
                        <td>Eco</td>
                        <%} else {
                            if (tempve.getLoaiVe().equals("Vip")) {
                                if (tbve.getMaHHK().equals("VNA")) {
                                    giaveve = (tbve.getGiaVIP() + tbve.getGiaVIP() * 10 / 100 + 50000 + 70000 + 10000);
                                } else if (tbve.getMaHHK().equals("VJ")) {
                                    giaveve = (tbve.getGiaVIP() + tbve.getGiaVIP() * 10 / 100 + 60000 + 75000 + 33000);
                                } else if (tbve.getMaHHK().equals("BL")) {

                                    giaveve = (tbve.getGiaVIP() + tbve.getGiaVIP() * 10 / 100 + 60000 + 33000 + 50000);
                                }
                        %>
                        <td>Vip</td>
                        <%}
                            }
                            TongTien += (giavedi + giahldi + giaveve + giahlve);
                        %>
                        <td><%=temp.getDChi()%></td>
                        <td><%=giavedi + giahldi + giaveve + giahlve%></td>
                    </tr>
                    <%}%>
                    <tr>
                        <td>Tổng chi phí</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><%=TongTien%></td>
                    </tr>
                </table>
            </div>

            <%}%>
            <form class="SigninIFtb"   method="POST" action="LuuThongTinHanhKhach_Servlet">
                <input type="hidden" name="email" value="email" >
                <input type="hidden" name="flag" value="tra" >
                <input type="hidden" name="total" value="<%=TongTien%>" >
                <input type="hidden" name="soluong" value="<%=soluong%>">
                <input type="hidden" name="macb" value="<%=macb%>">
                <input type="hidden" name="giavedi" value="<%=giavedi%>">
                <input type="hidden" name="type" value="<%=type%>" >
                <% if (type.equals("roundtrip")) {
                        String macbve = request.getAttribute("macbve").toString();
                %>
                <input type="hidden" name="macbve" value="<%=macbve%>">
                <input type="hidden" name="giaveve" value="<%=giaveve%>">
                <%}%>
                <% for (int i = 1; i <= soluong; i++) {
                        HanhKhach hk = (HanhKhach) session.getAttribute("tthkdi" + i);
                %>
                <input type="hidden" name="hoten<%=i%>" value="<%=hk.getHoTen()%>" >
                <input type="hidden" name="cmnd<%=i%>" value="<%=hk.getCMND()%>" >
                <input type="hidden" name="sdt<%=i%>" value="<%=hk.getSoDT()%>" >
                <input type="hidden" name="hanhly<%=i%>" value="<%=hk.getHanhLy()%>" >

                <input type="hidden" name="loaivedi<%=i%>" value="<%=hk.getLoaiVe()%>" >
                <input type="hidden" name="dichvu<%=i%>" value="" >
                <input type="hidden" name="diachi<%=i%>" value="<%=hk.getDChi()%>" >
                <%
                    if (type.equals("roundtrip")) {
                        HanhKhach hkve = (HanhKhach) session.getAttribute("tthkve" + i);
                %>
                <input type="hidden" name="hanhlyve<%=i%>" value="<%=hkve.getHanhLy()%>" >
                <input type="hidden" name="loaiveve<%=i%>" value="<%=hkve.getLoaiVe()%>" >
                <%}
                    }%>
                <input class="SigninIF" type="submit" value="Thanh toán trực tuyến" />
            </form>
            <form  class="returnHomepageIFtb" method= "POST" action="LuuThongTinHanhKhach_Servlet">
                <input type="hidden" name="flag" value="no" >
                <input type="hidden" name="total" value="<%=TongTien%>" >
                <input type="hidden" name="type" value="<%=type%>" >
                <input type="hidden" name="soluong" value="<%=soluong%>">
                <input type="hidden" name="macb" value="<%=macb%>">
                <input type="hidden" name="giavedi" value="<%=giavedi%>">
                <% if (type.equals("roundtrip")) {
                        String macbve = request.getAttribute("macbve").toString();
                %>
                <input type="hidden" name="macbve" value="<%=macbve%>">
                <input type="hidden" name="giaveve" value="<%=giaveve%>">
                <%}%>
                <% for (int i = 1; i <= soluong; i++) {
                        HanhKhach hk = (HanhKhach) session.getAttribute("tthkdi" + i);
                %>
                <input type="hidden" name="hoten<%=i%>" value="<%=hk.getHoTen()%>" >
                <input type="hidden" name="cmnd<%=i%>" value="<%=hk.getCMND()%>" >
                <input type="hidden" name="sdt<%=i%>" value="<%=hk.getSoDT()%>" >
                <input type="hidden" name="hanhly<%=i%>" value="<%=hk.getHanhLy()%>" >

                <input type="hidden" name="loaivedi<%=i%>" value="<%=hk.getLoaiVe()%>" >
                <input type="hidden" name="dichvu<%=i%>" value="" >
                <input type="hidden" name="diachi<%=i%>" value="<%=hk.getDChi()%>" >
                <%
                    if (type.equals("roundtrip")) {
                        HanhKhach hkve = (HanhKhach) session.getAttribute("tthkve" + i);
                %>
                <input type="hidden" name="hanhlyve<%=i%>" value="<%=hkve.getHanhLy()%>" >
                <input type="hidden" name="loaiveve<%=i%>" value="<%=hkve.getLoaiVe()%>" >
                <%}
                    }%>
                <input class="returnHomepageIF" type="submit" value="Thanh toán khi nhận vé" />
            </form>
            <div class="clr"></div>
            <div class="clr"></div>
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
