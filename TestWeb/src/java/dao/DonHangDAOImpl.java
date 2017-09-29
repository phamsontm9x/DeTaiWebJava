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
import java.util.Date;
import model.DonHang;

/**
 *
 * @author My PC
 */
public class DonHangDAOImpl implements DonHangDAO{

    @Override
    public ArrayList<DonHang> getListDonHang() {
        Connection connection=DBConnect.getConnection();
        String sql="SELECT * FROM DonHang";
        ArrayList<DonHang> arr = new ArrayList<>();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                DonHang  dh =new DonHang();
                dh.setEmail(rs.getString("Email"));
                dh.setNgayTao(rs.getString("NgayTao"));
                dh.setTrangThai(rs.getString("TrangThai"));
                dh.setCMND(rs.getString("CMND"));
                dh.setMaCB(rs.getString("MaCB"));
                dh.setGia(rs.getInt("Gia"));
                //if(cb!=null)
                    arr.add(dh);
            }
            connection.close();
        } catch (SQLException ex) {
            
        }
        return arr;
    }

    @Override
    public ArrayList<DonHang> getListDonHang(String khachHang) {
        Connection connection=DBConnect.getConnection();
        String sql="SELECT * FROM DonHang where Email = '"+khachHang+"';";
        ArrayList<DonHang> arr = new ArrayList<>();
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                DonHang  dh =new DonHang();
                dh.setNgayTao(rs.getString("NgayTao"));
                dh.setTrangThai(rs.getString("TrangThai"));
                dh.setCMND(rs.getString("CMND"));
                dh.setMaCB(rs.getString("MaCB"));
                dh.setGia(rs.getInt("Gia"));
                //if(cb!=null)
                    arr.add(dh);
            }
            connection.close();
        } catch (SQLException ex) {
            
        }
        return arr;
    }

    @Override
    public boolean addListDonHang(String khachHang, String ngayTao, String trangThai, String cmnd, String macb, int gia) {
        Connection connection=DBConnect.getConnection();
        String sql="INSERT INTO DonHang (Email,NgayTao,TrangThai,CMND,MaCB,Gia) VALUES ('"+khachHang+"','"+ngayTao+"',N'"+trangThai+"','"+cmnd+"','"+macb+"','"+gia+"');";
         try {
            PreparedStatement ps = connection.prepareStatement(sql);
            boolean kq = ps.execute();

            connection.close();
            return true;
        } catch (SQLException ex) {

        }

        return false;
    }

    @Override
    public boolean updateListDonHang(String cmnd, String maCB, String trangThai) {
        Connection con = DBConnect.getConnection();
        String sql ="Update DonHang Set TrangThai =N'" + trangThai + "' Where CMND='" + cmnd + "' AND MaCB ='" +maCB+"'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            boolean kq = ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {

        }

        return false;
    }
    public ArrayList<String> getNgayHD(String mail) throws SQLException{
       Connection con = DBConnect.getConnection();
       String sql ="select distinct CONVERT(varchar(10), NgayTao,126) as Ngay from DonHang where Email ='"+mail+"' order by Ngay Desc  ";
       ArrayList<String> arr = new ArrayList<>();
       try{
           PreparedStatement ps = con.prepareStatement(sql);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               arr.add(rs.getString("Ngay"));
           }
       }
       catch(SQLException e){
           
       }
       finally{
           con.close();
       }
       return arr;
   }
}
