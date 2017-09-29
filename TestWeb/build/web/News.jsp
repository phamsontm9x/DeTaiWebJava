
<%@page import="model.DiaDiem"%>
<%@page import="dao.DiaDiemDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >

    <head>
        <title>Tin tức</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/cufon-titillium-250.js"></script>
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/coin-slider.min.js"></script>
    </head>
    <body>
        <%
            DiaDiemDAOImpl DD = new DiaDiemDAOImpl();

        %>
        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="menu_nav">
                        <ul>
                            <li class="active"><a href="index.jsp"><span>Trang chủ</span></a></li>
                            <li><a href="about.jsp"><span>Chúng tôi</span></a></li>
                            <li> <a href="Logout.jsp" style="margin-bottom: 20px;" >ĐĂNG XUẤT</a>

                        </ul>
                    </div>
                    
                    <div class="clr"></div>
                   
                    <div class="clr"></div>
                </div>
         

            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">
                            <h2><span>Tin nóng</h2>
                            <div class="clr"></div>
                            <div class="img"><img src="images/img1.jpg" width="200" height="210" alt="" class="fl" /></div>
                            <div class="post_content">
                                VietJet Air thông báo khai thác đường bay mới Tp. Hồ Chí Minh - Kuala Lumpur và ngược lại từ ngày 01/06/2016 
                                <p class="spec"><a href="News1.jsp" class="rm">Read more</a></p>
                            </div>
                            <div class="clr"></div>
                        </div>
                        <div class="article">
                           
                            <div class="clr"></div>
                            <div class="img"><img src="images/img2.jpg" width="200" height="210" alt="" class="fl" /></div>
                            <div class="post_content">
                                Đáp ứng nhu cầu di chuyển tăng cao của người dân trên hành trình Sài Gòn – Thanh Hóa, hãng hàng không Vietnam Airlines đã quyết định tăng tần suất phục vụ cho hành trình này.  Ngay sau khi thông báo tăng tải hãng hàng không quốc gia đẽ triển khai ngay ưu đãi cực hấp dẫn cho đường bay Sài Gòn – Thanh Hóa...........
                            
                                <p class="spec"><a href="News2.jsp" class="rm">Read more</a></p>
                            </div>
                            <div class="clr"></div>
                        </div>
                        
                    </div>
                    <div class="sidebar">
                        <div class="gadget">
                            <h2 class="star"><span>Các hãng hàng không</span></h2>
                            <div class="clr"></div>
                            <ul class="sb_menu">
                                <li><a href="https://www.vietnamairlines.com/vi/">Vietnam airlines</a></li>
                                <li><a href="http://www.vietjetair.com/Sites/Web/vi-VN/Home">Vietjet air</a></li>
                                <li><a href="http://www.jetstar.com/vn/vi/home">Jetstar Pacific</a></li>
                                <li><a href="http://www.thaiairways.com/">Thai Airways</a></li>
                                <li><a href="http://www.singaporeair.com/en_UK/vn/home">Singapore Airlines</a></li>
                                <li><a href="http://www.tigerair.com/sg/en/">Tiger airways</a></li>
                                <li><a href="http://www.qatarairways.com/vn/en/homepage">Qatar Airways</a></li>
                                <li><a href="https://www.koreanair.com/global/en.html">Korean Air</a></li>
                                <li><a href="http://www.hongkongairlines.com/en_HK/homepage">Hongkong Airlines</a></li>
                                
                                


                            </ul>
                        </div>
                 
                    </div>
                    <div class="clr"></div>
                </div>
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
