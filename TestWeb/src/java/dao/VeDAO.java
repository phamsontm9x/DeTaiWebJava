
package dao;

import java.util.ArrayList;
import model.Ve;

public interface VeDAO {
    public ArrayList<Ve> getListVe();
    public Ve getVe(String macb,int mahk);
    public int getGiaVeHK(String macb,int mahk);
}
