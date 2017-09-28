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
public class TuyenBay {
    private String MaTB;
    private String MaDi;
    private String MaDen;
    private String GioDi;
    private String GioDen;
    private String MaHHK;
    private int GiaThuong;
    private int GiaVIP;

    public TuyenBay() {
    }

    public TuyenBay(String MaTB, String MaDi, String MaDen, String GioDi, String GioDen, String MaHHK, int GiaThuong, int GiaVIP) {
        this.MaTB = MaTB;
        this.MaDi = MaDi;
        this.MaDen = MaDen;
        this.GioDi = GioDi;
        this.GioDen = GioDen;
        this.MaHHK = MaHHK;
        this.GiaThuong = GiaThuong;
        this.GiaVIP = GiaVIP;
    }
    

    public String getMaTB() {
        return MaTB;
    }

    public void setMaTB(String MaTB) {
        this.MaTB = MaTB;
    }

    public String getMaDi() {
        return MaDi;
    }

    public void setMaDi(String MaDi) {
        this.MaDi = MaDi;
    }

    public String getMaDen() {
        return MaDen;
    }

    public void setMaDen(String MaDen) {
        this.MaDen = MaDen;
    }

    public String getGioDi() {
        return GioDi;
    }

    public void setGioDi(String GioDi) {
        this.GioDi = GioDi;
    }

    public String getGioDen() {
        return GioDen;
    }

    public void setGioDen(String GioDen) {
        this.GioDen = GioDen;
    }

    public String getMaHHK() {
        return MaHHK;
    }

    public void setMaHHK(String MaHHK) {
        this.MaHHK = MaHHK;
    }

    public int getGiaThuong() {
        return GiaThuong;
    }

    public void setGiaThuong(int GiaThuong) {
        this.GiaThuong = GiaThuong;
    }

    public int getGiaVIP() {
        return GiaVIP;
    }

    public void setGiaVIP(int GiaVIP) {
        this.GiaVIP = GiaVIP;
    }
    
}
