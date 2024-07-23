package com.DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.ItemOrder;

public class ItemOrderImpl implements ItemOrderDAO {

	private Connection conn;

	public ItemOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	@Override
	public boolean saveOrder(List<ItemOrder> blist) {
		// TODO Auto-generated method stub

		boolean f = false;
		try {

			String q = "INSERT INTO orders (order_id,userName, email, address, pnumber, itemName, auth, price, paymenttype) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";

			conn.setAutoCommit(f);
			
			PreparedStatement psmt = conn.prepareStatement(q);
			
			for(ItemOrder b :blist ) {
				psmt.setString(1,b.getOrderId());
				psmt.setString(2,b.getUserName());
				psmt.setString(3,b.getEmail());
				psmt.setString(4,b.getFullAddress());
				psmt.setString(5,b.getPnumber());
				psmt.setString(6,b.getItemName());
				psmt.setString(7,b.getAuth());
				psmt.setString(8,b.getPrice());
				psmt.setString(9,b.getPaymenttype());
				psmt.addBatch();
			}
			int count[] = psmt.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}


	@Override
	public List<ItemOrder> getItem(String email) {
		List <ItemOrder> list = new ArrayList<ItemOrder>();
		ItemOrder o = null;
		try {
			
			String q = "select * from orders where email=?";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				o = new ItemOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPnumber(rs.getString(6));
				o.setItemName(rs.getString(7));
				o.setAuth(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymenttype(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<ItemOrder> getAllItem() {
		List <ItemOrder> list = new ArrayList<ItemOrder>();
		ItemOrder o = null;
		try {
			
			String q = "select * from orders";
			PreparedStatement psmt = conn.prepareStatement(q);
			//psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				o = new ItemOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAddress(rs.getString(5));
				o.setPnumber(rs.getString(6));
				o.setItemName(rs.getString(7));
				o.setAuth(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymenttype(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public int getOrderNo() {
		int i=1;
		try {
			
			String q = "select * from orders";
			PreparedStatement psmt = conn.prepareStatement(q);
			//psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				
				i++;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return 0;
	}

}
