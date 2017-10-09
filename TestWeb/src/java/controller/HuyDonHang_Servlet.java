/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DonHangDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DonHang;

/**
 *
 * @author My PC
 */
@WebServlet(name = "HuyDonHang_Servlet", urlPatterns = {"/HuyDonHang_Servlet"})
public class HuyDonHang_Servlet extends HttpServlet {

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
            out.println("<title>Servlet HuyDonHang_Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HuyDonHang_Servlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String macbStr = request.getParameter("macb");
        String ngay = request.getParameter("ngay");
        int macb = Integer.parseInt(macbStr);
        String cmnd = request.getParameter("cmnd");
        String trangThai ="Đã Hủy";
        DonHangDAOImpl dh = new DonHangDAOImpl();
        boolean kq =false;
        kq = dh.updateListDonHang(cmnd, macb, trangThai);
        if(kq){
            String thbao ="Hủy Đơn Hàng Thành Công";
                request.setAttribute("tbao",thbao);
                request.setAttribute("ngay", ngay);   
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/XemDonHang.jsp");
                rd.forward(request, response);
        } else {
            String thbao ="Hủy đơn hàng thất bại";
                request.setAttribute("tbao",thbao);
                RequestDispatcher rd= getServletContext().getRequestDispatcher("/XemDonHang.jsp");
                rd.forward(request, response);
        }
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
