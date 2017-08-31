/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.HangHangKhong;

/**
 *
 * @author My PC
 */
public class HangHangKhongDAOImpl implements HangHangKhongDAO{

    @Override
    public ArrayList<HangHangKhong> getListHangHangKhong() {
        Connection connect=DBConnect.getConnection();
        String sql="SELECT * FROM DiaDiem;";
        ArrayList<HangHangKhong> arr = new ArrayList<>();
        
        try{
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){                
                HangHangKhong hhk=new HangHangKhong();
                //dd=null;
                hhk.setMaHHK(rs.getString("MaHHK"));
                hhk.setTenHHK(rs.getString("TenHHK"));
                
                //if(dd!=null)
                    arr.add(hhk);
            }
            connect.close();
        }
        catch(SQLException ex)
        {
            System.err.println(ex); 
        }
        
        return arr;
    }

    @Override
    public HangHangKhong getElebyMaHHK(String MaHHK) {
        Connection connect=DBConnect.getConnection();
        String sql="SELECT * FROM HangHangKhong where MaHHK = '"+MaHHK+"';";
        HangHangKhong hhk = new HangHangKhong();
        
        try{
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){                
                //dd=null;
                hhk.setMaHHK(rs.getString("MaHHK"));
                hhk.setTenHHK(rs.getString("TenHHK"));
                
                //if(dd!=null)
            }
            connect.close();
        }
        catch(SQLException ex)
        {
            System.err.println(ex); 
        }
        
        return hhk;
    }

    @Override
    public String getTenHHK(String MaHHK) {
    Connection connect=DBConnect.getConnection();
        String tenHHK = null;
        //dd=null;
        String sql="SELECT * FROM HangHangKhong where MaHHK= '"+MaHHK+"';";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            if(rs.next()){
                tenHHK=rs.getString("TenHHK");
            }
            connect.close();
        }
        catch(SQLException ex)
        {
            //dd=null;
        }
        return tenHHK;
    }
    
}
