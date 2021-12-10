
package com.learn.myebook.dao;

import com.learn.myebook.entities.User;

public interface UserDao 
{
       public boolean saveUser(User user);
       
       public User getUserByEmailAndPassowrd(String email ,String password);
       
       public boolean checkpassword(int userid ,String password);
       
       public boolean updateuserprofile(User user); 
       
       public boolean checkUser(String email);
}
