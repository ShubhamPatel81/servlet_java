package com.entity;

public class AllEntity {
    private int id;
    private String name;
    private String dob;
    private String address;
    private String email;
    private String qualification;

    // Constructor
    public AllEntity(int id, String name, String dob, String address, String email, String qualification) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.address = address;
        this.email = email;
        this.qualification = qualification;
    }

    // Getters and setters

    @Override
    public String toString() {
        return "AllEntity [id=" + id + ", name=" + name + ", dob=" + dob + ", address=" + address + ", email=" + email
                + ", qualification=" + qualification + "]";
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the dOB
	 */
	public String getDOB() {
		return dob;
	}

	/**
	 * @param dOB the dOB to set
	 */
	public void setDOB(String dOB) {
		dob = dOB;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the qualification
	 */
	public String getQualification() {
		return qualification;
	}

	/**
	 * @param qualification the qualification to set
	 */
	public void setQualification(String qualification) {
		this.qualification = qualification;
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

}
