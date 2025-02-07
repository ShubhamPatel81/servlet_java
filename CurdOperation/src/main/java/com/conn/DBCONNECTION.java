package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCONNECTION {
	private static Connection conn = null;

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/curd_db","root","PASSWORD");
           
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return conn;
	}

}
