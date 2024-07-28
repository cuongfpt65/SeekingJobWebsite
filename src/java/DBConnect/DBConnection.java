/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nguyen Chi Cuong - CE171013
 */
public class DBConnection {

  public static Connection connect() throws SQLException {
        String server = "CUONG\\CUONG";
        String port = "1433";
        String database = "SWPFinal";
        String user = "sa";
        String password = "1234";
        Connection conn = null;
        try {

            // Create driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // Create Connection object
            conn = DriverManager.getConnection("jdbc:sqlserver://"
                    + server + ":" + port + ";databaseName="
                    + database + ";user=" + user + ";password="
                    + password + ";encrypt=true"
                    + ";trustServerCertificate=true;");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
}
