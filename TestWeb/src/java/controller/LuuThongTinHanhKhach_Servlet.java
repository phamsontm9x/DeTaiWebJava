/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ChuyenBayDAOImpl;
import dao.DonHangDAOImpl;
import dao.HanhKhachDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ChuyenBay;
import model.HanhKhach;
import dao.TuyenBayDAOImpl;
import model.TuyenBay;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author My PC
 */
@WebServlet(name = "LuuThongTinHanhKhach_Servlet", urlPatterns = {"/LuuThongTinHanhKhach_Servlet"})
public class LuuThongTinHanhKhach_Servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LuuThongTinHanhKhach_Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LuuThongTinHanhKhach_Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        HttpSession session= req.getSession();
        String email =(String) session.getAttribute("email") ;
        String hoten;
        int sdt;
        String cmnd;
        int hanhly;
        String loaive;
        String dichvu;
        String dchi;
        String trangThai ="Chưa thanh toán";
        int soluong = Integer.parseInt(req.getParameter("soluong").toString());
        String type=req.getParameter("type").toString();
        String macb = req.getParameter("macb").toString();
        String flag=req.getParameter("flag").toString();
        String macbve = "";
        HanhKhachDAOImpl hk = new HanhKhachDAOImpl();
        ChuyenBayDAOImpl cb = new ChuyenBayDAOImpl();
        ChuyenBay Cb = cb.getEleChuyenBay(macb);
        boolean kq1 = false, kq2 =false;
        String ngayTao="";
        int gia=0, co = 0;
        DonHangDAOImpl dh = new DonHangDAOImpl();
       
        if(type.equals("roundtrip")){
            macbve = (String) req.getParameter("macbve");
        }
        for(int i=1; i<=soluong; i++){
            hoten = req.getParameter("hoten"+i);
            cmnd = req.getParameter("cmnd"+i);
            sdt = Integer.parseInt(req.getParameter("sdt"+i));
            hanhly = Integer.parseInt(req.getParameter("hanhly"+i));
            loaive = req.getParameter("loaivedi"+i);
            dichvu = "";
            dchi =req.getParameter("diachi"+i);
            kq1 = hk.AddHK(macb, hoten, cmnd, sdt, hanhly, loaive, dichvu, dchi);
            gia = Integer.parseInt(req.getParameter("giavedi"));
            Date ngay=new Date(System.currentTimeMillis());
            SimpleDateFormat dinhdang = new SimpleDateFormat("hh:mm:ss MM-dd-yyyy");
            ngayTao = dinhdang.format(ngay.getTime());
            kq2 = dh.addListDonHang(email, ngayTao, trangThai, cmnd, macb, gia);
            if(loaive.equals("Eco")){
                boolean kq = cb.updateSLHKCB1(Cb.getSLHKHT(), macb);
            }
            else{
                boolean kq = cb.updateSLHKCB2(Cb.getSLHKTD(), macb);
            }
        if(!kq2){
            co =1;
        }
        if(type.equals("roundtrip")){
               hanhly = Integer.parseInt(req.getParameter("hanhlyve"+i));
               loaive = req.getParameter("loaiveve"+i);
               gia = Integer.parseInt(req.getParameter("giaveve"));
               kq1 = hk.AddHK(macbve, hoten, cmnd, sdt, hanhly, loaive, dichvu, dchi);
               kq2 = dh.addListDonHang(email, ngayTao, trangThai, cmnd, macbve, gia);
               if(loaive.equals("Eco")){
                boolean kq = cb.updateSLHKCB1(Cb.getSLHKHT(), macb);
            }
            else{
                boolean kq = cb.updateSLHKCB2(Cb.getSLHKTD(), macb);
            }
           }
        if(!(kq1&&kq2)){
            co =1;
        }
        }
        if(co==0&& flag.equals("tra")){
            
                String thbao ="Đặt vé Thành Công";
                req.setAttribute("tbao",thbao);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/payment.jsp");
                rd.forward(req, resp);
            }else if(co==0&& flag.equals("no")){
                String thbao ="Đặt vé Thành Công";
                req.setAttribute("tbao",thbao);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(req, resp);
            }else{
                String thbao ="Đặt vé thất bại. Xin Đặt lại";
                req.setAttribute("thbao",thbao);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/InformationNew.jsp");
                rd.forward(req, resp);
            }
//        if(email.trim().length()==0 || password.trim().length()==0|| hoten.trim().length()==0 || gioitinh.trim().length()==0 || sdt.trim().length()==0 || cmnd.trim().length()==0|| diachi.trim().length()==0 ){
//            tb="Bạn chưa điền đầy đủ thông tin";
//            req.setAttribute("tb", tb);
//            RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
//            rd.forward(req, resp);
//        }
//        else{
//            boolean kq=dk.AddTKUser(email, password, gioitinh, hoten, cmnd1, sdt1,diachi);
//            if(kq){
//                tb="Đăng Kí Thành Công";
//                req.setAttribute("tb", tb);
//                RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
//                rd.forward(req, resp);
//                
//            }
//            else{
//                tb="Email của bạn đã được đăng kí";
//                req.setAttribute("tb", tb);
//                RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
//                rd.forward(req, resp);
//                
//            }
//    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
