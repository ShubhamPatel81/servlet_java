package com.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnect {

	private  static Connection conn;
	
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery","root","SHUBHAM68");
           
			
		}catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			
		}
		return conn;
	}
	
	
	
	
}
