
<%@page import="model.TaiKhoanUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TaiKhoanUserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <title>Thông tin hành khách</title>
        <link href="../css/Style.css" rel="stylesheet" type="text/css"/>
        <link href="css/stylenew.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <%
            String macb = "";
            macb = request.getParameter("macb");

            String type = "";
            type = request.getParameter("type");
            String tb = "";
            if (request.getAttribute("tb") != null) {
                tb = (String) request.getAttribute("tb");
            }

            String loaivedi = "";
            if (request.getParameter("loaivedi") != null) {
                loaivedi = request.getParameter("loaivedi");
            }

            String loaiveve = "";
            if (request.getParameter("loaiveve") != null) {
                loaiveve = request.getParameter("loaiveve");
            }

            int soluong = 1;
            if (request.getParameter("soluong") != null) {
                String soluongs = "";
                soluongs = request.getParameter("soluong");
                try {
                    soluong = Integer.parseInt(soluongs);
                } catch (Exception e) {
                }
            }
        %>
        <script>
            function checkElementINF() {

                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var rcmnd9 = /^\d{9}$/;
                var rcmnd12 = /^\d{12}$/;

                var rsdt11 = /^\d{11}$/;
                var rsdt10 = /^\d{10}$/;
                var rsdt9 = /^\d{9}$/;
                var rsdt8 = /^\d{8}$/;
                var rsdt7 = /^\d{7}$/;

                //Check khach hanh phu
            <% for (int i = 1; i < soluong; i++) {%>
                var hanhly = document.getElementById("hanhly<%=i%>").value;
                parseInt(hanhly);
                var cmnd = document.getElementById("cmnd<%=i%>").value;
                parseInt(cmnd);
                if ((rcmnd9.test(cmnd) == false) && (rcmnd12.test(cmnd) == false)) {
                    document.getElementById("cmnd<%=i%>").style.border = "solid 3px red";
                    alert("Mời bạn xem lại phần thông tin Số Chứng Minh Nhân Dân \nSố Chứng Minh Nhân Dân là dãy số gồm 9 hay 12 chữ số");
                    document.getElementById("cmnd<%=i%>").focus();
                    return false;
                } else {
                    document.getElementById("cmnd<%=i%>").style.border = "solid 1px black"
                }
                var sdt = document.getElementById("sdt<%=i%>").value;
                if ((rsdt7.test(sdt) == false) && (rsdt8.test(sdt) == false) && (rsdt9.test(sdt) == false) && (rsdt10.test(sdt) == false) && (rsdt11.test(sdt) == false)) {
                    document.getElementById("sdt<%=i%>").style.border = "solid 3px red";
                    alert("Mời bạn xem lại phần thông tin Số Điện Thoại \nSố Điện Thoại là dãy số từ 7 đến 11 chữ số");
                    document.getElementById("sdt<%=i%>").focus();
                    return false;
                } else {
                    document.getElementById("sdt<%=i%>").style.border = "solid 1px black";
                }
            }
            <%}%>
            }
        </script>
    </head>
    <body>
        <div class="body">
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
                    </div>
                    <div class="clr"></div>

                    <form id="frm" method="POST" action="ThongTin_HK_CB_Servlet" onsubmit="return checkElementINF();">
                        <input type="hidden" name="macb" value="<%=macb%>" />
                        <input type="hidden" name="soluong" value="<%=soluong%>"/>
                        <input type="hidden" name="loaivedi" value="<%=loaivedi%>">
                        <input type="hidden" name="loaiveve" value="<%=loaiveve%>">
                        <input type="hidden" name="type" value="<%= type%>">       
                        <% for (int i = 1; i <= soluong; i++) {%>   

                        <div class="content">
                            <div class="InformationForm">
                                <div class="IFbg">
                                    <% if (soluong == 1) {%>
                                    <h2>Thông tin hành khách</h2>
                                    <%} else {%>
                                    <h2>Thông tin hành khách <%= i%> </h2>
                                    <%}%>
                                    <div ><font color="white"> Họ tên:</font>
                                        <input name="hoten<%=i%>" type="text" required style="font-family: Time New Roman; font-size: 20px;text-align: left;">
                                    </div>

                                    <div ><font color="white"> CMND:</font>
                                        <input name="cmnd<%=i%>" type="text" id="cmnd<%=i%>" required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>

                                    </div>
                                    <div ><font color="white"> Số điện thoại:</font>
                                        <input name="sdt<%=i%>" type="text" id="sdt<%=i%>" required style="font-family: Time New Roman; font-size: 20px;text-align: left;" />

                                    </div>
                                    <div > <font color="white"> Địa chỉ:</font>
                                        <input name="dchi<%=i%>" type="text"   required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>

                                    </div>
                                    <div><font color="white"> Hành lý:</font>
                                        <select required name="hanhly<%=i%>" >
                                            <option value="0">Không cảm ơn</option>
                                            <option value="10">Gói 10kg</option>
                                            <option value="20">Gói 20kg</option>
                                            <option value="30">Gói 30kg</option>
                                        </select>
                                    </div >
                                    <%if (request.getParameter("macbve") != null) {

                                            String macbve = (String) request.getParameter("macbve");
                                    %>
                                    <input type="hidden" name="macbve" value="<%=macbve%>" />

                                    <div><font color="white"> Hành lý chiều về:</font>
                                        <select required name="hanhlyve<%=i%>" >
                                            <option value="0">Không cảm ơn</option>
                                            <option value="10">Gói 10kg</option>
                                            <option value="20">Gói 20kg</option>
                                            <option value="30">Gói 30kg</option>
                                        </select>
                                    </div >
                                    <% }%>
                                    <button type="submit" >Xác Nhận</button>
                                    <p style="color:red;"><%=tb%></p>
                                </div>
                            </div>
                        </div> 
                        <%}%>       
                    </form>
                </div>
            </div>
            <div class="clr"></div>
        </div>
        <%  String alertUpdateUser = "";
            if (request.getAttribute("updateUserInformation") != null) {
                alertUpdateUser = (String) request.getAttribute("updateUserInformation");%>
        <script> alert("<%=alertUpdateUser%>");</script>
        <%} else {
            }
        %>
    </body>
</html>
