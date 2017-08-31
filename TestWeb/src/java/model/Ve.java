
package model;


public class Ve {
    private String MaCB;
    private int MaHK;
    private int GiaVe;
    private String MaVe;
    private String MaHD;

    
    public Ve(){}
    
    public Ve(String MaCB, int MaHK, int GiaVe, String MaVe, String MaHD) {
        this.MaCB = MaCB;
        this.MaHK = MaHK;
        this.GiaVe = GiaVe;
        this.MaVe = MaVe;
        this.MaHD = MaHD;
    }

    public String getMaCB() {
        return MaCB;
    }

    public void setMaCB(String MaCB) {
        this.MaCB = MaCB;
    }

    public int getMaHK() {
        return MaHK;
    }

    public void setMaHK(int MaHK) {
        this.MaHK = MaHK;
    }

    public int getGiaVe() {
        return GiaVe;
    }

    public void setGiaVe(int GiaVe) {
        this.GiaVe = GiaVe;
    }

    public String getMaVe() {
        return MaVe;
    }

    public void setMaVe(String MaVe) {
        this.MaVe = MaVe;
    }

    public String getMaHD() {
        return MaHD;
    }

    public void setMaHD(String MaHD) {
        this.MaHD = MaHD;
    }
    
    
    
    
}
