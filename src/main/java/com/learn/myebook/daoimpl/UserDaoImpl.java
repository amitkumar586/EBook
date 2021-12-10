package com.learn.myebook.daoimpl;

import com.learn.myebook.dao.UserDao;
import com.learn.myebook.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao {

    private Connection con;

    public UserDaoImpl(Connection con) {
        this.con = con;
    }

    @Override
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into user(name , email , phone , password , address , usertype , userpic) values (?,?,?,?,?,?,?)";
            PreparedStatement prepareStatement = con.prepareStatement(query);
            prepareStatement.setString(1, user.getName());
            prepareStatement.setString(2, user.getEmail());
            prepareStatement.setString(3, user.getPhone());
            prepareStatement.setString(4, user.getPassword());
            prepareStatement.setString(5, user.getAddress());
            prepareStatement.setString(6, user.getUsertype());
            prepareStatement.setString(7, user.getUserpic());

            prepareStatement.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public User getUserByEmailAndPassowrd(String email, String password) {
        User user = null;

        try {
            String query = "select * from user where email= ? and password = ? ";
            PreparedStatement prepareStatement = con.prepareStatement(query);
            prepareStatement.setString(1, email);
            prepareStatement.setString(2, password);
            ResultSet rs = prepareStatement.executeQuery();
            if (rs.next()) {
                user = new User();

                user.setUid(rs.getInt("uid"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setUsertype(rs.getString("usertype"));
                user.setUserpic(rs.getString("userpic"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean checkpassword(int userid, String password) {
        boolean f = false;
        try {
            String query = "select * from user where uid=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userid);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateuserprofile(User user) {
        boolean f = false;
        try {
            String query = "update user set name=?,email=?,phone=? where uid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setInt(4, user.getUid());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkUser(String email) {
        boolean f = true;
        try {
            String query = "select * from user where email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
