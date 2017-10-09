<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="model.DiaDiem"%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Trang chủ</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/cufon-yui.js" type="text/javascript"></script>
        <link href="css/stylenew.css" rel="stylesheet" type="text/css"/>
        <script src="js/cufon-titillium-250.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/coin-slider.min.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            //Check 1 chieu hay khu hoi 
            function yesnoCheck() {
                if (document.getElementById('roundtrip').checked) {
                    document.getElementById('ifYes').style.display = 'block';
                } else
                    document.getElementById('ifYes').style.display = 'none';
            }

            function kiemtra() {
                var diadiemdi = document.getElementById("diadiemdi");
                var diadiemden = document.getElementById("diadiemden");
                var ngaydi = document.getElementById("ngaykhoihanh");
                if (diadiemdi.value == "Chọn điểm đi") {
                    alert("Chưa Chọn Địa điểm Đi");
                    return false;
                }
                if (diadiemden.value == "Chọn điểm đến") {
                    alert("Chưa Chọn Địa điểm Đến");
                    return false;
                }
                if (diadiemdi.value === diadiemden.value) {
                    alert("Địa điểm Đi và Đến không được phép trùng nhau.\n Xin bạn vui lòng chọn lại địa chỉ");
                    return false;
                }
                if (ngaydi.value === "") {
                    alert("Bạn chưa chọn ngày khởi hành");
                    return false;
                }
                if (document.getElementById('ifYes').style.display === "block")
                {
                    var ngayve = document.getElementById("ngayve");
                    if (ngayve.value === "") {
                        alert("Bạn chưa chọn ngày về");
                        return false;
                    }
                }
            <%  String tencheck = "";
                if (session.getAttribute("ten") == null) {%>////////
                alert("Bạn hãy dăng nhập trước khi mua vé và thanh toán");
                return true;
            <%} else {
                }%>
            }
        </script>
    </head>
    <body >
        <div class="body">
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                String time = sdf.format(date);
                DiaDiemDAOImpl DD = new DiaDiemDAOImpl();
            %>
            <div class="main">
                <div class="header">
                    <div class="header_resize">
                        <div class="menu_nav" style="margin-bottom: 50px;margin-top: 20px;">
                            <ul>
                                <li><a href="index.jsp" style="margin-bottom: 20px;">TRANG CHỦ </a></li>
                                <li><a href="News.jsp" style="margin-bottom: 20px;">THÔNG TIN </a></li>
                                    <%  String ten = "";
                                        try {
                                            ten = (String) session.getAttribute("ten");
                                            if (ten.equals("") || ten == null) { %>
                                <li><a href="RegisterLogin.jsp"style="margin-bottom: 20px;">ĐĂNG NHẬP </a></li>
                                    <%} else {%>

                                <li><a href="DonHang.jsp"style="margin-bottom: 20px;">Xem Đơn Hàng</a></li>
                                <li><a href="UserInformation.jsp"style="margin-bottom: 20px;">Tài Khoản</a></li>
                                <li> <a href="Logout.jsp" style="margin-bottom: 20px;" >ĐĂNG XUẤT</a>
                                </li>
                                <%}
                                } catch (Exception e) { %>
                                <li><a href="RegisterLogin.jsp"style="margin-bottom: 20px;">ĐĂNG NHẬP </a></li>
                                    <%}%>
                            </ul>
                        </div>

                        <div class="clr"></div>
                        <div class="slider">
                            <div id="coin-slider"> 
                                <a href="#"><img src="images/AirSlider1.jpg" width="960" height="360" alt="" /></a> 
                                <a href="#"><img src="images/AirSlider2.jpg" width="960" height="360" alt="" /></a> 
                                <a href="#"><img src="images/AirSlider3.jpg" width="960" height="360" alt="" /></a> </div>
                            <div class="clr"></div>
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
                <div class="search-panel">
                    <p style=" text-align: center; font-size:36px;color: highlighttext" >TÌM KIẾM CHUYẾN BAY</p>
                    <form class="InsideSearchForm" id="frm" action="FindAirline.jsp" onsubmit="return kiemtra()"style="margin-left: 400px; margin-right: 400px;margin-bottom: 50px;margin-top: 20px;padding-left: 20px;">
                        <pre>
                    <div class="wrapper">
                        <p style="font-size: 20px; font-family: Times new Roman;margin-left: -60px;margin-bottom: -60px;"> <input type="radio" name="type" value="oneway" required id="oneway" onclick="javascript:yesnoCheck();">Một Chiều </p><p style="font-family: Times new roman;font-size: 20px;"><input type="radio" name="type" value="roundtrip" required id="roundtrip" onclick="javascript:yesnoCheck();"style="margin-left: 120px;margin-top: 30px;margin-right: 10px;">Khứ Hồi</p>                     
                        <p style="font-size: 16px; font-family: Times new Roman;margin-left: -80px;margin-bottom:-10px;">ĐIỂM ĐI :<select id="diadiemdi" name="diadiemdi" required style="font-size: 20px; font-family: Times new Roman;height: 40px;margin-left:40px; width: 175px;">
                               <option value="Chọn điểm đi">Chọn điểm đi</option>
                                        <%for (DiaDiem dd : DD.getListDiaDiem()) {%>
                            <option value="<%=dd.getMaDD()%>" > <%=dd.getTenDD()%> </option>
                                        <%}%>
                            </select></p>
                            <p style="font-size: 16px; font-family: Times new Roman;margin-left: -80px;margin-bottom:-10px;">ĐIỂM ĐẾN : <select id="diadiemden" name="diadiemden" required style="font-size: 20px; font-family: Times new Roman;height: 40px;margin-left:20px;width: 175px;">
                                    <option value="Chọn điểm đến">Chọn điểm đến</option>
                                        <%for (DiaDiem dd : DD.getListDiaDiem()) {%>
                            <option value="<%=dd.getMaDD()%>"><%=dd.getTenDD()%></option>
                                        <%}%>
                                </select></p>
                                <p style="font-size: 16px; font-family: Times new Roman;margin-left: -80px;margin-bottom:-10px;margin-top: 5px;">NGÀY ĐI :<input id="ngaykhoihanh" name="ngaykhoihanh" type="date" min="<%=time%>" style="font-size: 20px; font-family: Times new Roman;height: 40px;width: 175px;margin-left: 35px;"  /></p>
                        <div id="ifYes" style="display:none" >
                            <p style="font-size: 16px; font-family: Times new Roman;margin-left: -80px;margin-bottom:-10px;margin-top: -35px;">NGÀY VỀ :<input id="ngayve" name="ngayve" type="date" min="<%=time%>" style="font-size: 20px; font-family: Times new Roman;height: 40px;margin-left: 32px;width: 175px;"  /> </p>
                        </div>
                                <p style="font-size: 16px; font-family: Times new Roman;margin-left: -80px;margin-bottom:-10px;margin-top: 5px;">SỐ LƯỢNG :<input type="number" min="1"  name="soluong" required="required"style="font-size: 20px; font-family: Times new Roman;height: 40px;margin-left: 28px;width: 50px;text-align: center;" ></p>
                        
                                <button class="SearchButton" type="submit"style="margin-left: -220px; font-size: 20px;font-family:Times new Roman ">Tìm Kiếm </button>
                    <br>
                    </div>
                        </pre>
                    </form>
                </div>
            </div>
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
