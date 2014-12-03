package cJava;
import java.sql.*;

public class ConnectDB {
	String userName = "root";
	String passWord = "admin";
	String url = "jdbc:mysql://localhost:3306/courseware"; 
		
	Connection dbConn;
	String errorMessage;
	
	public ConnectDB() {
		errorMessage = "";
		dbConn = null;
	}
	
	public Connection getConn() {
			try{
				Class.forName("com.mysql.jdbc.Driver");
				dbConn = DriverManager.getConnection(url, userName, passWord);
			} catch(Exception e) {
				dbConn = null;
				errorMessage = e.toString();
				System.out.println("getConn" + this.errorMessage);
			}
			return dbConn;
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}
}
