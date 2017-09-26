<%@page import="java.util.Date"%>
<%@page import="model.DiaDiem"%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <title>Trang chủ</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/coin-slider.min.js"></script>
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

            }
        </script>
    </head>
    <body >

        <%
            DiaDiemDAOImpl DD = new DiaDiemDAOImpl();

        %>




        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="menu_nav">
                        <ul>
                            <li><a href="index.jsp">TRANG CHỦ </a></li>
                            <li><a href="News.jsp">THÔNG TIN </a></li>
                            <li><a href="about.jsp">CHÚNG TÔI </a></li>
                                <%  String ten = "";
                                    try {
                                        ten = (String) session.getAttribute("ten");
                                        if (ten.equals("") || ten == null) { %>
                            <li><a href="RegisterLogin.jsp">ĐĂNG NHẬP </a></li>
                                <%} else {%>
                            <div class="dropdown">
                                <button class="dropbtn"><li><a><%=ten%></a></li></button>
                                <div class="dropdown-content">
                                    <a href="#">Xem thông tin vé</a>
                                    <a href="AccountInformation.jsp">Chỉnh thông tin cá nhân</a>
                                    <a href="Logout.jsp">Đăng Xuất</a>
                                </div>
                            </div>

                            <%}

                            } catch (Exception e) { %>
                            <li><a href="RegisterLogin.jsp">ĐĂNG NHẬP </a></li>
                                <%}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
                  
                        <div id="coin-slider"> </div>
                           
             
  h1 class=                     <"EditAccount">Chỉnh sửa thông tin cá nhân</h1>