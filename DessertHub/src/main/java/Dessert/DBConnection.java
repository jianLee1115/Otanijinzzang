/*
 * package Dessert;
 *

import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        try {
            // MySQL 데이터베이스 연결 (URL, 사용자명, 비밀번호)
            String url = "jdbc:mysql://localhost:9000/dessertdb";
            String user = "root";
            String password = "password";
            Connection conn = DriverManager.getConnection(url, user, password);
            return conn;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

*/