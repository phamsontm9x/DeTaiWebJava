/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hieu
 */
@WebServlet(name = "DangNhap", urlPatterns = {"/DangNhap"})
public class DangNhap extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             resp.setContentType("text/html;charset=UTF-8");
            String email= req.getParameter("email");
            String password= req.getParameter("password");
            String tb="";    
            DangKiDAO dka= new DangKiDAO();
            HttpSession session= req.getSession();
            boolean kq=dka.CheckLogin(email, password);
            String ten = dka.GetNameUser(email);
            if(kq){
                tb="Đăng nhập thành công";
                req.setAttribute("tb", tb);
                session.setAttribute("ten", ten);
                session.setAttribute("email", email);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/index.jsp");
                rd.forward(req, resp);              
            }
            else{
                tb="Đăng nhập thất bại sai mật khẩu hoặc mail";
                req.setAttribute("tb", tb);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/RegisterLogin.jsp");
                rd.forward(req, resp);
            }
            
                   
        }
    }

   

    
    
                   
        
   

