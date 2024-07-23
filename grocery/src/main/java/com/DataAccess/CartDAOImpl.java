package com.DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		
		boolean f = false;
		try {
			String q = "insert into cart(bid,userId,itemName,auth,price,total) values (?,?,?,?,?,?);";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setInt(1, c.getBid());
			psmt.setInt(2, c.getUserId());
			psmt.setString(3, c.getItemName());
			psmt.setString(4, c.getAuth());
			psmt.setDouble(5, c.getPrice());
			psmt.setDouble(6, c.getTotal());

			int i = psmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Cart> getItemByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice =0;
		try {
			
			String q = "select * from cart where userId =?;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setInt(1, userId);
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				c= new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setItemName(rs.getString(4));
				c.setAuth(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice= totalPrice + rs.getDouble(7);
				
				c.setTotal(totalPrice);
				list.add(c);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean removeItemCart(int bid, int userId, int cid) {
	    boolean f = false;
	    try {
	        // Updated query to include userId condition
	        String q = "delete from cart where bid = ? and userId = ? and cid=?";
	        PreparedStatement psmt = conn.prepareStatement(q);
	        psmt.setInt(1, bid);
	        psmt.setInt(2, userId);
	        psmt.setInt(3, cid);
	        int i = psmt.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        // TODO: handle exception
	    }
	    
	    return f;
	}


}
