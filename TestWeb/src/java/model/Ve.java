
package model;


public class Ve {
    private int MaCB;
    private int MaHK;
    private int GiaVe;
    private String MaVe;
    private String MaHD;

    
    public Ve(){}
    
    public Ve(int MaCB, int MaHK, int GiaVe, String MaVe, String MaHD) {
        this.MaCB = MaCB;
        this.MaHK = MaHK;
        this.GiaVe = GiaVe;
        this.MaVe = MaVe;
        this.MaHD = MaHD;
    }

    public int getMaCB() {
        return MaCB;
    }

    public void setMaCB(int MaCB) {
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
