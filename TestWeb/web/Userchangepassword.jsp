
<%@page import="dao.TaiKhoanUserDAO"%>
<%@page import="model.TaiKhoanUser"%>
<!DOCTYPE html>
<html >
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <title>Thay đổi mật khẩu</title>
        <link rel="stylesheet" href="css/csschangepassword.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />

    </head>
    <%
        String email = (String) session.getAttribute("email");
//        out.print(email);
        TaiKhoanUser tk = new TaiKhoanUser();
        TaiKhoanUserDAO tkd = new TaiKhoanUserDAO();
        tk = tkd.GetTKbyEmail(email);
//        out.print(tk.getPassword());
    %>

    <script>
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
        <div class="main">
            <div class="header">
                <div class="header_resize">
                    <div class="menu_nav">
                        <ul>
                            <li class="active"><a href="index.jsp"><span>Trang chính</span></a></li>
                            <li><a href="News.jsp"><span>Thông tin</span></a></li>
                            <li><a href="about.jsp"><span>Chúng tôi</span></a></li>
                                <%  String ten = "";
                                    try {
                                        ten = (String) session.getAttribute("ten");
                                        if (ten.equals("") || ten == null) { %>
                            <li><a href="RegisterLogin.jsp">ĐĂNG NHẬP </a></li>
                                <%} else {%>

                            <li>
                                <a href="Logout.jsp">Đăng Xuất</a>
                            </li>
                            <%}

                            } catch (Exception e) { %>
                            <li><a href="RegisterLogin.jsp">ĐĂNG NHẬP </a></li>
                                <%}%>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <br>
        <br>
        <br>
        <div class="login-card">
            <h1>Đổi mật khẩu</h1><br>
            <form method="post" action="Doipassword" onsubmit="return Checkpasword()" id="frm12">
                <input type="text" name="oldpassword" placeholder="Mật khẩu cũ" required id="oldpassword">
                <input type="text" name="newpassword" placeholder="Mật khẩu mới" required id="newpassword">
                <input type="text" name="newpassword1" placeholder="Xác nhận mật khẩu mới" id="newpassword1" required>
                <input type="text" name="abc" placeholder="fjdfdjf" id="kfdkfdkf">

                <input  t type="submit" name="login" class="login login-submit" value="Xác nhận" >
            </form>
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
