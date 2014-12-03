package cJava;

import java.sql.*;

public class ExecuteDB extends ConnectDB {
	private Connection dbConn;
	private Statement stmt;
	private ResultSet rs;
	private String errorMessage;
	
	public ExecuteDB() {
		dbConn = super.getConn();
		stmt = null;
		rs = null;
		errorMessage = super.getErrorMessage();
	}
	
	public boolean exeSQL(String strSql) {
		boolean isSuc = false;
		try{
			stmt = dbConn.createStatement();
			stmt.executeUpdate(strSql);
			stmt.close();
			isSuc = true;
		} catch (Exception e) {
			this.errorMessage = this.errorMessage + "<\br>" + e.toString();
		}
		return isSuc;
	}
	
	public ResultSet exeQuery(String strSql) {
		try {
			stmt = dbConn.createStatement();
			rs = stmt.executeQuery(strSql);
		} catch (Exception e) {
			this.errorMessage = this.errorMessage + "<\br>" + e.toString();
			rs = null;
		}
		return rs;
	}
	
	public String getErrorMessage() {
		 return errorMessage;
	}
}
