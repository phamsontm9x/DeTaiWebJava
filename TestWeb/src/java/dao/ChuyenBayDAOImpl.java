
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ChuyenBay;
import model.TuyenBay;



public class ChuyenBayDAOImpl implements ChuyenBayDAO {

    @Override
    public ArrayList<ChuyenBay> getListChuyenBay() {
        Connection connection=DBConnect.getConnection();
        String sql="SELECT * FROM ChuyenBay";
       
        ArrayList<ChuyenBay> arr=new ArrayList<>();
        //arr=null;
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
           
            while(rs.next()){
                ChuyenBay  cb=new ChuyenBay();
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                cb.setMaTB(rs.getString("MaTB"));
                
                //if(cb!=null)
                    arr.add(cb);
            }
            connection.close();
        } catch (SQLException ex) {
            
        }
        return arr;
    }
    
    @Override
    public ArrayList<ChuyenBay> getListChuyenBay(String MaTB, String Ngay){
        
        
        Connection connect=DBConnect.getConnection();
        
        String sql="SELECT * FROM ChuyenBay "
                + "WHERE MaTB=N'"+MaTB+"' AND NgayDi='"+Ngay+"';";
        
        ArrayList<ChuyenBay> arr=new ArrayList();
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while(rs.next()){
                ChuyenBay cb=new ChuyenBay();
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                cb.setMaTB(rs.getString("MaTB"));
                arr.add(cb);
            }
        }
        catch(SQLException ex){
            
        }
        return arr;
    }
    
    @Override
        public ArrayList<ChuyenBay> getListChuyenBaybyNgayDi(String NgayDi){
        Connection connection=DBConnect.getConnection();
        String sql="SELECT * FROM ChuyenBay "
                + "WHERE NgayDi='"+ NgayDi +"';";
        ArrayList<ChuyenBay> arr=new ArrayList<>();
        //arr=null;
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ChuyenBay cb=new ChuyenBay();
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                cb.setMaTB(rs.getString("MaTB"));
                //if(cb!=null)
                    arr.add(cb);
            }
            connection.close();
        } catch (SQLException ex) {
            
        }
        return arr;
    }
        
        
        
        public ArrayList<ChuyenBay> getListChuyenBaybyNgayDiVaMaTB(String NgayDi, String MaTB){
        Connection connection=DBConnect.getConnection();
        String sql="SELECT * FROM ChuyenBay "
                + "WHERE MaTB=N'"+MaTB+"' AND NgayDi='"+NgayDi+"';";
        ArrayList<ChuyenBay> arr=new ArrayList<>();
        //arr=null;
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ChuyenBay cb=new ChuyenBay();
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                cb.setMaTB(rs.getString("MaTB"));
                //if(cb!=null)
                    arr.add(cb);
            }
            connection.close();
        } catch (SQLException ex) {
            
        }
        return arr;
    }
    
    @Override
    public ChuyenBay getEleChuyenBay(int macb){
        Connection connect=DBConnect.getConnection();
        String sql="SELECT * FROM ChuyenBay "
                + "WHERE MaCB='"+macb+"';";
        ChuyenBay cb=new ChuyenBay();
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            while(rs.next()){
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDi(rs.getString("NgayDi"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                cb.setMaTB(rs.getString("MaTB"));
            }
        }
        catch(SQLException ex){
            
        }
        return cb;
    }
    public boolean updateSLHKCB1(int slhkht,int macb){
        Connection connect=DBConnect.getConnection();
        //Chưa làm xong
        String sql="UPDATE ChuyenBay SET SLHKHT='"+(slhkht-1)+"' WHERE MaCB='"+macb+"';";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            boolean rs=pr.execute();
            connect.close();
            return true;
        }catch(SQLException ex){
            
        }
        return false;
    }
    public boolean updateSLHKCB2(int slhktd,int macb){
        Connection connect=DBConnect.getConnection();
        //Chưa làm xong
        String sql="UPDATE ChuyenBay SET SLHKTD='"+(slhktd-1)+"' WHERE MaCB='"+macb+"';";
        try{
            PreparedStatement pr=connect.prepareStatement(sql);
            boolean rs=pr.execute();
            connect.close();
            return true;
        }catch(SQLException ex){
            
        }
        return false;
    }
   
    
    public ArrayList<ChuyenBay> getListChuyenBay(String MaTB){
        Connection con= DBConnect.getConnection();
        String sql= "Select * from ChuyenBay "
                + "Where MaTB=N'"+MaTB+"';";
        ArrayList<ChuyenBay> arr= new ArrayList<>();
        try{
            PreparedStatement pr= con.prepareStatement(sql);
            ResultSet rs=pr.executeQuery();
            
            while(rs.next()){
                ChuyenBay cb= new ChuyenBay();
                cb.setMaCB(rs.getInt("MaCB"));
                cb.setNgayDen(rs.getString("NgayDen"));
                cb.setSLHKHT(rs.getInt("SLHKHT"));
                cb.setSLHKTD(rs.getInt("SLHKTD"));
                 arr.add(cb);
            }
           con.close();
           
        } catch (SQLException ex) {
            Logger.getLogger(ChuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arr;
    }
    
    public boolean AddChuyenBay(String NgayDi, String NgayDen, ArrayList<TuyenBay> MaTB) {
        
        
        Connection connect = DBConnect.getConnection();
 
        for (int i = 0 ; i < MaTB.size() ; i ++) {
            String sql = "INSERT INTO ChuyenBay (NgayDi,NgayDen,SLHKHT,SLHKTD,MaTB) VALUES (N'" + NgayDi + "', '" + NgayDen+ "', '" + 150 + "','" + 100 + "', '" + MaTB.get(i).getMaTB() + "')";
            PreparedStatement pr = null;
            try {
                pr = connect.prepareStatement(sql);
            } catch (SQLException ex) {
                Logger.getLogger(ChuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                boolean rs = pr.execute();
            } catch (SQLException ex) {
                Logger.getLogger(ChuyenBayDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }
    

    
   
    @Override
    public ArrayList<ChuyenBay> getListChuyenBay(String NoiDi, String NoiDen, String Ngay) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
}
