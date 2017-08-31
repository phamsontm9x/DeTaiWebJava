/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Hieu
 */
public class ThongTinHoaDon {
      private String MaHD;
      private String MaVe;
      private String MaCB;
      private String MaHK;
      private String Email;
      private String SDT;
      private int Gia;
      private int soluong;
      
      
    public ThongTinHoaDon(){}
    
      
    public ThongTinHoaDon(String MaHD, String MaCB, String MaHK, String Email, String SDT, int Gia, int soluong) {
        this.MaHD = MaHD;
        this.MaCB = MaCB;
        this.MaHK = MaHK;
        this.Email = Email;
        this.SDT = SDT;
        this.Gia = Gia;
        this.soluong = soluong;
    }

    public String getMaHD() {
        return MaHD;
    }

    public void setMaHD(String MaHD) {
        this.MaHD = MaHD;
    }

    public String getMaCB() {
        return MaCB;
    }

    public void setMaCB(String MaCB) {
        this.MaCB = MaCB;
    }

    public String getMaHK() {
        return MaHK;
    }

    public void setMaHK(String MaHK) {
        this.MaHK = MaHK;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public int getGia() {
        return Gia;
    }

    public void setGia(int Gia) {
        this.Gia = Gia;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
      
      
      
      
}
