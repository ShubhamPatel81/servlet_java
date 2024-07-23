package com.DataAccess;

import java.util.List;

import com.entity.itemDetails;

public interface itemDAO {
		public boolean addItem(itemDetails item);
		
		public List<itemDetails> getAllItems();
		
		
		public itemDetails getItemById(int id);
		
		public boolean updateEditItem(itemDetails i);
		
		public boolean deleteItem(int id);
		
		public List<itemDetails> getNewItem();
		
		public List<itemDetails> getRecentItems();
		
		public List<itemDetails> getOldItem();
		
		public List<itemDetails> getAllRecentItem();
		
		public List<itemDetails> getAllOldItem();
		
		public List<itemDetails> getAllNewItem();
		
		public List<itemDetails> getItemByOld(String user_email, String itemCatagory);
		
		public boolean oldItemDelete(String user_email, String itemCatagory,int id);

		public List<itemDetails> getItemBySeach(String ch);
		
}