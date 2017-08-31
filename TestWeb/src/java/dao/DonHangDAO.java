/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.DonHang;

/**
 *
 * @author My PC
 */
public interface DonHangDAO {
    public ArrayList<DonHang> getListDonHang();
    public ArrayList<DonHang> getListDonHang(String khachHang);
    public boolean addListDonHang(String khachHang,String ngayTao,String trangThai,String cmnd, String macb,int gia);
    public boolean updateListDonHang(String cmnd, String maCB, String trangThai);
}
