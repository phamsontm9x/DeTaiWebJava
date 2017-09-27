
<%@page import="model.TaiKhoanUser"%>
<%@page import="dao.TaiKhoanUserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>     
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Đổi mật khẩu</title>
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

        <%
            String email = (String) session.getAttribute("email");
            TaiKhoanUser tk = new TaiKhoanUser();
            TaiKhoanUserDAO tkd = new TaiKhoanUserDAO();
            tk = tkd.GetTKbyEmail(email);
        %>

        function Checkpasword() {

            var oldpassword = document.getElementById('oldpassword');
            var newpassword = document.getElementById('newpassword');
            var newpassword1 = document.getElementById('newpassword1');

            if (oldpassword.value !== "<%=tk.getPassword()%>") {
                alert("Bạn điền sai mật khẩu cũ, xin bạn vui lòng điền lại");
                document.getElementById('oldpassword').style.border = "solid 3px red";

                return false;
            }
            if (newpassword.value !== newpassword1.value) {
                alert("Mật khẩu xác thực sai, xin bạn vui lòng điền lại");
                document.getElementById('newpassword1').style.border = "solid 3px red";
                return false;
            }
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
                                <li class="active"><a href="index.jsp"><span>Trang chủ</span></a></li>
                                <li><a href="UserInformation.jsp"><span>Thông Tin Tài Khoản</span></a></li>
                                <li><a href="Logout.jsp"><span>Đăng Xuất</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="clr"></div>

                    <div class="content">
                        <div class="InformationForm">
                            <div class="IFbg">
                                <h1>Đổi mật khẩu</h1><br>
                                <form method="post" action="Doipassword" onsubmit="return Checkpasword()" id="frm12">
                                    <div ><font color="white"></font>
                                        <input type="text" name="oldpassword" placeholder="Mật khẩu cũ" required id="oldpassword" style="font-size: 20px; text-align: left">
                                    </div>
                                    <div ><font color="white"></font>
                                        <input type="text" name="newpassword" placeholder="Mật khẩu mới" required id="newpassword" style="font-size: 20px; text-align: left">
                                    </div>
                                    <div > <font color="white"></font>
                                        <input type="text" name="newpassword1" placeholder="Xác nhận" id="newpassword1" required style="font-size: 20px; text-align: left">
                                    </div>

                                    <input  t type="submit" name="login" class="login login-submit" value="Thay đổi" style=" background-color: #4CAF50; /* Green */
                                            border: none;
                                            color: white;
                                            padding: 20px 30px;
                                            text-align: center;
                                            text-decoration: none;
                                            display: inline-block;
                                            font-size: 20px;">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
        <%  String tbdoimk = "";
            if (request.getAttribute("tbdoimk") != null) {
                tbdoimk = (String) request.getAttribute("tbdoimk");%>
        <script> alert("<%=tbdoimk%>");</script>

        <%} else {
            }
        %>
    </body>
</html>
