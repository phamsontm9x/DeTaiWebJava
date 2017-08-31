
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Ve;


public class VeDAOImpl implements VeDAO {

    @Override
    public ArrayList<Ve> getListVe() {
        Connection connect=DBConnect.getConnection();
        ArrayList<Ve> arr=new ArrayList();
        //arr=null;
        String sql="SELECT * FROM Ve";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            while(rs.next()){
                Ve v = new Ve();
                //v=null;
                v.setMaCB(rs.getString("MaCB"));
                v.setMaHK(rs.getInt("MaHK"));
                v.setGiaVe(rs.getInt("GiaVe"));
                
                //if(v!=null)
                    arr.add(v);
            }
            connect.close();
        }
        catch(SQLException ex)
        {
            
        }
        return arr;
    }
    public Ve getVe(String macb,int mahk){
        Connection connect=DBConnect.getConnection();
        Ve ve=new Ve();
        String sql="SELECT * FROM Ve WHERE MaCB='"+macb+"' and MaHK='"+mahk+"';";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            if(rs.next()){
                ve.setMaCB(rs.getString("MaCB"));
                ve.setMaHK(rs.getInt("MaHK"));
                ve.setGiaVe(rs.getInt("GiaVe"));
            }
            connect.close();
        }catch(SQLException ex){
            
        }
        return ve;
    }
    public int getGiaVeHK(String macb,int mahk){
        Connection connect=DBConnect.getConnection();
        int giave=0;
        String sql="SELECT * FROM Ve WHERE MaCB='"+macb+"' and MaHK='"+mahk+"';";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            if(rs.next()){
                giave=rs.getInt("GiaVe");
            }
            connect.close();
        }catch(SQLException ex){
            
        }
        return giave;
    }
}
