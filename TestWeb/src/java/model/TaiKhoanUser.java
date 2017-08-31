
package model;

public class TaiKhoanUser {
    private String email;
    private String password;
    private String hoten;
    private String gioitinh;
    private int CMND;
    private int SDT;
    private String DiaChi;

    
    public TaiKhoanUser(){
        
    }
    public TaiKhoanUser(String email, String password, String hoten, String gioitinh, int CMND, int SDT, String diaChi){
        this.email=email;
        this.CMND=CMND;
        this.SDT=SDT;
        this.gioitinh=gioitinh;
        this.hoten= hoten;
        this.password=password;
        this.DiaChi = diaChi;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public int getCMND() {
        return CMND;
    }

    public void setCMND(int CMND) {
        this.CMND = CMND;
    }

    public int getSDT() {
        return SDT;
    }

    public void setSDT(int SDT) {
        this.SDT = SDT;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String DiaChi) {
        this.DiaChi = DiaChi;
    }
    
}


