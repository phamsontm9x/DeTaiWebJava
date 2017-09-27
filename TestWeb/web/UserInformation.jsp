
<%@page import="model.TaiKhoanUser"%>
<%@page import="dao.TaiKhoanUserDAO"%>
<!DOCTYPE html>
<html >
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <title>Thông tin tài khoản</title>
        <link rel="stylesheet" href="css/csschangepassword.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="../css/Style.css" rel="stylesheet" type="text/css"/>
        <link href="css/stylenew.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>

    </head>

    <script>
        
        <% String mail = (String) session.getAttribute("email");
            TaiKhoanUserDAO tkuser = new TaiKhoanUserDAO();
            TaiKhoanUser tkus = tkuser.GetTKbyEmail(mail);
        %>
        
        function isEditInfo() {
            // save Data xuống database
            var name = document.getElementById('Hoten');
            var cmnd = document.getElementById('Cmnd');
            var phoneNumber = document.getElementById('Dienthoai');
            var address = document.getElementById('Diachi');
            var email = document.getElementById('Email');
            return true;
        }

    </script>

    <body>
          <body>
        <div class="body">
            <div class="main">
                <div class="header">
                    <div class="header_resize">
                        <div class="menu_nav">
                            <ul>
                                <li class="active"><a href="index.jsp"><span>Trang Chủ</span></a></li>
                                <li><a href="Userchangepassword.jsp"><span>Đổi Mật Khẩu</span></a></li>
                                <li><a href="Logout.jsp"><span>Đăng Xuất</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clr"></div>

                    <div class="content">
                        <div class="InformationForm">
                            <div class="IFbg">
                                <h2>Thông Tin Tài Khoản</h2>
                                <form method="post" action="ChangeInformation" onsubmit="return isEditInfo()" id="frm">
                                    <div ><font color="white" > Họ tên:</font>
                                        <input name="Hoten" type="text" value="<%=tkus.getHoten()%>" required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>
                                    </div>


                                    <div ><font color="white"> CMND:</font>
                                        <input name="Cmnd" type="text" id="cmnd" value="<%=tkus.getCMND()%>"required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>

                                    </div>
                                    <div ><font color="white"> SĐT:</font>
                                        <input name="Dienthoai" type="text" id="sdt" value="0<%=tkus.getSDT()%>" required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>

                                    </div>
                                    <div > <font color="white"> Địa chỉ:</font>
                                        <input name="Diachi" type="text" id="dchi" value="<%=tkus.getDiaChi()%>"required style="font-family: Time New Roman; font-size: 20px;text-align: left;"/>

                                    </div>
                                    
                                     <div><input  t type="submit" name="login" class="login login-submit" value="Xác nhận" >  </div>
                                          
                                </form>
                            </div>
                        </div>
                    </div>
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
