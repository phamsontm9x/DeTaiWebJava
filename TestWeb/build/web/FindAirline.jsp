<%-- 
    Document   : test
    Created on : Jul 14, 2017, 3:15:53 PM
    Author     : My PC
--%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page import="dao.ChuyenBayDAOImpl"%>
<%@page import="model.ChuyenBay"%>
<%@page import="dao.TuyenBayDAOImpl"%>
<%@page import="model.TuyenBay"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.print.attribute.PrintRequestAttribute"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin chuyến bay</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/newcss.css">
        <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </head>
    <body>
        <script>
            var a = false;
            function kiemtra() {
                var frm1 = document.getElementById("frm1");
                var flg = false;
                for (var i = 0; i < frm1.length - 1; i++) {
                    if (frm1[i].checked)
                        flg = true;
                }
                if (flg == false || a == true)
                {
                    alert("Bạn chưa chọn Chuyến Bay cần đi");
                    return false;
                }
                frm1.submit();
            }

            function Check() {
                if (document.getElementById('ngayve').value != null) {
                    document.getElementById('check').style.display = 'block';

                } else
                    document.getElementById('check').style.display = 'none';
            }

            function showAlert() {
                alert("Tuyến bay chưa hỗ trợ");
                a = true;
            }
        </script>  
        <%
            //soluong hanh khach
            String diadiemdi = "", diadiemden = "", soluong = "", type = "", ngaykhoihanh = "", ngayve = "";
            int sluong;

            if ((request.getParameter("diadiemdi").trim()) != null) {
                diadiemdi = request.getParameter("diadiemdi");
            }
            if ((request.getParameter("diadiemden").trim()) != null) {
                diadiemden = request.getParameter("diadiemden");
            }
            if (request.getParameter("soluong") != null) {
                soluong = request.getParameter("soluong");
            }
            if ((request.getParameter("ngaykhoihanh").trim()) != null) {
                ngaykhoihanh = request.getParameter("ngaykhoihanh");
            }
            if (request.getParameter("type") != null) {
                type = request.getParameter("type");
            }
            if ((request.getParameter("ngayve").trim()) != null) {
                ngayve = request.getParameter("ngayve");
            }
            // Tao mang Tuyen bay
            ArrayList<TuyenBay> arrTuyenBay = new ArrayList();
            // de getdata Tuyen Bay
            TuyenBayDAOImpl apiTuyenBay = new TuyenBayDAOImpl();
            arrTuyenBay = apiTuyenBay.getListTuyenBay(diadiemdi, diadiemden);
            // Co the co nhieu hang hang khong o day phu thuoc vao tuyen bay

            // Tao mang Chuyen bay
            ArrayList<ChuyenBay> arrChuyenBay = new ArrayList();
            // getData Chuyen Bay
            ChuyenBayDAOImpl apiChuyenBay = new ChuyenBayDAOImpl();
            if (arrTuyenBay.size() != 0) {
                arrChuyenBay = apiChuyenBay.getListChuyenBaybyNgayDiVaMaTB(ngaykhoihanh, arrTuyenBay.get(0).getMaTB());
                // get list dua vao tuyen bay  va ngay.
            }
            DiaDiemDAOImpl cd = new DiaDiemDAOImpl();
            String di = cd.getTenDD(diadiemdi);
            String den = cd.getTenDD(diadiemden);
            sluong = Integer.parseInt(soluong);
            int tien = 0;
            //chuyen bay va ngay toi == 0

            if (arrTuyenBay.size() == 0) {
                out.println("<br><font family = 'Time New Romen' size='10'>");
                out.println("Chưa hỗ trợ tuyến bay từ " + di + " đến " + den + "</font>");
                out.println("<br>");
                out.println("<br>");
            } else {
                if (arrChuyenBay.size() == 0) {
                    // khoi tao
                    boolean khoitao = apiChuyenBay.AddChuyenBay(ngaykhoihanh, ngaykhoihanh, arrTuyenBay);
                    if (khoitao) {
                        arrChuyenBay = apiChuyenBay.getListChuyenBaybyNgayDi(ngaykhoihanh);
                        out.println("<br><font family = 'Time New Romen' size='5'>");
                        out.println("Chuyến bay từ " + di + " đến " + den + "</font>");
                        out.println("<br>");
                        out.println("<br>");
                    } else {
                        // Thong Bao khong co chuyen bay
                        out.println("<br><font family = 'Time New Romen' size='5' >");
                        out.println("Không có chuyến bay từ " + di + " đến " + den + "</font>");
                        out.println("<br>");
                        out.println("<br>");
                    }
                } else {
                    out.println("<br><font family = 'Time New Romen' size='5' >");
                    out.println("Chuyến bay từ " + di + " đến " + den + "</font>");
                    out.println("<br>");
                    out.println("<br>");
                    arrChuyenBay = apiChuyenBay.getListChuyenBaybyNgayDi(ngaykhoihanh);
                }
            }
        %>
        <% if (arrTuyenBay.size() == 0 || arrChuyenBay.size() == 0) {%>
        <form id="frm1" action="index.jsp" onsubmit=" true">
            <input class="AvailableFromBUTTON" type="submit"  value="Quay lại" /></form>
        <% } else { %>
        <form id="frm1" action="InformationForm.jsp" onsubmit=" return kiemtra()">
            <table class="FormAvailable" border="3" style="margin-top:10px; margin-left:50px;margin-right: 20px; padding-left: 0px;">
                <tr class="AFormHeader">
                    <th></th>
                    <th>Hãng</th>
                    <th>Khởi hành</th>
                    <th>Ngày đi</th>
                    <th>Đến</th>
                    <th>Ngày đến</th>
                    <th>Giá vé thường</th>
                    <th>Tổng tiền vé thường</th>
                    <th>Giá vé VIP</th>
                    <th>Tổng tiền Vé VIP</th>
                </tr>
                <% for (TuyenBay Tb : arrTuyenBay) {%>
                <% for (ChuyenBay Cb : arrChuyenBay) {%>
                <%if (Cb.getMaTB().equals(Tb.getMaTB())) {%>

                <input type="hidden" name="type" value="<%=type%>">
                <tr>
                    <td><input type="radio" name="macb" value="<%= Cb.getMaCB()%>"></td>
                    <!--Hang hang khong-->
                    <td>
                        <%if (Tb.getMaHHK().equals("VNA")) {%>
                        <img src="./images/VietNamAirline.jpg " height="40px" >
                        <%} else if (Tb.getMaHHK().equals("VJ")) {%>
                        <img src="./images/VietJet.jpg " height="40px" >
                        <%} else if (Tb.getMaHHK().equals("BL")) {%>
                        <img src="./images/JetStar.jpg " height="40px" >
                        <%} else {
                                out.println(Tb.getMaHHK());
                            }%>
                    </td>
                    <td>
                        <%=di%>
                    </td>
                    <td>
                        <%=ngaykhoihanh%><br>
                        <%=Tb.getGioDi()%><br>
                    </td>
                    <td>
                        <%=den%>
                    </td>
                    <td>
                        <%=ngaykhoihanh%><br>
                        <%=Tb.getGioDen()%><br>
                    </td>
                    <td>
                        <%=Tb.getGiaThuong()%><br>
                    </td>
                    <td>
                        <%if (Tb.getMaHHK().equals("VNA")) {%>
                        <% tien = (Tb.getGiaThuong() + Tb.getGiaThuong() * 10 / 100 + 50000 + 70000 + 10000) * sluong;%>
                        <%=tien%>
                        <%} else if (Tb.getMaHHK().equals("VJ")) {%>
                        <% tien = (Tb.getGiaThuong() + Tb.getGiaThuong() * 10 / 100 + 60000 + 75000 + 33000) * sluong;%>
                        <%=tien%>
                        <%} else if (Tb.getMaHHK().equals("BL")) {%>

                        <% tien = (Tb.getGiaThuong() + Tb.getGiaThuong() * 10 / 100 + 60000 + 33000 + 50000) * sluong;%>
                        <%=tien%>
                        <% }%>
                        <input type="radio" value="0"name="loaivedi" required >
                    </td>
                    <td>
                        <%=Tb.getGiaVIP()%><br>
                    </td>
                    <td>
                        <%if (Tb.getMaHHK().equals("VNA")) {%>
                        <% tien = (Tb.getGiaVIP() + Tb.getGiaVIP() * 10 / 100 + 50000 + 70000 + 10000) * sluong;%>
                        <%=tien%>
                        <%} else if (Tb.getMaHHK().equals("VJ")) {%>
                        <% tien = (Tb.getGiaVIP() + Tb.getGiaVIP() * 10 / 100 + 60000 + 75000 + 33000) * sluong;%>
                        <%=tien%>
                        <%} else if (Tb.getMaHHK().equals("BL")) {%>

                        <% tien = (Tb.getGiaVIP() + Tb.getGiaVIP() * 10 / 100 + 60000 + 33000 + 50000) * sluong;%>
                        <%=tien%>
                        <% }%>
                        <input type="radio" value="1"name="loaivedi" required >

                    </td>
                </tr>
                <%}%>
                <%}%>
                <%}%>
            </table>
            <% if (type.equals("roundtrip")) {

                    ArrayList<TuyenBay> arrTuyenBayVe = new ArrayList();
                    TuyenBayDAOImpl apiTuyenBayVe = new TuyenBayDAOImpl();
                    arrTuyenBayVe = apiTuyenBayVe.getListTuyenBay(diadiemden, diadiemdi);

                    ArrayList<ChuyenBay> arrChuyenBayVe = new ArrayList();
                    ChuyenBayDAOImpl apiChuyenBayVe = new ChuyenBayDAOImpl();
                    arrChuyenBayVe = apiChuyenBayVe.getListChuyenBaybyNgayDi(ngayve); // ngay ve + ma chuyen bay ->

                    if (arrTuyenBayVe.size() == 0) {
                        out.println("<br><font family = 'Time New Romen' size='10' >");
                        out.println("Chưa hỗ trợ tuyến bay từ " + den + " đến " + di + "</font>");
                        out.println("<br>");
                        out.println("<br>");
                    } else {
                        if (arrChuyenBayVe.size() == 0) {
                            // khoi tao
                            boolean khoitao = apiChuyenBay.AddChuyenBay(ngayve, ngayve, arrTuyenBayVe);
                            if (khoitao) {
                                arrChuyenBayVe = apiChuyenBay.getListChuyenBaybyNgayDi(ngayve);
                                out.println("<br><font family = 'Time New Romen' size='5' >");
                                out.println("Chuyến bay từ " + den + " đến " + di + "</font>");
                                out.println("<br>");
                                out.println("<br>");
                            } else {
                                // Thong Bao khong co chuyen bay
                                out.println("<br><font family = 'Time New Romen' size='5' >");
                                out.println("Không có chuyến bay từ " + den + " đến " + di + "</font>");
                                out.println("<br>");
                                out.println("<br>");
                            }

                        } else {
                            arrChuyenBayVe = apiChuyenBay.getListChuyenBaybyNgayDi(ngayve);
                            out.println("<br><font family = 'Time New Romen' size='5' >");
                            out.println("Chuyến bay từ " + den + " đến " + di + "</font>");
                            out.println("<br>");
                            out.println("<br>");
                        }
                    }

            %>
            <h2 style="font-family: Times New Roman; margin-left: 50px; font-size: 50px;"></h2>
            <table class="FormAvailable" border="3" style="margin-top:10px; margin-left:50px;margin-right: 20px; padding-left: 0px;">
                <tr class="AFormHeader">
                    <th>Hãng</th>
                    <th>Khởi hành</th>
                    <th>Ngày đi</th>
                    <th>Đến</th>
                    <th>Ngày đến</th>
                    <th>Giá Vé Thường</th>
                    <th>Tổng tiền</th>
                    <th>Giá vé VIP</th>
                    <th>Tổng tiền</th>

                </tr>
                <% for (TuyenBay Tbve : arrTuyenBayVe) {%>
                <% for (ChuyenBay Cbve : arrChuyenBayVe) {%>
                <%if (Cbve.getMaTB().equals(Tbve.getMaTB())) {%>
                <input type="hidden" name="macbve" value="<%= Cbve.getMaCB()%>">
                <td>
                    <%if (Tbve.getMaHHK().equals("VNA")) {%>
                    <img src="./images/VietNamAirline.jpg " height="40px" >
                    <%} else if (Tbve.getMaHHK().equals("VJ")) {%>
                    <img src="./images/VietJet.jpg " height="40px" >
                    <%} else if (Tbve.getMaHHK().equals("BL")) {%>
                    <img src="./images/JetStar.jpg " height="40px" >
                    <%} else {
                            out.println(Tbve.getMaHHK());
                        }%>

                </td>
                <td>
                    <%=den%>;
                </td>
                <td>
                    <%=ngayve%><br>
                    <%=Tbve.getGioDi()%>
                </td>
                <td>
                    <%=di%>
                </td>
                <td>
                    <%=Cbve.getNgayDen()%><br>
                    <%=Tbve.getGioDen()%><br>
                </td>
                <td>
                    <%=Tbve.getGiaThuong()%><br>
                </td>
                <td>
                    <%if (Tbve.getMaHHK().equals("VNA")) {%>
                    <% tien = (Tbve.getGiaThuong() + Tbve.getGiaThuong() * 10 / 100 + 50000 + 70000 + 10000) * sluong;%>
                    <%=tien%>
                    <%} else if (Tbve.getMaHHK().equals("VJ")) {%>
                    <% tien = (Tbve.getGiaThuong() + Tbve.getGiaThuong() * 10 / 100 + 60000 + 75000 + 33000) * sluong;%>
                    <%=tien%>
                    <%} else if (Tbve.getMaHHK().equals("BL")) {%>

                    <% tien = (Tbve.getGiaThuong() + Tbve.getGiaThuong() * 10 / 100 + 60000 + 33000 + 50000) * sluong;%>
                    <%=tien%>
                    <% }%>
                    <input type="radio" value="0"name="loaiveve" required >
                </td>
                <td>
                    <%=Tbve.getGiaVIP()%><br>
                </td>
                <td>
                    <%if (Tbve.getMaHHK().equals("VNA")) {%>
                    <% tien = (Tbve.getGiaVIP() + Tbve.getGiaVIP() * 10 / 100 + 50000 + 70000 + 10000) * sluong;%>
                    <%=tien%>
                    <%} else if (Tbve.getMaHHK().equals("VJ")) {%>
                    <% tien = (Tbve.getGiaVIP() + Tbve.getGiaVIP() * 10 / 100 + 60000 + 75000 + 33000) * sluong;%>
                    <%=tien%>
                    <%} else if (Tbve.getMaHHK().equals("BL")) {%>

                    <% tien = (Tbve.getGiaVIP() + Tbve.getGiaVIP() * 10 / 100 + 60000 + 33000 + 50000) * sluong;%>
                    <%=tien%>
                    <% }%>
                    <input type="radio" value="1"name="loaiveve" required 
                </td>
                </tr>
                <%}%>
                <%}%>
                <%}%>
            </table>
            <%}%>
            <input type="hidden" name="soluong" value="<%= soluong%>"  >
            <input class="AvailableFromBUTTON" type="submit"  value="Tiếp tục" />
        </form>   
        <%}%>
    </body>
</html>
