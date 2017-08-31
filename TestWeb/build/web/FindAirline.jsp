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
            function kiemtra() {
                var frm1 = document.getElementById("frm1");
                var flg = false;
                for (var i = 0; i < frm1.length - 1; i++) {
                    if (frm1[i].checked)
                        flg = true;
                }
                if (flg == false)
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



        </script>  

        <%
            //soluong hanh khach

            String diadiemdi = "", diadiemden = "", soluong = "", type = "",ngaykhoihanh="", ngayve ="";
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
            if((request.getParameter("ngayve").trim())!=null){
                ngayve = request.getParameter("ngayve");
            }
            ArrayList<TuyenBay> tb_Arr = new ArrayList();
            
            TuyenBayDAOImpl tb = new TuyenBayDAOImpl();
            tb_Arr = tb.getListTuyenBay(diadiemdi, diadiemden);
            
            ArrayList<ChuyenBay> cb_Arr = new ArrayList();
            
            ChuyenBayDAOImpl cb = new ChuyenBayDAOImpl();
            cb_Arr=cb.getListChuyenBaybyNgayDi(ngaykhoihanh);
            
            DiaDiemDAOImpl cd = new DiaDiemDAOImpl();
            String di = cd.getTenDD(diadiemdi);
            String den = cd.getTenDD(diadiemden);
            sluong = Integer.parseInt(soluong);
            int tien=0;
            if (cb.getListChuyenBaybyNgayDi(ngaykhoihanh).size()==0 || tb.getListTuyenBay(diadiemdi, diadiemden).size()==0 ) {
                out.println("<br><font family = 'Time New Romen' size='5' >");
                out.println("Danh sách tất cả mọi Chuyến Bay từ " + di + " đến " + den + "</font>");
                out.println("<br>");
                out.println("<br>");
                tb_Arr = tb.getListTuyenBay(diadiemdi, diadiemden);
                cb_Arr = cb.getListChuyenBay();
            }
            else 
            {
                cb.getListChuyenBaybyNgayDi(ngaykhoihanh);
                tb.getListTuyenBay(diadiemdi, diadiemden);
            }
        %>
        
        
        <form id="frm1" action="InformationForm.jsp" onsubmit=" return kiemtra()">
>
            <table class="FormAvailable" border="3" style="margin-top:10px; margin-left:50px;margin-right: 20px; padding-left: 0px;">
                <tr class="AFormHeader">
                    <th></th>
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
                 <% for (TuyenBay Tb : tb_Arr) {%>
                    <% for (ChuyenBay Cb : cb_Arr) {%>
                      <%if(Cb.getMaTB().equals(Tb.getMaTB())){%>
                      
                      <input type="hidden" name="type" value="<%=type %>">
                      <tr>
                          <td><input type="radio" name="macb" value="<%= Cb.getMaCB()%>"></td>
                    <td>
                        <%if (Tb.getMaHHKg().equals("VA")) {%>
                        <img src="./images/VietNamAirline.jpg " height="40px" >
                        <%} else if (Tb.getMaHHKg().equals("VJ")) {%>
                        <img src="./images/VietJet.jpg " height="40px" >
                        <%} else if (Tb.getMaHHKg().equals("JT")) {%>
                        <img src="./images/JetStar.jpg " height="40px" >
                        <%} else {
                                out.println(Tb.getMaHHKg());
                            }%>

                    </td>
                    <td>
                    <%=di%>
                    </td>
                    <td>
                        <%=ngaykhoihanh%><br>
                        <%=Tb.getGioDi()%>
                    </td>
                    <td>
                    <%=den%>
                    </td>
                    <td>
                        <%=Cb.getNgayDen()%><br>
                        <%=Tb.getGioDen()%><br>
                    </td>
                    <td>
                        <%=Tb.getGiaThuong()%><br>
                    </td>
                    <td>
                        <%if (Tb.getMaHHKg().equals("VA")) {%>
                        <% tien = (Tb.getGiaThuong()+ Tb.getGiaThuong()*10/100+ 50000+70000+10000)*sluong;%>
                           <%=tien%>
                        <%}
                         else if (Tb.getMaHHKg().equals("VJ")) {%>
                             <% tien = (Tb.getGiaThuong()+ Tb.getGiaThuong()*10/100+ 60000+75000+33000)*sluong;%>
                        <%=tien%>
                         <%}else if (Tb.getMaHHKg().equals("JT")) {%>
                         
                             <% tien = (Tb.getGiaThuong()+ Tb.getGiaThuong()*10/100+ 60000+33000 +50000)*sluong;%>
                             <%=tien%>
                  <% }%>
                  <input type="radio" value="0"name="loaivedi" required >
                    </td>
                    <td>
                        <%=Tb.getGiaVIP()%><br>
                    </td>
                    <td>
                        <%if (Tb.getMaHHKg().equals("VA")) {%>
                        <% tien = (Tb.getGiaVIP()+ Tb.getGiaVIP()*10/100+ 50000+70000+10000)*sluong;%>
                           <%=tien%>
                        <%}
                         else if (Tb.getMaHHKg().equals("VJ")) {%>
                             <% tien = (Tb.getGiaVIP()+ Tb.getGiaVIP()*10/100+ 60000+75000+33000)*sluong;%>
                        <%=tien%>
                         <%}else if (Tb.getMaHHKg().equals("JT")) {%>
                         
                             <% tien = (Tb.getGiaVIP()+ Tb.getGiaVIP()*10/100+ 60000+33000 +50000)*sluong;%>
                             <%=tien%>
                  <% }%>
                  <input type="radio" value="1"name="loaivedi" required >
                  
                    </td>
                      </tr>
                <%}%>
<%}%>
<%}%>
            </table>
            <% if(type.equals("roundtrip")){
                ArrayList<TuyenBay> tb_Arrve = new ArrayList();
            
            TuyenBayDAOImpl tbve = new TuyenBayDAOImpl();
            tb_Arr = tb.getListTuyenBay(diadiemden, diadiemdi);
            
            ArrayList<ChuyenBay> cb_Arrve = new ArrayList();
            
            ChuyenBayDAOImpl cbve = new ChuyenBayDAOImpl();
            cb_Arrve=cbve.getListChuyenBaybyNgayDi(ngayve);
            if (cb.getListChuyenBaybyNgayDi(ngaykhoihanh).size()==0) {
                out.println("<br><font family = 'Time New Romen' size='5' >");
                out.println("Không có chuyến bay trong ngày này");
                out.println("Danh sách tất cả mọi Chuyến Bay từ " + di + " đến " + den + "</font>");
                out.println("<br>");
                out.println("<br>");
                tb_Arrve = tb.getListTuyenBay(diadiemdi, diadiemden);
                cb_Arrve = cb.getListChuyenBay();
            }
            else 
            {
                cb_Arrve = cb.getListChuyenBaybyNgayDi(ngayve);
                tb_Arrve = tb.getListTuyenBay(diadiemdi, diadiemden);
            }
            %>
            <h2 style="font-family: Times New Roman; margin-left: 50px; font-size: 50px;">Chuyến Bay Về</h2>
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
                <% for (TuyenBay Tbve : tb_Arrve) {%>
                    <% for (ChuyenBay Cbve : cb_Arrve) {%>
                      <%if(Cbve.getMaTB().equals(Tbve.getMaTB())){%>
                      <input type="hidden" name="macbve" value="<%= Cbve.getMaCB()%>">
                      <td>
                        <%if (Tbve.getMaHHKg().equals("VA")) {%>
                        <img src="./images/VietNamAirline.jpg " height="40px" >
                        <%} else if (Tbve.getMaHHKg().equals("VJ")) {%>
                        <img src="./images/VietJet.jpg " height="40px" >
                        <%} else if (Tbve.getMaHHKg().equals("JT")) {%>
                        <img src="./images/JetStar.jpg " height="40px" >
                        <%} else {
                                out.println(Tbve.getMaHHKg());
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
                        <%if (Tbve.getMaHHKg().equals("VA")) {%>
                        <% tien = (Tbve.getGiaThuong()+ Tbve.getGiaThuong()*10/100+ 50000+70000+10000)*sluong;%>
                           <%=tien%>
                        <%}
                         else if (Tbve.getMaHHKg().equals("VJ")) {%>
                             <% tien = (Tbve.getGiaThuong()+ Tbve.getGiaThuong()*10/100+ 60000+75000+33000)*sluong;%>
                        <%=tien%>
                         <%}else if (Tbve.getMaHHKg().equals("JT")) {%>
                         
                             <% tien = (Tbve.getGiaThuong()+ Tbve.getGiaThuong()*10/100+ 60000+33000 +50000)*sluong;%>
                             <%=tien%>
                  <% }%>
                  <input type="radio" value="0"name="loaiveve" required >
                    </td>
                    <td>
                        <%=Tbve.getGiaVIP()%><br>
                    </td>
                    <td>
                        <%if (Tbve.getMaHHKg().equals("VA")) {%>
                        <% tien = (Tbve.getGiaVIP()+ Tbve.getGiaVIP()*10/100+ 50000+70000+10000)*sluong;%>
                           <%=tien%>
                        <%}
                         else if (Tbve.getMaHHKg().equals("VJ")) {%>
                             <% tien = (Tbve.getGiaVIP()+ Tbve.getGiaVIP()*10/100+ 60000+75000+33000)*sluong;%>
                        <%=tien%>
                         <%}else if (Tbve.getMaHHKg().equals("JT")) {%>
                         
                             <% tien = (Tbve.getGiaVIP()+ Tbve.getGiaVIP()*10/100+ 60000+33000 +50000)*sluong;%>
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
    </body>
</html>