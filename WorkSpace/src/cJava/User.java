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
		
		//System.out.println(this.strSql);
		
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
		
		//System.out.println(this.strSql);
		
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
		
		//System.out.println(this.strSql);
		
		boolean isAdd = super.exeSQL(this.strSql);		
		return isAdd;
	}
	
	public int addNeedandOffer(String StudentID, 
			String[] CourseID, String[] CourseClass, String[] Offer, String[] Need){
		
		int cnt = 0;
		for (int i = 0; i < Need.length; i ++) {
			String temp = "";
			if (Need[i] != null){
				temp = "select studentID FROM CourseNeed " + 
						"Where Student = " + StudentID + " AND " + 
						"CourseID[i] = " + CourseID[Integer.parseInt(Need[i])] + " AND " + 
						"CourseClass[i] = " + CourseClass[Integer.parseInt(Need[i])]; 
				this.strSql = "insert into CourseNeed ";
				this.strSql = this.strSql + "(";        
				this.strSql = this.strSql + "StudentID,";
				this.strSql = this.strSql + "CourseID,";
				this.strSql = this.strSql + "CourseClass";          
				this.strSql=this.strSql + ") ";        
				this.strSql=this.strSql + "values(";
				this.strSql=this.strSql + "'" + StudentID + "',";	
				this.strSql=this.strSql + "'" + CourseID[Integer.parseInt(Need[i])] + "',";
				this.strSql=this.strSql + "'" + CourseClass[Integer.parseInt(Need[i])] + "'";
				this.strSql=this.strSql + ")";
			} 
			//System.out.println(this.strSql);
			try {
				ResultSet rs = super.exeQuery(temp);
				if(rs == null) {
					boolean isAdd = super.exeInsert(this.strSql);	
					
					if (isAdd) {
						cnt ++;
					}
				} else  {
					
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		for (int i = 0; i < Offer.length; i ++) {
			String temp = "";
			if (Offer[i] != null){
				temp = "select studentID FROM CourseOffer " + 
						"Where Student = " + StudentID + " AND " + 
						"CourseID[i] = " + CourseID[Integer.parseInt(Offer[i])] + " AND " + 
						"CourseClass[i] = " + CourseClass[Integer.parseInt(Offer[i])]; 
				
				this.strSql = "insert into CourseOffer ";
				this.strSql = this.strSql + "(";        
				this.strSql = this.strSql + "StudentID,";
				this.strSql = this.strSql + "CourseID,";
				this.strSql = this.strSql + "CourseClass";          
				this.strSql=this.strSql + ") ";        
				this.strSql=this.strSql + "values(";
				this.strSql=this.strSql + "'" + StudentID + "',";	
				this.strSql=this.strSql + "'" + CourseID[Integer.parseInt(Offer[i])] + "',";
				this.strSql=this.strSql + "'" + CourseClass[Integer.parseInt(Offer[i])] + "'";
				this.strSql=this.strSql + ")";
			} 
			//System.out.println(this.strSql);
			try {
				ResultSet rs = super.exeQuery(temp);
				if(rs == null) {
					boolean isAdd = super.exeInsert(this.strSql);		
					if (isAdd) {
						cnt ++;
					}
				} else  {
					
				}
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		return cnt;
	}
	
	public boolean delete(String sUserID){
		this.strSql="delete from Login where User in (";
		this.strSql=this.strSql + sUserID + ")";
		
		//System.out.println(this.strSql);
		
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
