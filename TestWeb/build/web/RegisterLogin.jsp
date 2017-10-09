<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang đăng kí</title>
        <link rel="stylesheet" href="css/newcss.css">
    </head>
    <script>
        function CheckForm() {
            //Checkpassword
            var password = document.getElementById('password');
            var password1 = document.getElementById('password1');

            if (password.value == password1.value) {

                if (password.value.length < 6) {
                    alert("Mật khẩu phải trên 6 kí tự");
                    password.style.border = "solid 3px red";
                    document.getElementById('password').focus();
                    return false;
                } else {
                    document.getElementById('password').style.border = "solid 1px black";
                }
                re = /[0-9]/;
                if (!re.test(password.value)) {
                    alert("Mật khẩu của bạn phải có 1 kí tự số");
                    password.style.border = "solid 3px red";
                    document.getElementById('password').focus();
                    return false;
                } else {
                    document.getElementById('password').style.border = "solid 1px black";
                }
                re = /[A-Z]/;
                if (!re.test(password.value)) {
                    alert("Mật khẩu của bạn phải có 1 chữ cái hoa");
                    password.style.border = "solid 3px red";
                    document.getElementById('password').focus();
                    return false;
                } else {
                    document.getElementById('password').style.border = "solid 1px black";
                }
            } else {
                alert("Xác nhận mật khẩu sai");
                password1.style.border = "solid 3px red";
                document.getElementById('password').focus();
                return false;
            }
            document.getElementById('password1').style.border = "solid 1px black";

            var rcmnd9 = /^\d{9}$/;
            var rcmnd12 = /^\d{12}$/;
            var rsdt11 = /^\d{11}$/;
            var rsdt10 = /^\d{10}$/;
            var rsdt9 = /^\d{9}$/;
            var rsdt8 = /^\d{8}$/;
            var rsdt7 = /^\d{7}$/;

            var cmnd = document.getElementById('cmnd').value;
            var sdt = document.getElementById('sdt').value;

            if (rsdt7.test(sdt) == false && rsdt8.test(sdt) == false && rsdt9.test(sdt) == false && rsdt10.test(sdt) == false && rsdt11.test(sdt) == false) {
                document.getElementById('sdt').style.border = "solid 3px red";
                alert("Mời bạn xem lại phần thông tin Số Điện Thoại \nSố Điện Thoại là dãy số từ 7 đến 11 chữ số");
                document.getElementById('sdt').focus();
                return false;
            } else {
                document.getElementById('sdt').style.border = "solid 1px black";
            }
            if (rcmnd9.test(cmnd) == false && rcmnd12.test(cmnd) == false) {
                document.getElementById('cmnd').style.border = "solid 3px red";
                alert("Mời bạn xem lại phần thông tin Số Chứng Minh Nhân Dân \nSố Chứng Minh Nhân Dân là dãy số gồm 9 hay 12 chữ số");
                document.getElementById('cmnd').focus();
                return false;
            } else {
                document.getElementById('cmnd').style.border = "solid 1px black"
            }
        }
    </script>

    <body>
        <div class="login-page">
            <div class="form">
                <form class="register-form" id="DK" action="DangKiKhachHang" method="post" onsubmit=" return CheckForm()">
                    <input type="text" placeholder="Họ Tên" name="hoten" required/>
                    <input type="password" placeholder="Mật khâu" name="password" required id="password"/>
                    <input type="password" placeholder="Nhập lại mật khẩu" name="password1" required id="password1"/>
                    <input type="email" placeholder="Địa chỉ email" name="email" required id="email"/>
                    <input type="text" placeholder="Số Điện Thoại" name="sdt" required id="sdt">
                    <input type="text" placeholder="Chứng Minh Nhân Dân" name="cmnd" required id="cmnd">
                    <input type="text" name="gioitinh" list="gioitinh" placeholder="Giới Tính" required>
                    <datalist id="gioitinh">
                        <option value="Nam">
                        <option value="Nữ">
                        <option value="Khác">    
                    </datalist>
                    <input type="text" placeholder="Địa Chỉ" name="DiaChi" required id="DiaChi">
                    <button type="submit" >Đăng kí</button>
                </form>
                <form class="login-form" method="post" action="DangNhap">
                    <input type="email" placeholder="Email" name="email" required/>
                    <input type="password" placeholder="Password" name="password" required/>
                    <button>Đăng Nhập</button>
                    <p class="message">Nếu bạn chưa có tài khoản <a href="#">Bấm vào đây để tạo tài khoản</a></p>
                </form>
            </div>
        </div>
        <script src='js/newjavascript1.js'></script>
        <script src="js/newjavascript.js"></script>

        <% String tb = "";
            if (request.getAttribute("tb") != null) {
                tb = (String) request.getAttribute("tb");%>
        <script>
                    alert("<%=tb%>")
        </script>
        <%}%>
    </body>
</html>
