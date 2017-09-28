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
import model.TaiKhoanUser;

/**
 *
 * @author Hieu
 */
public class DangKiDAO {

    //Admin xem danh sach tai khoan user
    public ArrayList<TaiKhoanUser> GetListTaiKhoanUser() {

        Connection con = DBConnect.getConnection();
        String sql = "Select * from TaiKhoanUser";
        ArrayList<TaiKhoanUser> arr = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String email = (rs.getString("Email"));
                String password = (rs.getString("Password"));
                String hoten = (rs.getString("HoTen"));
                String gioitinh = (rs.getString("GioiTinh"));
                String cmnd = rs.getString("CMND");
                String sdt = rs.getString("SDT");
                String diachi = rs.getString("DiaChi");
                TaiKhoanUser tk = new TaiKhoanUser(email, password, hoten, gioitinh, cmnd, sdt,diachi);
                arr.add(tk);
            }
            con.close();
        } catch (SQLException ex) {

        }

        return arr;
    }

    //User xem thong tin tai khoan cua minh
    public TaiKhoanUser GetThongTinTaiKhoanUser(String emailkh) {
        Connection con = DBConnect.getConnection();
        String sql = "Select * from TaiKhoanUser Where Email= '" + emailkh + "';";
        TaiKhoanUser tk = new TaiKhoanUser();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                tk.setEmail(rs.getString("Email"));
                tk.setPassword(rs.getString("Password"));
                tk.setHoten(rs.getString("HoTen"));
                tk.setGioitinh(rs.getString("GioiTinh"));
                tk.setCMND(rs.getString("CMND"));
                tk.setSDT(rs.getString("SDT"));
            }

        } catch (SQLException ex) {

        }
        return tk;
    }

    public boolean AddTKUser(String email, String password, String gioitinh, String hoten, String CMND, String SDT, String DiaChi) {
        Connection con = DBConnect.getConnection();
        String sql = "Insert into TaiKhoanUser " + "(Email,Password,HoTen,GioiTinh,CMND,SDT,DiaChi) "
                + "values(N'" + email + "',N'" + password + "',N'" + hoten + "',N'" + gioitinh + "',N'" + CMND + "',N'" + SDT + "',N'" + DiaChi + "');";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            boolean kq = ps.execute();

            con.close();
            return true;
        } catch (SQLException ex) {

        }

        return false;
    }

    public boolean UpdateTKUser(String emailcu, String email, String password, String gioitinh, String hoten, String CMND, String SDT,String DiaChi) {
        Connection con = DBConnect.getConnection();
        String sql = "Update TaiKhoanUser Set Email='" + email + "', Password='" + password + "',GioiTinh='" + gioitinh + "',HoTen='" + hoten + "',CMND='" + CMND + "',SDT='" + SDT + "' ,DiaChi='" + DiaChi + "'Where Email='" + emailcu + "' ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            boolean kq = ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {

        }

        return false;
    }

    public boolean DeleteTKUser(String email) {
        Connection con = DBConnect.getConnection();
        String sql = "Delete from TaiKhoanUser Where Email='" + email + "'";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            boolean kq = ps.execute();
            con.close();
            return true;
        } catch (SQLException ex) {

        }
        return false;
    }

    public boolean CheckLogin(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "Select * from TaiKhoanUser where Email='" + email + "' and Password='" + password + "'";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                con.close();
                return true;
            }

        } catch (SQLException ex) {

        }
        return false;

    }
    
    public String GetNameUser(String email){
        Connection con= DBConnect.getConnection();
        String sql="Select * from TaiKhoanUser where Email='"+email+"'";
        String ten="";
        try {
            PreparedStatement ps= con.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                ten=(rs.getString("HoTen"));
                return ten;
            }
        } catch (SQLException ex) {
           
        }
        return null;
    }

    public boolean AddTKUser(String email, String password, String gioitinh, String hoten, String diachi, int cmnd1, int sdt1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
