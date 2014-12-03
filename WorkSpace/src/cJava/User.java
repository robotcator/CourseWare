package cJava;

import java.sql.ResultSet;

public class User extends ExecuteDB{
	private String userName;
	private String password;
	private String Role;
	private String strSql;
		
	public User() {
		this.userName = "";
		this.password = "";
		this.Role = "0";
		this.strSql = "";
	}
	
	public boolean init() {
		this.strSql = "SELECT * FROM Login Where User = ";
		this.strSql = this.strSql + "'" + this.userName + "'";
		
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs.next()) {
				this.userName = rs.getString("User");
				this.passWord = rs.getString("PassWord");
				this.Role = rs.getString("Role");
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
	}
	
	public boolean valid() {
		this.strSql = "SELECT User, PassWord, Role FROM Login ";
		this.strSql = this.strSql + " Where User = '" + this.userName + "'";
		this.strSql = this.strSql + " AND PassWord = '" + this.passWord + "'";
		
		System.out.println(this.strSql);
		
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next() == true) {
				this.userName = rs.getString("User");
				this.passWord = rs.getString("PassWord");
				this.Role = rs.getString("Role");
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean exist() {
		this.strSql = "SELECT * FROM 'Login'";
		this.strSql = this.strSql + " where User = '" + this.userName + "'";
		
		System.out.println(this.strSql);
		
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs.next()) {
				return true;
			} else  {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}
	
	public boolean add(){
		this.strSql = "insert into Login ";
		this.strSql = this.strSql + "(";        
		this.strSql = this.strSql + "User,";
		this.strSql = this.strSql + "password,";
		this.strSql = this.strSql + "Role";          
		this.strSql=this.strSql + ") ";        
		this.strSql=this.strSql + "values(";
		this.strSql=this.strSql + "'" + this.userName + "',";	
		this.strSql=this.strSql + "'" + this.passWord + "',";
		this.strSql=this.strSql + "'" + this.Role + "'";
		this.strSql=this.strSql + ")";
		
		System.out.println(this.strSql);
		
		boolean isAdd = super.exeSQL(this.strSql);		
		return isAdd;
	}
	
	public boolean delete(String sUserID){
		this.strSql="delete from Login where User in (";
		this.strSql=this.strSql + sUserID + ")";
		
		System.out.println(this.strSql);
		
		boolean isDelete = super.exeSQL(this.strSql);		
		return isDelete;
	}
	
	public void setRole(String Role) {
		this.Role = Role;	
	}   

	public String getRole()	{
		return this.Role;	
	} 
	
	public void setUserName(String UserName) {
		this.userName = UserName;	
	}   

	public String getUserName() {
		return this.userName;	
	} 
	
 	public void setUserPassword(String UserPassword) {
		this.passWord = UserPassword;	
	}   

	public String getUserPassword() {
		return this.passWord;	
	} 
}
