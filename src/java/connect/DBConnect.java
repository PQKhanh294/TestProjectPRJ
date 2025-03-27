/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private final String serverName = "LAPTOP-1MCPK8AU";
    private final String dbName = "Gaming_cypher";
    private final String portNumber = "1433";
    private final String instance = "SQLEXPRESS";
    private final String userID = "sa";
    private final String password = "123";

    public Connection getConnection() throws Exception {
        String url = instance == null || instance.trim().isEmpty()
                ? "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=false;"
                : "jdbc:sqlserver://" + serverName + "\\" + instance + ";databaseName=" + dbName + ";encrypt=false;";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }

    public static void main(String[] args) {
        try {
            System.out.println(new DBConnect().getConnection());
        } catch (Exception e) {
        }
    }
}
