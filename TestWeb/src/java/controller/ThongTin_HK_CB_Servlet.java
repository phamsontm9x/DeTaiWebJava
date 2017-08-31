
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
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session= request.getSession();
        String hanhlyve_str="";
        String cmnd = "";
        int hanhly=0;
        int hanhlyve=0;
       
        int sdt=0;
        
        
       
        String macb=request.getParameter("macb");
        String type=request.getParameter("type");
        int soluong=0;
        String soluong_str=request.getParameter("soluong");
        try{
            soluong= Integer.parseInt(soluong_str);
        }catch(Exception ex){System.out.println(ex);}
        
        
        int giavedi=0;
        String loaivedi=request.getParameter("loaivedi");
        
        String loaiveve="";
        int giaveve=0;
        if(request.getParameter("loaiveve")!=null){
           loaiveve=request.getParameter("loaiveve");
           try{
                giaveve=Integer.parseInt(loaiveve);
           }catch(Exception ex){System.out.println(ex);}
        }
        
        String macbve="";
        ChuyenBayDAOImpl cbd=new ChuyenBayDAOImpl();
        ChuyenBay cb=cbd.getEleChuyenBay(macb);
        ChuyenBay cbve= new ChuyenBay();
        if(request.getParameter("macbve")!= null){
            macbve=request.getParameter("macbve");
            cbve=cbd.getEleChuyenBay(macbve);
        }
        
        String loaive="";
        String vedi="";
        String veve="";
        String dichvu ="";
      
        //1 chieu
        if(type.equals("oneway")){
           // if( giavedi==cb.getGiaVeThuong()){
           if(loaivedi.equals("0")){
                loaive="Eco";
            }
            else{ 
                loaive="Vip";
            }
            session.setAttribute("type", "oneway");
             session.setAttribute("soluong", soluong);
            request.setAttribute("macb", macb);
            for(int x=1; x<= soluong; x++){
             String hoten=request.getParameter("hoten"+x);
            String cmndstr =request.getParameter("cmnd"+x);
            String sdt_str=request.getParameter("sdt"+x);
            String diachi=request.getParameter("dchi"+x);           
            String hanhly_str=request.getParameter("hanhly"+x);
            
            try{
                cmnd=cmndstr;
                hanhly= Integer.parseInt(hanhly_str);
                sdt=Integer.parseInt(sdt_str);
                HanhKhach hkdi= new HanhKhach(hoten,cmnd, sdt,hanhly,loaive,dichvu,macb,diachi);
            session.setAttribute("tthkdi"+x, hkdi);
            }catch(Exception ex){System.out.println(ex);}       
        }
           
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/InformationNew.jsp");
            rd.forward(request, response);            
        }else{
             session.setAttribute("type", "roundtrip");
          if(type.equals("roundtrip")){
          //if(giavedi==cb.getGiaVeThuong()){
          if(loaivedi.equals("0")){
              vedi="Eco";
          }
          else{
             vedi = "Vip";
          }
          request.setAttribute("macb", macb);
          //if(giaveve==cbve.getGiaVeThuong()){
          if(loaiveve.equals("0")){
              veve="Eco";
          }
          else{
              veve="Vip";
          }
          request.setAttribute("macbve", macbve);
            for( int x=1; x<= soluong; x++){
                
            String hoten=request.getParameter("hoten"+x);
            String cmnd_str =request.getParameter("cmnd"+x);
            String sdt_str=request.getParameter("sdt"+x);
            String diachi=request.getParameter("dchi"+x);
            String hanhly_str=request.getParameter("hanhly"+x);
            try{
                hanhly = Integer.parseInt(hanhly_str);
                sdt = Integer.parseInt(sdt_str);
                cmnd = cmnd_str;
            }catch(Exception ex){System.out.println(ex);}
            
            int hanhlyphuve=0;
            if(request.getParameter("hanlyve"+x)!= null){
                String hanhlyphuve_str= request.getParameter("hanhlyve"+x);
                try{
                    hanhlyve= Integer.parseInt(hanhlyphuve_str);
                    
            }catch(Exception ex){System.out.println(ex);}
            }
            
            HanhKhach hkdi= new HanhKhach(hoten,cmnd, sdt,hanhly,vedi,dichvu,macb,diachi);
            session.setAttribute("tthkdi"+x, hkdi);
            HanhKhach hkve= new HanhKhach(hoten,cmnd, sdt,hanhly,veve,dichvu,macb,diachi);;
            session.setAttribute("tthkve"+x, hkve);
            
              
          }
          session.setAttribute("soluong", soluong);
          RequestDispatcher rd = getServletContext().getRequestDispatcher("/InformationNew.jsp");
          rd.forward(request, response);
          }
        }
    
        
            
            
            
            
        }
    }
    
    
    


