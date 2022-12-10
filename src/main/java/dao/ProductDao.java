package dao;

import dao.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	static final String USER = "c##shakti";
	static final String PASS = "shakti";
	
	public List<Product> getAllProds() throws ClassNotFoundException, SQLException {
		List<Product> prod_list = new ArrayList<Product>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "SELECT * FROM ajp_trend_prod";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				Product p = new Product();
				p.setName(rs.getString(1));
				p.setPrice(rs.getFloat(2));
				p.setSeller(rs.getString(3));
				p.setRating(rs.getFloat(4));
				prod_list.add(p);
			}
			System.out.println("Fetched products..");
			
			return prod_list;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return prod_list;
		}
	}
}
