
package model;


public class DiaDiem {
    private String MaDD;
    private String TenDD;
    private String TenSB;

    public DiaDiem() {
    }

    public DiaDiem(String MaDD,String TenDD,String TenSB) {
        this.MaDD=MaDD;
        this.TenDD=TenDD;
        this.TenSB=TenSB;
    }
    
    public String getMaDD(){
       return MaDD;
   }
    
    public void setMaDD(String MaDD){
        this.MaDD=MaDD;
    }

    public String getTenDD(){
        return TenDD;
    }
    
    public void setTenDD(String TenDD){
        this.TenDD=TenDD;
    }
    
    public String getTenSB(){
        return TenSB;
    }
    
    public void setTenSB(String TenSB){
        this.TenSB=TenSB;
    }
    
}
