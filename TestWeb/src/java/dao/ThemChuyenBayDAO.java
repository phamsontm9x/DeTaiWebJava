/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author hhumo
 */

import connect.DBConnect;
import dao.ChuyenBayDAO;
import dao.ChuyenBayDAOImpl;
import dao.TuyenBayDAO;
import dao.TuyenBayDAOImpl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChuyenBay;
import model.TuyenBay;

public class ThemChuyenBayDAO {
    
    public ArrayList<TuyenBay> getListTuyenBay(String maDi, String maDen) {
        
        Connection con = DBConnect.getConnection();
        String sql = "Select MaTB From TuyenBay Where MaDi = '" + maDi + "' and MaDen = '" + maDen + "'";
        ArrayList<TuyenBay> arr = new ArrayList<>();
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TuyenBay cb = new TuyenBay();
                cb.setMaTB(rs.getString("MaTB"));
                arr.add(cb);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(TuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return arr;
    }
    
    public boolean addChuyenBay(String maCB, String ngayDi, String ngayDen, int hkht, int hktd, String maTB) {
        Connection con = DBConnect.getConnection();
        String sql = "Insert into ChuyenBay (MaCB, NgayDi, NgayDen, SLHKHT, SLHKTD, MaTB) Values ('"+maCB+"','"+ngayDi+"',N'"+ngayDen+"','"+hkht+"','"+hktd+"','"+maTB+"')";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            boolean kq = ps.execute();

            con.close();
            return true;
        } catch (SQLException ex) {

        }

        return false;
    }
}
