package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseUtility {

	
	private static final String URl = "jdbc:mysql://localhost:3306/virtualOffice";
	private static final String USER_NAME = "root";
	private static final String PASSWORD = "root@123";
	private static final String DRIVER = "com.mysql.jdbc.Driver";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {

		try {

			Class.forName(DRIVER);
			Connection connection = DriverManager.getConnection(URl, USER_NAME, PASSWORD);

			return connection;

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Exception " + e);
			return null;
		}
	}

	public static void close(PreparedStatement pstmt, Connection conn) throws SQLException {
		if (pstmt != null) {
			pstmt.close();
			conn.close();
		}
	}

	public static void close(ResultSet rs) throws Exception {
		if (rs != null) {
			rs.close();
		}
	}
}
