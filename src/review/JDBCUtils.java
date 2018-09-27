package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtils {	
	
	private JDBCUtils(){}
	
	public static Connection getConnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");

			String url = "jdbc:mysql:///fuxi";
			String user = "root";
			String password = "123456";

			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}
	
	public static void close(Connection conn,Statement st,ResultSet rs) {

		if(conn!=null){
			try {conn.close();} catch (Exception e) {e.printStackTrace();}}

		if(st!=null){
			try {st.close();} catch (Exception e) {e.printStackTrace();}}

		if(rs!=null){
			try {rs.close();} catch (Exception e) {e.printStackTrace();}}

	}
}
