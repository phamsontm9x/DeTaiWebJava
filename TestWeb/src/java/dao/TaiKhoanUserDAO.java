
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import model.TaiKhoanUser;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Hieu
 */
public class TaiKhoanUserDAO {
   
    
    public TaiKhoanUser GetTKbyEmail(String email){
        Connection con= DBConnect.getConnection();
        String sql="Select * from TaiKhoanUser where Email='"+ email +"';" ;
       TaiKhoanUser tkus = new TaiKhoanUser();
        try{
            PreparedStatement ps= con.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                tkus.setEmail(rs.getString("Email"));
                tkus.setPassword(rs.getString("Password"));
                tkus.setHoten(rs.getString("HoTen"));
                tkus.setGioitinh(rs.getString("GioiTinh"));
                tkus.setCMND(rs.getInt("CMND"));
                tkus.setSDT(rs.getInt("SDT"));
                tkus.setDiaChi(rs.getString("DiaChi"));
                
            }
            con.close();
           
       }catch(Exception ex){}
        return tkus;
    }
    public boolean UpdateUserInfo(String email,int sdt, String diachi ){
        Connection con = DBConnect.getConnection();
        String sql = "Update TaiKhoanUser Set SDT = '"+sdt+"' AND DiaChi = '"+diachi+"' Where Email ='"+email+"';";
        try{
        PreparedStatement ps= con.prepareStatement(sql);
        boolean a=ps.execute();
        
        con.close();
        return  true;
        }catch(Exception ex){}
        return false;
    }
    
    public  boolean UpdateUserpw(String email, String password){
        Connection con = DBConnect.getConnection();
        String sql= "Update TaiKhoanUser Set Password='"+password+"' where Email='"+email+"'";
        
        try{
        PreparedStatement ps= con.prepareStatement(sql);
        boolean a=ps.execute();
        
        con.close();
        return  true;
        }catch(Exception ex){}
        return false;
    }

    public boolean UpdateUserInfo(String email, String diachi, String cmnd, String diachi0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    }
