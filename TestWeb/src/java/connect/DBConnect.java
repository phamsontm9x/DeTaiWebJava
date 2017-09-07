
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    
    public static Connection getConnection(){
        
        Connection conn=null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://THANHSONPC;databaseName=qlvemaybay;user=sa;password=root";
            conn = DriverManager.getConnection(dbURL);
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        
        return conn;
    }
    
   //test connection
   public static void main(String[] args){
       System.out.println(getConnection());
   }
}
