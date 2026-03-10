package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.User;

public class UserDao {
	public boolean validateUser(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "select * from users where username=? and password=?");

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                status = true;
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
	
	
	public boolean registerUser(User user){

		boolean status=false;

		try{

		Connection con = DBConnection.getConnection();

		PreparedStatement ps = con.prepareStatement(
		"insert into users(username,email,password) values(?,?,?)");

		ps.setString(1,user.getUsername());
		ps.setString(2,user.getEmail());
		ps.setString(3,user.getPassword());

		int row = ps.executeUpdate();

		if(row>0){
		status=true;
		}

		}catch(Exception e){
		e.printStackTrace();
		}

		return status;

		}
}
