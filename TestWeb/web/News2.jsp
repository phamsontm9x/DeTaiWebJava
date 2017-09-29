
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

        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="menu_nav">
                        <ul>
                            <li class="active"><a href="index.jsp"><span>Trang chính</span></a></li>
                            <li><a href="News.jsp"><span>Thông tin</span></a></li>
                            <li><a href="about.jsp"><span>Chúng tôi</span></a></li>


                        </ul>
                    </div>
                    <div class="logo">
                        <h1><a href="index.jsp">Cheap<span>Airline</span> <small>Bay là thích</small></a></h1>
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


            <div class="content">
                <div class="content_resize">
                    <div class="mainbar">
                        <div class="article">

                            <div class="clr"></div>
                            </br>
                            <strong>Tăng tần suất bay, Vietnam Airlines triển khai ngay ưu đãi cho hành trình Sài Gòn – Thanh Hóa</strong></br></br></br>
                            Đáp ứng nhu cầu di chuyển tăng cao của người dân trên hành trình Sài Gòn – Thanh Hóa, hãng hàng không Vietnam Airlines đã quyết định tăng tần suất phục vụ cho hành trình này.  Ngay sau khi thông báo tăng tải hãng hàng không quốc gia đẽ triển khai ngay ưu đãi cực hấp dẫn cho đường bay Sài Gòn – Thanh Hóa.
                            <img src="./images/NewsIMG2a.jpg" width="700px" height="333px" /></br></br>
                            Đường bay Sài Gòn – Thanh Hóa được Vietnam Airlines chính thức đưa vào khai thác từ tháng 2/2013 tần suất 5 chuyến/tuần sau đó tăng lên 7 chuyến/tuần từ tháng 10/2013.</br>
                            Và bắt đầu từ ngày 27/03/2016 Vietnam Airlines đã tăng thêm tần suất lên 2 chuyến/ ngày (14 chuyến/tuần) trên đường bay thẳng Sài Gòn – Thanh Hóa. Các chuyến bay được khai thác bằng máy bay Airbus A321 với giờ khởi hành từ Sài Gòn đi Thanh Hóa lúc 12h10p và 17h40p; từ Thanh Hóa đi Sài Gòn lúc 14h55p và 20h25p, thời gian bay dự kiến là 1giờ 55 phút.</br>
                            Đường bay kết nối giữa Sài Gòn và Thanh Hóa của hãng hàng không Vietnam Airlines đã tạo điều kiện thuận tiện cho việc kết nối giữa tỉnh Thanh Hóa nói riêng và khu vực Bắc Trung bộ nói chung với Sài Gòn - trung tâm phát triển kinh tế sôi động của cả nước.
                            <img src="./images/NewsIMG2b.jpg" width="700px" height="333px"/></br></br>
                            Vậy là từ nay, các bạn đã có thêm sự lựa chọn cho hành trình của mình khi đến với Sài Gòn. Đây là thành phố trẻ với những bước phát triển vượt bậc về kinh tế chỉ trong một khoảng thời gian ngắn. Sự hiện đại của những tòa cao ốc, các khu thương mại, trung tâm giải trí luôn sáng đèn đêm ngày chắc chắc sẽ làm hài lòng những ai một lần đã đến.

                            <div class="clr"></div>
                        </div>
                    </div>
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
