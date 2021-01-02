package com.control.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
	
	static Connection con = null;
	
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url="jdbc:mysql://localhost:3306/springfinal?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
			String id = "root";
			String pw = "mysql1234";
			
			con = DriverManager.getConnection(url, id, pw);
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		
		return con;
	}
}
