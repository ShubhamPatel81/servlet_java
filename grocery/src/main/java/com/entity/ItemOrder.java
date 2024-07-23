package com.entity;

public class ItemOrder {


	private int id;
	private String orderId;
	private String userName;
	private String email;
	private String fullAddress;
	private String pnumber;

	private String paymenttype;
	private String itemName;
	private String auth;
	private String price;

		public ItemOrder(int id, String orderId, String userName, String email, String fullAddress, String pnumber,
			String paymenttype, String itemName, String auth, String price) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.userName = userName;
		this.email = email;
		this.fullAddress = fullAddress;
		this.pnumber = pnumber;
		this.paymenttype = paymenttype;
		this.itemName = itemName;
		this.auth = auth;
		this.price = price;
	}

	
	public ItemOrder() {
		super();
			// TODO Auto-generated constructor stub
		}


	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
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

	/**
	 * @return the fullAddress
	 */
	public String getFullAddress() {
		return fullAddress;
	}

	/**
	 * @param fullAddress the fullAddress to set
	 */
	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	/**
	 * @return the pnumber
	 */
	public String getPnumber() {
		return pnumber;
	}

	/**
	 * @param pnumber the pnumber to set
	 */
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	/**
	 * @return the paymenttype
	 */
	public String getPaymenttype() {
		return paymenttype;
	}

	/**
	 * @param paymenttype the paymenttype to set
	 */
	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
	}

	/**
	 * @return the itemName
	 */
	public String getItemName() {
		return itemName;
	}

	/**
	 * @param itemName the itemName to set
	 */
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	/**
	 * @return the auth
	 */
	public String getAuth() {
		return auth;
	}

	/**
	 * @param auth the auth to set
	 */
	public void setAuth(String auth) {
		this.auth = auth;
	}

	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}

	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Override
	public String toString() {
		return "ItemOrder [id=" + id + ", userName=" + userName + ", email=" + email + ", fullAddress=" + fullAddress
				+ ", paymenttype=" + paymenttype + ", getId()=" + getId() + ", getUserName()=" + getUserName()
				+ ", getEmail()=" + getEmail() + ", getFullAddress()=" + getFullAddress() + ", getPaymenttype()="
				+ getPaymenttype() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

}
