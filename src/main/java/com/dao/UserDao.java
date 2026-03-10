package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.model.User;

public class UserDao {
	public User loginUser(String email,String password){

		User user=null;

		try{

		Connection con=DBConnection.getConnection();

		PreparedStatement ps=con.prepareStatement(
		"select * from users where email=? and password=?");

		ps.setString(1,email);
		ps.setString(2,password);

		ResultSet rs=ps.executeQuery();

		if(rs.next()){

		user=new User();

		user.setName(rs.getString("name"));
		user.setEmail(rs.getString("email"));
		user.setMobile(rs.getString("mobile"));
		user.setAddress(rs.getString("address"));

		}

		}catch(Exception e){
		e.printStackTrace();
		}

		return user;
		}
	
	
	public boolean registerUser(User user){

		boolean status=false;

		try{

		Connection con=DBConnection.getConnection();

		PreparedStatement ps=con.prepareStatement(
		"insert into users(name,email,mobile,address,password) values(?,?,?,?,?)");

		ps.setString(1,user.getName());
		ps.setString(2,user.getEmail());
		ps.setString(3,user.getMobile());
		ps.setString(4,user.getAddress());
		ps.setString(5,user.getPassword());

		int row=ps.executeUpdate();

		if(row>0){
		status=true;
		}

		}catch(Exception e){
		e.printStackTrace();
		}

		return status;
		}

}
