/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import model.TuyenBay;

/**
 *
 * @author My PC
 */
public interface TuyenBayDAO {
    public ArrayList<TuyenBay> getListTuyenBay();
    public ArrayList<TuyenBay> getListTuyenBay(String MaDi, String MaDen);
    public ArrayList<TuyenBay> getListTuyenBay(String MaDi, String MaDen, String HangHK);
    public TuyenBay getEleTuyenBay(String maTB);
}
