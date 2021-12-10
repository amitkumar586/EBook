
package com.learn.myebook.helper;

import java.sql.*;
public class ConnectionProvider 
{
    private static Connection con;
    public static Connection getConnetaion()
    {
        try 
        {
            if(con == null)
            {
            
            // load drivr class
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //create connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","123456");
           } 
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
       
        return con;
    }
}
