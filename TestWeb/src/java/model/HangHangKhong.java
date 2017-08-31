/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author My PC
 */
public class HangHangKhong {
    private String MaHHK;
    private String TenHHK;

    public HangHangKhong(String maHHK, String tenHHK) {
        this.MaHHK = maHHK;
        this.TenHHK = tenHHK;
    }

    public HangHangKhong() {
    }

    public String getMaHHK() {
        return MaHHK;
    }

    public void setMaHHK(String MaHHK) {
        this.MaHHK = MaHHK;
    }

    public String getTenHHK() {
        return TenHHK;
    }

    public void setTenHHK(String TenHHK) {
        this.TenHHK = TenHHK;
    }
    
}
