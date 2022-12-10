package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class userdao {
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER = "c##shakti";
	static final String PASS = "shakti";
	
	public boolean usersignup(String uname, String pass) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "INSERT INTO ajp_trend_users VALUES ('"+uname+"','"+pass+"')";
			stmt.executeUpdate(sql);
			System.out.println("Inserted records into the table...");
			
			return true;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String userlogin(String uname, String pass) throws ClassNotFoundException, SQLException {
		String user = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "select * from ajp_trend_users where user_name='"+uname+"' and pass='"+pass+"'";
			ResultSet rs= stmt.executeQuery(sql);  
			
			while(rs.next()) {
				user = rs.getString(1);
			}
			System.out.println("Retrieved user");
			
			return user;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return user;
		}
	}
}
