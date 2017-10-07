package controller;

import dao.ChuyenBayDAOImpl;
import dao.HanhKhachDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ChuyenBay;
import model.HanhKhach;

public class ThongTin_HK_CB_Servlet extends HttpServlet {
    
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String hanhlyve_str = "";
        String cmnd = "";
        int hanhly = 0;
        int hanhlyve = 0;

        String sdt = null;
        String email = request.getParameter("email");
        String macbStr = request.getParameter("macb");
        int macb = Integer.parseInt(macbStr);
        String type = request.getParameter("type");
        int soluong = 0;
        String soluong_str = request.getParameter("soluong");
        try {
            soluong = Integer.parseInt(soluong_str);
        } catch (Exception ex) {
            System.out.println(ex);
        }

        int giavedi = 0;
        String loaivedi = request.getParameter("loaivedi");

        String loaiveve = "";
        int giaveve = 0;
        if (request.getParameter("loaiveve") != null) {
            loaiveve = request.getParameter("loaiveve");
            try {
                giaveve = Integer.parseInt(loaiveve);
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }

        String macbveStr = "";
        ChuyenBayDAOImpl cbd = new ChuyenBayDAOImpl();
        ChuyenBay cb = cbd.getEleChuyenBay(macb);
        ChuyenBay cbve = new ChuyenBay();
        if (request.getParameter("macbve") != null) {
            macbveStr = request.getParameter("macbve");
            int macbve = Integer.parseInt(macbveStr);
            cbve = cbd.getEleChuyenBay(macbve);
        }

        String loaive = "";
        String vedi = "";
        String veve = "";
        String dichvu = "";

        //1 chieu
        if (type.equals("oneway")) {
            // if( giavedi==cb.getGiaVeThuong()){
            if (loaivedi.equals("0")) {
                loaive = "Eco";
            } else {
                loaive = "Vip";
            }
            session.setAttribute("type", "oneway");
            session.setAttribute("soluong", soluong);
            request.setAttribute("macb", macb);
            for (int x = 1; x <= soluong; x++) {
                String hoten = request.getParameter("hoten" + x);
                String cmndstr = request.getParameter("cmnd" + x);
                String sdt_str = request.getParameter("sdt" + x);
                String diachi = request.getParameter("dchi" + x);
                String hanhly_str = request.getParameter("hanhly" + x);

                try {
                    cmnd = cmndstr;
                    hanhly = Integer.parseInt(hanhly_str);
                    HanhKhach hkdi = new HanhKhach(hoten, cmnd, sdt_str, hanhly, loaive, macb, diachi);
                    session.setAttribute("tthkdi" + x, hkdi);
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/InformationNew.jsp");
            rd.forward(request, response);
        } else {
            session.setAttribute("type", "roundtrip");
            if (type.equals("roundtrip")) {
                //if(giavedi==cb.getGiaVeThuong()){
                if (loaivedi.equals("0")) {
                    vedi = "Eco";
                } else {
                    vedi = "Vip";
                }
                request.setAttribute("macb", macbStr);
                //if(giaveve==cbve.getGiaVeThuong()){
                if (loaiveve.equals("0")) {
                    veve = "Eco";
                } else {
                    veve = "Vip";
                }
                request.setAttribute("macbve", macbveStr);
                for (int x = 1; x <= soluong; x++) {

                    String hoten = request.getParameter("hoten" + x);
                    String cmnd_str = request.getParameter("cmnd" + x);
                    String sdt_str = request.getParameter("sdt" + x);
                    String diachi = request.getParameter("dchi" + x);
                    String hanhly_str = request.getParameter("hanhly" + x);
                    try {
                        hanhly = Integer.parseInt(hanhly_str);
                        sdt = sdt_str;
                        cmnd = cmnd_str;
                    } catch (Exception ex) {
                        System.out.println(ex);
                    }

                    int hanhlyphuve = 0;
                    if (request.getParameter("hanlyve" + x) != null) {
                        String hanhlyphuve_str = request.getParameter("hanhlyve" + x);
                        try {
                            hanhlyve = Integer.parseInt(hanhlyphuve_str);

                        } catch (Exception ex) {
                            System.out.println(ex);
                        }
                    }

                    HanhKhach hkdi = new HanhKhach(hoten, cmnd, sdt_str, hanhly, vedi, macb, diachi);
                    session.setAttribute("tthkdi" + x, hkdi);
                    HanhKhach hkve = new HanhKhach(hoten, cmnd, sdt_str, hanhly, veve, macb, diachi);;
                    session.setAttribute("tthkve" + x, hkve);

                }
                session.setAttribute("soluong", soluong);
                session.setAttribute("email", email);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/InformationNew.jsp");
                rd.forward(request, response);
            }
        }

    }
}
