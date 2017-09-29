
package model;


public class HanhKhach {
    private String HoTen;
    private String CMND;
    private String SoDT;
    private String DChi;
    private int HanhLy;
    private String LoaiVe;
    private String MaCB;

    public HanhKhach(String HoTen, String CMND, String SoDT,int HanhLy, String LoaiVe, String MaCB,String DChi) {
        this.HoTen = HoTen;
        this.CMND = CMND;
        this.SoDT = SoDT;
        this.DChi = DChi;
        this.HanhLy = HanhLy;
        this.LoaiVe = LoaiVe;
        this.MaCB = MaCB;
    }

    public HanhKhach() {
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public String getSoDT() {
        return SoDT;
    }

    public void setSoDT(String SoDT) {
        this.SoDT = SoDT;
    }

    public String getDChi() {
        return DChi;
    }

    public void setDChi(String DChi) {
        this.DChi = DChi;
    }

    public int getHanhLy() {
        return HanhLy;
    }

    public void setHanhLy(int HanhLy) {
        this.HanhLy = HanhLy;
    }

    public String getLoaiVe() {
        return LoaiVe;
    }

    public void setLoaiVe(String LoaiVe) {
        this.LoaiVe = LoaiVe;
    }

    public String getMaCB() {
        return MaCB;
    }

    public void setMaCB(String MaCB) {
        this.MaCB = MaCB;
    }
}