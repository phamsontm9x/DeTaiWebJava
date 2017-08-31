/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DangKiDAO;
import dao.TaiKhoanUserDAO;
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
 * @author My PC
 */
@WebServlet(name = "CapNhatKhachHang", urlPatterns = {"/CapNhatKhachHang"})
public class CapNhatKhachHang extends HttpServlet {

   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email= req.getParameter("emailkh");
        String sdt= req.getParameter("sdtkh");
        String diachi= req.getParameter("dchikh");

        
        int sdt1= Integer.parseInt(sdt);
        
        String tb="";
        TaiKhoanUserDAO tk = new TaiKhoanUserDAO();
        
        if(email.trim().length()==0 ||sdt.trim().length()==0 || diachi.trim().length()==0 ){
            tb="Bạn chưa điền đầy đủ thông tin";
            req.setAttribute("tb", tb);
            RequestDispatcher rd= getServletContext().getRequestDispatcher("/InformationFrom.jsp");
            rd.forward(req, resp);
        }
        else{
            boolean kq=tk.UpdateUserInfo(email,sdt1,diachi);
            if(kq){
                tb="Lưu thanhg công";
                req.setAttribute("tb", tb);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/InformationFrom.jsp");
                rd.forward(req, resp);
                
            }
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
  
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
