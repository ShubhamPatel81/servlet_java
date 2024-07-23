package com.entity;

public class itemDetails {

	private int itemId;
	private String itemName;
	private String auth;
	private String price;
	private String itemCatogery;
	private String status;
	private String photoName;
	private String email;
//	private String itemName;
	public itemDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public itemDetails(String itemName, String auth, String price, String itemCatogery, String status, String photoName,
			String email) {
		super();
		this.itemName = itemName;
		this.auth = auth;
		this.price = price;
		this.itemCatogery = itemCatogery;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	@Override
	public String toString() {
		return "bookDetails [bookId=" +  itemId + ", itemName=" + itemName + ", auth=" + auth + ", price=" + price
				+ ", bookCatogery=" +itemCatogery + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}
	/**
	 * @return the bookId
	 */
	public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }
	/**
	 * @return the bookName
	 */
	public String getitemName() {
		return itemName;
	}
	/**
	 * @param bookName the bookName to set
	 */
	public void setitemName(String bookName) {
		this.itemName = bookName;
	}
	/**
	 * @return the price
	 */
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getPrice() {
		return price;
	}
	/**
	 * @param string the price to set
	 */
	public void setPrice(String string) {
		this.price = string;
	}
	/**
	 * @return the bookCatogery
	 */
	public String getitemCatogery() {
		return itemCatogery;
	}
	/**
	 * @param bookCatogery the bookCatogery to set
	 */
	public void setitemCatogery(String bookCatogery) {
		this.itemCatogery = bookCatogery;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the photoName
	 */
	public String getPhotoName() {
		return photoName;
	}
	/**
	 * @param photoName the photoName to set
	 */
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
