package com.DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
    
    private Connection conn;
    
    public UserDAOImpl(Connection conn) {
        this.conn = conn;
    }
    
    @Override
    public boolean userRegister(User us) {
        boolean f = false;
        try {
            String q = "insert into users (name, email, phoneno, password) values (?, ?, ?, ?)";
            PreparedStatement psmt = conn.prepareStatement(q);
            psmt.setString(1, us.getName());
            psmt.setString(2, us.getEmail());
            psmt.setString(3, us.getPnumber());
            psmt.setString(4, us.getPassword());
            
            int count = psmt.executeUpdate();
            if (count > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) { // Changed parameter order
        User us = null;
        try {
            String q = "select * from users where email = ? and password = ?";
            PreparedStatement psmt = conn.prepareStatement(q);
            psmt.setString(1, email);
            psmt.setString(2, password);
            
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) { // Changed to if instead of while
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPnumber(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincode(rs.getInt(10));
               // System.out.println("User found: " + us.getEmail());
            } else {
           //     System.out.println("User not found for email: " + email);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

	@Override
	public boolean checkPassword(int id , String ps) {
		
		boolean f = false;
		try {
			String q= "select * from users where id=? and password=?";
			PreparedStatement psmt= conn.prepareStatement(q);
			psmt.setInt(1, id);
			psmt.setString(2, ps);
			
			ResultSet rs= psmt.executeQuery();
			
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;
        try {
        	String q = "UPDATE users SET name =?, email=?, phoneno =? WHERE id =?";
            PreparedStatement psmt = conn.prepareStatement(q);
            psmt.setString(1, us.getName());
            psmt.setString(2, us.getEmail());
            psmt.setString(3, us.getPnumber());
            psmt.setInt(4, us.getId());
            
            int count = psmt.executeUpdate();
            if (count > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
	}

	@Override
	public boolean checkUser(String email) {
		boolean f= true;
		 try {
	        	String q = "select * from users where email =? ";
	            PreparedStatement psmt = conn.prepareStatement(q);
	            
	            psmt.setString(1,email);
	           ResultSet rs = psmt.executeQuery();
	            while(rs.next()) {
	            	f=false;
	            }
	            int count = psmt.executeUpdate();
	            if (count > 0) {
	                f = true;
	            }
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
}
