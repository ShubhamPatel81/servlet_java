package com.DataAccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.itemDetails;

public class itemDAOImpl implements itemDAO {

	private Connection conn;

	public itemDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addItem(itemDetails item) {
		boolean f = false;
		try {
			// Remove itemid from the INSERT statement if it is auto-increment
			String q = "INSERT INTO addItem(itemName, auth, price, itemCatagory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement psmt = conn.prepareStatement(q);

			// Set the values for the prepared statement
			psmt.setString(1, item.getitemName());
			psmt.setString(2, item.getAuth());
			psmt.setString(3, item.getPrice());
			psmt.setString(4, item.getitemCatogery());
			psmt.setString(5, item.getStatus());
			psmt.setString(6, item.getPhotoName());
			psmt.setString(7, item.getEmail());

			// Execute the update
			int i = psmt.executeUpdate();

			// Check if the item was successfully added
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<itemDetails> getAllItems() {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "SELECT * FROM addItem";
			PreparedStatement psmt = conn.prepareStatement(q);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				b = new itemDetails();
				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public itemDetails getItemById(int id) {
		itemDetails b = null;
		try {
			String q = "SELECT * FROM addItem WHERE  itemId = ?";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setInt(1, id);

			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				b = new itemDetails();
				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b; // Return the retrieved itemDetails object
	}

	@Override
	public boolean updateEditItem(itemDetails i) {
		boolean f = false;
		try {

			String q = "update addItem set itemName=?,auth=?,price=?,status=? where itemId=?;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, i.getitemName());
			psmt.setString(2, i.getAuth());
			psmt.setString(3, i.getPrice());

			psmt.setString(4, i.getStatus());
			psmt.setInt(5, i.getItemId());

			int fin = psmt.executeUpdate();
			if (fin == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteItem(int id) {
		boolean f = false;
		try {
			String q = "delete from addItem where itemId=?; ";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setInt(1, id);
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
	public List<itemDetails> getNewItem() {

		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where itemCatagory=? and status =? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "New");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<itemDetails> getRecentItems() {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where  status = ? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<itemDetails> getOldItem() {

		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where itemCatagory=? and status =? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<itemDetails> getAllRecentItem() {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where  status = ? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	
	@Override
	public List<itemDetails> getAllOldItem() {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where itemCatagory=? and status =? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<itemDetails> getAllNewItem() {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b = null;
		try {
			String q = "select * from addItem where itemCatagory=? and status =? order by itemId DESC;";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "New");
			psmt.setString(2, "Active");
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				b = new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<itemDetails>  getItemByOld(String user_email, String itemCatagory) {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b= null;
		try {
			
			String q = "select * from addItem where   user_email=?and itemCatagory=? ";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, user_email);
			psmt.setString(2, itemCatagory);
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				b= new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
	}

	@Override
	public boolean oldItemDelete(String user_email, String itemCatagory ,int id) {
		boolean f = false;
		try {
			String q = "delete from addItem where   user_email=? and itemCatagory=?and itemId=?";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, user_email);
			psmt.setString(2, itemCatagory);
			psmt.setInt(3, id);
			int i = psmt.executeUpdate();
			if (i == 1) {
				f = true;
			}
	
		} catch (Exception e) {
			// TODO: handle exception\
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<itemDetails> getItemBySeach(String ch) {
		List<itemDetails> list = new ArrayList<itemDetails>();
		itemDetails b= null;
		try {
			
			String q = "SELECT * FROM addItem WHERE (itemName LIKE ? OR auth LIKE ? OR user_email LIKE ? OR itemCatagory LIKE ?) AND status = ?";
			PreparedStatement psmt = conn.prepareStatement(q);
			psmt.setString(1, "%" + ch + "%");
			psmt.setString(2, "%" + ch + "%");
			psmt.setString(3, "%" + ch + "%");
			psmt.setString(4, "%" + ch + "%");
			psmt.setString(5, "Active");
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				b= new itemDetails();

				b.setItemId(rs.getInt(1));
				b.setitemName(rs.getString(2));
				b.setAuth(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setitemCatogery(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return list;
	}
}