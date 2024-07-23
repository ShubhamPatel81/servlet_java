package com.DataAccess;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
		public boolean addCart(Cart c);
		
		public List<Cart> getItemByUser(int userId);
		
		public boolean removeItemCart(int bid, int userId , int cid);



}
