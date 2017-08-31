
package model;

import java.util.Date;


public class ChuyenBay {
    private String MaCB;
    private String NgayDi;
    private String NgayDen;
    private int SLHKHT;
    private int SLHKTD;
    private String MaTB;
  
   

    public ChuyenBay(String MaCB, String NgayDi, String NgayDen,int SLHKHT,int SLHKTD, String MaTB) {
        this.MaCB = MaCB;
        this.NgayDi = NgayDi;
        this.NgayDen = NgayDen;
        this.SLHKHT=SLHKHT;
        this.SLHKTD=SLHKTD;
        this.MaTB = MaTB;
    }
    
    public ChuyenBay() {
    }

    public String getNgayDi() {
        return NgayDi;
    }

    public void setNgayDi(String NgayDi) {
        this.NgayDi = NgayDi;
    }

    
    public String getMaCB() {
        return MaCB;
    }

    
    public void setMaCB(String MaCB) {
        this.MaCB = MaCB;
    }
    
    public int getSLHKTD(){
        return SLHKTD;
    }
    
    public void setSLHKTD(int SLHKTD){
        this.SLHKTD=SLHKTD;
    }

    public String getNgayDen() {
        return NgayDen;
    }

    public void setNgayDen(String NgayDen) {
        this.NgayDen = NgayDen;
    }

    public int getSLHKHT() {
        return SLHKHT;
    }

    public void setSLHKHT(int SLHKHT) {
        this.SLHKHT = SLHKHT;
    }

    public String getMaTB() {
        return MaTB;
    }

    public void setMaTB(String MaTB) {
        this.MaTB = MaTB;
    }

    public void getMaTB(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
