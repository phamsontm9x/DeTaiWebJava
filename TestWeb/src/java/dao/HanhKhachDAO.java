
package dao;

import java.util.ArrayList;
import model.HanhKhach;


public interface HanhKhachDAO {
    public ArrayList<HanhKhach> getListHanhKhach();
    public HanhKhach getHanhKhachbymahk(int mahk);
    public ArrayList<HanhKhach> getListHanhKhachbyEmail(String email);
    public ArrayList<HanhKhach> getListHanhKhachbyMaCB(String MaCB);
   
    public boolean AddHK(String macb,String hoten,String cmnd,String sdt,String dchi,float hanhly,String email);
    public HanhKhach getHanhKhachbymahk(String hoten,String cmnd,String sdt,String dchi,String email);
    public int getMaHK(HanhKhach hk);
}
