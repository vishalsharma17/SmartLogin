package com.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContext;

import com.listener.AppContextListener;

public class DBConnection {
	 public static Connection getConnection() throws Exception {

	        ServletContext context = AppContextListener.getContext();

	        Properties prop = new Properties();
	        InputStream input = context
	                .getResourceAsStream("/WEB-INF/config.properties");
	        prop.load(input);

	        String url      = prop.getProperty("db.url");
	        String username = prop.getProperty("db.username");
	        String password = prop.getProperty("db.password");

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(url, username, password);
	    }
}
