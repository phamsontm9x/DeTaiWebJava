package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.HanhKhach;
import model.Ve;

public class HanhKhachDAOImpl {

    public ArrayList<HanhKhach> getListHanhKhach() {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM ThongTinHanhKhach;";
        ArrayList<HanhKhach> arr = new ArrayList();
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                HanhKhach hk = new HanhKhach( rs.getString("HoTen"), rs.getString("CMND"), rs.getString("SoDT"), rs.getInt("HanhLy"),rs.getString("LoaiVe"),rs.getString("DichVu"),rs.getString("MaCB"),rs.getString("DChi"));
                arr.add(hk);
            }
            connect.close();
            return arr;
        } catch (SQLException ex) {

        }
        return arr;
    }

    public HanhKhach getHanhKhachbymahk(int mahk) {
        Connection connect = DBConnect.getConnection();
        HanhKhach hk = new HanhKhach();
        //hk=null;
        String sql = "SELECT * FROM ThongTinHanhKhach where MaHK='" + mahk + "';";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                hk.setHoTen(rs.getString("HoTen"));
                hk.setCMND(rs.getString("CMND"));
                hk.setSoDT(rs.getString("SoDT"));
                hk.setHanhLy(rs.getInt("HanhLy"));
                hk.setLoaiVe(rs.getString("LoaiVe"));
                hk.setDichVu(rs.getString("DichVu"));
                hk.setMaCB(rs.getString("MaCB"));
                hk.setDChi(rs.getString("DChi"));

                connect.close();
            }
        } catch (SQLException ex) {
            //hk=null;
        }

        return hk;
    }

    public ArrayList<HanhKhach> getListHanhKhachbyEmail(String email) {
        Connection connect = DBConnect.getConnection();
        ArrayList<HanhKhach> arr = new ArrayList();
//        String sql="SELECT * FROM qlvemaybay.hanhkhach where Email='"+email+"';";
        String sql = "SELECT * FROM ThongTinHanhKhach ;";
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                HanhKhach hk = new HanhKhach();
                //hk=null;
                hk.setHoTen(rs.getString("HoTen"));
                hk.setCMND(rs.getString("CMND"));
                hk.setSoDT(rs.getString("SoDT"));
                hk.setHanhLy(rs.getInt("HanhLy"));
                hk.setLoaiVe(rs.getString("LoaiVe"));
                hk.setDichVu(rs.getString("DichVu"));
                hk.setMaCB(rs.getString("MaCB"));
                hk.setDChi(rs.getString("DChi"));

                //if(hk!=null)
                arr.add(hk);
            }

            connect.close();
        } catch (SQLException ex) {

        }
        return arr;
    }

    public ArrayList<HanhKhach> getListHanhKhach(String hoten) {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM ThongTinHanhKhach WHERE HoTen='" + hoten + "';";
        ArrayList<HanhKhach> arr = new ArrayList();
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                HanhKhach hk = new HanhKhach();
                hk.setHoTen(rs.getString("HoTen"));
                hk.setCMND(rs.getString("CMND"));
                hk.setSoDT(rs.getString("SoDT"));
                hk.setHanhLy(rs.getInt("HanhLy"));
                hk.setLoaiVe(rs.getString("LoaiVe"));
                hk.setDichVu(rs.getString("DichVu"));
                hk.setMaCB(rs.getString("MaCB"));
                hk.setDChi(rs.getString("DChi"));

                arr.add(hk);
            }
            connect.close();
        } catch (SQLException ex) {

        }
        return arr;
    }

    public ArrayList<HanhKhach> getListHanhKhachbyMaCB(String MaCB) {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM ThongTinHanhKhach WHERE MaCB='" + MaCB + "' AND HanhKhach.MaHK=Ve.MaHK;";
        ArrayList<HanhKhach> arr = new ArrayList();
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                HanhKhach hk = new HanhKhach();
                hk.setHoTen(rs.getString("HoTen"));
                hk.setCMND(rs.getString("CMND"));
                hk.setSoDT(rs.getString("SoDT"));
                hk.setHanhLy(rs.getInt("HanhLy"));
                hk.setLoaiVe(rs.getString("LoaiVe"));
                hk.setDichVu(rs.getString("DichVu"));
                hk.setMaCB(rs.getString("MaCB"));
                hk.setDChi(rs.getString("DChi"));

                arr.add(hk);
            }
            connect.close();
        } catch (SQLException ex) {

        }
        return arr;
    }

    public boolean AddHK( String macb, String hoten, String cmnd, String sdt, int hanhly,String loaive,String dichvu, String dchi) {

        Connection connect = DBConnect.getConnection();
        String sql = "INSERT INTO ThongTinHanhKhach (HoTen,CMND,SDT,HanhLy,LoaiVe,DichVu,MaCB,DiaChi) VALUES (N'" + hoten + "', '" + cmnd+ "', '" + sdt + "','" + hanhly + "', '" + loaive+ "','" +dichvu+ "', '" + macb+ "',N'" + dchi + "');";

        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            boolean rs = pr.execute();

            sql = "UPDATE ChuyenBay SET SLHKHT=SLHKHT-1 WHERE MaCB='" + macb + "';";
            pr = connect.prepareStatement(sql);
            rs = pr.execute();

            
            

            connect.close();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public HanhKhach getHanhKhachbymahk(String cmnd,String macb) {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT * FROM ThongTinHanhKhach WHERE CMND='" + cmnd + "' and MaCB='" + macb + "';";
        HanhKhach hk = new HanhKhach();
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
               hk.setHoTen(rs.getString("HoTen"));
               hk.setSoDT(rs.getString("SDT"));
               hk.setHanhLy(rs.getInt("HanhLy"));
               hk.setLoaiVe(rs.getString("LoaiVe"));
               hk.setDichVu(rs.getString("DichVu"));
               hk.setDChi(rs.getString("DiaChi"));
            }
            connect.close();
        } catch (SQLException ex) {

        }
        return hk;
    }

    public static int getMaHK(HanhKhach hk) {
        Connection connect = DBConnect.getConnection();
        String sql = "SELECT MaHK FROM ThongTinHanhKhach WHERE HoTen='" + hk.getHoTen() + "' and CMND='" + hk.getCMND() + "' and SoDT='" + hk.getSoDT() + "' and DChi='" + hk.getDChi() + "';";
        int mahk = 0;
        try {
            PreparedStatement pr = connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                mahk = rs.getInt("MaHK");
            }
            connect.close();
        } catch (SQLException ex) {

        }
        return mahk;
    }

    
    //thuc thi sau khi webservice
    
    
    
    public boolean AddVeAndHK(HanhKhach hk, Ve ve, String macb) {
        Connection con = DBConnect.getConnection();
        String sql = "INSERT INTO ThongTinHanhKhach (HoTen,CMND,SDT,HanhLy,LoaiVe,DichVu,MaCB,DiaChi) VALUES ('" + hk.getHoTen() + "', '" + hk.getCMND() + "', '" + hk.getSoDT() + "','" + hk.getHanhLy() + "', '" + hk.getLoaiVe()+ "','" + hk.getDichVu()+ "', '" + hk.getMaCB()+ "','" + hk.getDChi() + "');";
        try {
            PreparedStatement pr = con.prepareStatement(sql);
            boolean rs = pr.execute();

            sql = "UPDATE ChuyenBay SET SLHKHT=SLHKHT+1 WHERE MaCB='" + macb + "';";
            pr = con.prepareStatement(sql);
            rs = pr.execute();

            sql = "INSERT INTO Ve (MaVe,MaCB, MaHK,GiaVe,MaHD) VALUES ('" + ve.getMaVe() + "','" + ve.getMaCB() + "', '" + ve.getMaHK() + "','" + ve.getGiaVe() + "','" + ve.getMaHD() + "');";
            pr = con.prepareStatement(sql);
            rs = pr.execute();

            con.close();
            return true;
        } catch (Exception ex) {
        }

        return false;

    }
}
