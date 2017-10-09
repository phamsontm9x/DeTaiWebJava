package dao;

import java.util.ArrayList;
import model.DiaDiem;
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DiaDiemDAOImpl {

    public ArrayList<DiaDiem> getListDiaDiem() {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM DiaDiem;";
        ArrayList<DiaDiem> arr = new ArrayList<>();

        try {
            PreparedStatement ps = connect.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DiaDiem dd = new DiaDiem();
                dd.setMaDD(rs.getString("MaDD"));
                dd.setTenDD(rs.getString("TenDD"));
                dd.setTenSB(rs.getString("TenSB"));

                arr.add(dd);
            }
            connect.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return arr;
    }

    public DiaDiem getElebyMaDD(String MaDD) {
        Connection connect = DBConnect.getConnection();
        DiaDiem dd = new DiaDiem();
        //dd=null;
        String sql = "SELECT * FROM DiaDiem where MaDD='" + MaDD + "';";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                dd.setMaDD(rs.getString("MaDD"));
                dd.setTenDD(rs.getString("TenDD"));
                dd.setTenSB(rs.getString("TenSB"));
            }
            connect.close();
        } catch (SQLException ex) {
        }
        return dd;
    }

    public String getTenSB(String MaDD) {
        Connection connect = DBConnect.getConnection();
        String tenSB = null;
        //dd=null;
        String sql = "SELECT * FROM DiaDiem where MaDD= '" + MaDD + "';";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                tenSB = rs.getString("TenSB");
            }
            connect.close();
        } catch (SQLException ex) {
            //dd=null;
        }
        return tenSB;
    }

    public String getTenDD(String MaDD) {
        Connection connect = DBConnect.getConnection();
        String tenDD = "";
        //dd=null;
        String sql = "SELECT * FROM DiaDiem where MaDD='" + MaDD + "';";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                tenDD = rs.getString("TenDD");
            }
            connect.close();
        } catch (SQLException ex) {
            //dd=null;
        }
        return tenDD;
    }
}
