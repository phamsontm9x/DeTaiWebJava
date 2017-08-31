/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.ChuyenBay;


public interface ChuyenBayDAO {
    
    public ArrayList<ChuyenBay> getListChuyenBay();
    public ArrayList<ChuyenBay> getListChuyenBaybyNgayDi(String NgayDi);
    public ArrayList<ChuyenBay> getListChuyenBay(String NoiDi,String NoiDen,String Ngay);
    public ChuyenBay getEleChuyenBay(String macb);
    public ArrayList<ChuyenBay> getListChuyenBay(String NoiDi, String NoiDen);
}
