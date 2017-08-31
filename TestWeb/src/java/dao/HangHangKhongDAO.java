/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.HangHangKhong;

/**
 *
 * @author My PC
 */
public interface HangHangKhongDAO {
    public ArrayList<HangHangKhong> getListHangHangKhong();
    public HangHangKhong getElebyMaHHK(String MaHHK);
    public String getTenHHK(String MaHHK);
}
