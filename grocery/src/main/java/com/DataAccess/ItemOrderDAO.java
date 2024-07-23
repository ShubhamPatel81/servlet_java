package com.DataAccess;

import java.util.List;

import com.entity.ItemOrder;

public interface ItemOrderDAO {
	
	
	public boolean saveOrder(List<ItemOrder> blist);
	
	public List<ItemOrder> getItem(String email);
	public List<ItemOrder> getAllItem();
}
