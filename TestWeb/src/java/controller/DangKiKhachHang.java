
package controller;

import dao.DangKiDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "DangKiKhachHang", urlPatterns = {"/DangKiKhachHang"})
public class DangKiKhachHang extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email= req.getParameter("email");
        String password= req.getParameter("password");
        String hoten= req.getParameter("hoten");
        String gioitinh= req.getParameter("gioitinh");
        String sdt= req.getParameter("sdt");
        String cmnd= req.getParameter("cmnd");
        String diachi= req.getParameter("DiaChi");
        
        String tb="";
        DangKiDAO dk = new DangKiDAO();
        
        if(email.trim().length()==0 || password.trim().length()==0|| hoten.trim().length()==0 || gioitinh.trim().length()==0 || sdt.trim().length()==0 || cmnd.trim().length()==0|| diachi.trim().length()==0 ){
            tb="Bạn chưa điền đầy đủ thông tin";
            req.setAttribute("tb", tb);
            RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
            rd.forward(req, resp);
        }
        else{
            boolean kq=dk.AddTKUser(email, password, gioitinh, hoten, cmnd, sdt,diachi);
            if(kq){
                tb="Đăng Kí Thành Công";
                req.setAttribute("tb", tb);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
                rd.forward(req, resp);
            }
            else{
                tb="Email của bạn đã được đăng kí";
                req.setAttribute("tb", tb);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
                rd.forward(req, resp);
            }
        }
        
    }
}
