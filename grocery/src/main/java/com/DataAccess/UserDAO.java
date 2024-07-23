package com.DataAccess;

import com.entity.User;

public interface UserDAO {
   public boolean userRegister(User us);
   
   public User login(String eamil, String password);
   public boolean checkPassword(int id, String ps);
   public boolean updateProfile(User us);
   
   public boolean checkUser(String email); 
}
