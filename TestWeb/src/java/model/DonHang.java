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
public class DonHang {
    
    private String Email;
    private String NgayTao;
    private String TrangThai;
    private String CMND;
    private int MaCB;
    private int Gia;
    
    public DonHang(String email, String ngayTao, String trangThai, String cmnd, int maCB, int gia) {
        this.Email = email;
        this.NgayTao = ngayTao;
        this.TrangThai = trangThai;
        this.CMND = cmnd;
        this.MaCB = maCB;
        this.Gia = gia;
    }

    public DonHang() {
    }
    

    public String getEmail() {
        return Email;
    }

    public void setEmail(String khachHang) {
        this.Email = khachHang;
    }

    public String getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(String ngayTao) {
        this.NgayTao = ngayTao;
    }

    public String getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(String trangThai) {
        this.TrangThai = trangThai;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String cmnd) {
        this.CMND = cmnd;
    }

    public int getMaCB() {
        return MaCB;
    }

    public void setMaCB(int MaCB) {
        this.MaCB = MaCB;
    }

    public int getGia() {
        return Gia;
    }

    public void setGia(int gia) {
        this.Gia = gia;
    }
    
}
