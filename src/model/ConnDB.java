package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnDB {
	private Connection connection=null;
	public Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","lijiafang");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return connection;
	}
}
