package org.deadlock.restoran;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author defuj
 */
public class connector {
    public static Connection connect;
    
    public static Connection getKoneksi() {
        String url,user,password;
        url = "jdbc:mysql://localhost:3306/restoran?useUnicode=true&useSSL=false";
        user = "root";
        password = "";
            
        try {
            Driver driver = new Driver();
            DriverManager.registerDriver(driver);
            //System.out.println("Sukses Meregistrasi Driver");
            
            connect = (Connection) DriverManager.getConnection(url, user, password);
            //System.out.println("Koneksi ke Database Berhasil");
        } catch (SQLException ex) {            
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
             
        return connect;
    }
}
