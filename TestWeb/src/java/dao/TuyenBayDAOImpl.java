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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TuyenBay;

/**
 *
 * @author My PC
 */
public class TuyenBayDAOImpl implements TuyenBayDAO{

    @Override
    public ArrayList<TuyenBay> getListTuyenBay() {
         Connection connection = DBConnect.getConnection();
        String sql ="Select * from TuyenBay";
        ArrayList<TuyenBay> arr = new ArrayList<>();
        try{
           PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TuyenBay tb= new TuyenBay();
                tb.setMaTB(rs.getString("MaTB"));
                tb.setMaDi( rs.getString("MaDi"));
                tb.setMaDen(rs.getString("MaDen"));
                tb.setGioDi(rs.getString("GioDi"));
                tb.setGioDen(rs.getString("GioDen"));
                tb.setMaHHK(rs.getString("MaHHK"));
                tb.setGiaThuong(rs.getInt("GiaThuong"));
                tb.setGiaVIP(rs.getInt("GiaVIP"));
                arr.add(tb);
            }
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(TuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
       return arr;
    }

    @Override
    public ArrayList<TuyenBay> getListTuyenBay(String MaDi, String MaDen) {
        Connection connect = DBConnect.getConnection();
        String sql = "Select * from TuyenBay where MaDi = '" + MaDi+"' AND MaDen = '"+ MaDen+"';";
        ArrayList<TuyenBay> arr = new ArrayList<>();
        try{
           PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                TuyenBay tb = new TuyenBay();
                tb.setMaTB(rs.getString("MaTB"));
                tb.setMaDi(rs.getString("MaDi"));
                tb.setMaDen(rs.getString("MaDen"));
                tb.setGioDi(rs.getString("GioDi"));
                tb.setGioDen(rs.getString("GioDen"));
                tb.setMaHHK(rs.getString("MaHHK"));
                tb.setGiaThuong(rs.getInt("GiaThuong"));
                tb.setGiaVIP(rs.getInt("GiaVIP"));
                arr.add(tb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(TuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
       return arr;        
    }

    @Override
    public ArrayList<TuyenBay> getListTuyenBay(String MaDi, String MaDen, String HangHK) {
        Connection connect = DBConnect.getConnection();
        String sql = "Select * from TuyenBay where MaDi = '" + MaDi+"' AND MaDen = '"+MaDen +"' AND MaHHK = '"+HangHK+"';";
        ArrayList<TuyenBay> arr = new ArrayList<>();
        try{
           PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                TuyenBay tb = new TuyenBay();
                tb.setMaTB(rs.getString("MaTB"));
                tb.setMaDi(rs.getString("MaDi"));
                tb.setMaDen(rs.getString("MaDen"));
                tb.setGioDi(rs.getString("GioDi"));
                tb.setGioDen(rs.getString("GioDen"));
                tb.setMaHHK(rs.getString("MaHHK"));
                tb.setGiaThuong(rs.getInt("GiaThuong"));
                tb.setGiaVIP(rs.getInt("GiaVIP"));
                arr.add(tb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
       return arr;
    }

    @Override
    public TuyenBay getEleTuyenBay(String maTB) {
        Connection connect=DBConnect.getConnection();
        String sql="SELECT * FROM TuyenBay"
                + " WHERE MaTB='"+maTB+"';";
        TuyenBay tb= new TuyenBay();
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            while(rs.next()){
                
                tb.setMaTB(rs.getString("MaTB"));
                tb.setMaDi(rs.getString("MaDi"));
                tb.setMaDen(rs.getString("MaDen"));
                tb.setGioDi(rs.getString("GioDi"));
                tb.setGioDen(rs.getString("GioDen"));
                tb.setMaHHK(rs.getString("MaHHK"));
                tb.setGiaThuong(rs.getInt("GiaThuong"));
                tb.setGiaVIP(rs.getInt("GiaVIP"));
                
            }
        }
        catch(SQLException ex){
            
        }
        return tb;
    }
    public ArrayList<TuyenBay> getListChuyenBay(String MaTB) {
        Connection con = DBConnect.getConnection();
        ArrayList<TuyenBay> list = new ArrayList<>();
        return list;
    }
    
}
