/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.ChuyenBay;
import model.TuyenBay;


public interface ChuyenBayDAO {
    
    public ArrayList<ChuyenBay> getListChuyenBay();
    public ArrayList<ChuyenBay> getListChuyenBaybyNgayDi(String NgayDi);
    public ArrayList<ChuyenBay> getListChuyenBay(String NoiDi,String NoiDen,String Ngay);
    public ChuyenBay getEleChuyenBay(int macb);
    public ArrayList<ChuyenBay> getListChuyenBay(String NoiDi, String NoiDen);
    public ArrayList<ChuyenBay> getListChuyenBaybyNgayDiVaMaTB(String NgayDi, String MaTB);
    public boolean AddChuyenBay(String NgayDi, String NgayDen, ArrayList<TuyenBay> MaTB);
}
