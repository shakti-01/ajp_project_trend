package dao;

//import dao.Product;
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
	
	public List<Product> getFilterProds(String substr) throws ClassNotFoundException, SQLException {
		List<Product> prod_list = new ArrayList<Product>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "select * from ajp_trend_prod where name like '%"+substr+"%'";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				Product p = new Product();
				p.setName(rs.getString(1));
				p.setPrice(rs.getFloat(2));
				p.setSeller(rs.getString(3));
				p.setRating(rs.getFloat(4));
				prod_list.add(p);
			}
			System.out.println("Fetched search products..");
			
			return prod_list;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return prod_list;
		}
	}
	
	public void addOrder(String pname, String uname) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "INSERT INTO ajp_trend_order VALUES ('"+uname+"','"+pname+"')";
			stmt.executeUpdate(sql);
			
			System.out.println("Order added to db..");
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void removeOrder(String pname, String uname) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String sql = "delete from ajp_trend_order where product='"+pname+"' and user_name='"+uname+"'";
			stmt.executeUpdate(sql);
			
			System.out.println("Order removed from db..");
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public List<Product> getOrderProds(String uname) throws ClassNotFoundException, SQLException {
		List<Product> p_list = new ArrayList<Product>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement stmt = conn.createStatement();
			
			String s = "select * from ajp_trend_prod p where p.name in "
					+ "(select product from ajp_trend_order o where o.user_name = '"+uname+"')";
			ResultSet res=stmt.executeQuery(s);
			while(res.next()){
				Product p = new Product();
				p.setName(res.getString(1));
				p.setPrice(res.getFloat(2));
				p.setSeller(res.getString(3));
				p.setRating(res.getFloat(4));
				p_list.add(p);
			}
			System.out.println("Fetched products which were ordered");
			
			return p_list;
		 
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return p_list;
		}
	}
}
