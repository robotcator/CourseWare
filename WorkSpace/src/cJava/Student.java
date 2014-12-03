package cJava;
import java.sql.*;

public class Student extends ExecuteDB{
	private String StudentID;
	private String StudentName;
	private String StudentSex;
	private String StudentClass;
	private String Sdepartment;
	private String strSql;
	
	public Student(){
		StudentID = "";
		StudentName = "";
		StudentSex = "";
		StudentClass = "";
		Sdepartment = "";
		strSql = "";
	}
	
	public ResultSet showStudent(){
		this.strSql = "SELECT StudentID, StudentName, StudentSex, StudentClass," +
				"Sdepartment FROM StudentTable";
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean add(){
		this.strSql = "insert into StudentTable ";
		this.strSql = this.strSql + "(";        
		this.strSql = this.strSql + "StudentID,";
		this.strSql = this.strSql + "StudentName,";
		this.strSql = this.strSql + "StudentSex,";  
		this.strSql = this.strSql + "StudentClass,";
		this.strSql = this.strSql + "Sdepartment";  
		this.strSql=this.strSql + ") ";        
		this.strSql=this.strSql + "values(";
		this.strSql=this.strSql + "'" + this.StudentID + "',";	
		this.strSql=this.strSql + "'" + this.StudentName + "',";
		this.strSql=this.strSql + "'" + this.StudentSex + "',";
		this.strSql=this.strSql + "'" + this.StudentClass + "',";	
		this.strSql=this.strSql + "'" + this.Sdepartment + "'";
		this.strSql=this.strSql + ")";
		
		System.out.println(this.strSql);
		
		boolean isAdd = super.exeSQL(this.strSql);		
		return isAdd;
	}
	
	public boolean delete(String sUserID) {
		this.strSql="delete from StudentTable where StudentID in (";
		this.strSql=this.strSql + sUserID + ")";
		
		System.out.println(this.strSql);
		
		boolean isDelete = super.exeSQL(this.strSql);		
		return isDelete;
	}
	
	public void setStudentID(String StudentID) {
		this.StudentID = StudentID;	
	}   

	public String getStudentID()	{
		return this.StudentID;	
	} 
	
	public void setStudentName(String StudentName) {
		this.StudentName = StudentName;	
	}   

	public String getStudentName() {
		return this.StudentName;	
	} 
	
 	public void setStudentSex(String StudentSex) {
		this.StudentSex = StudentSex;	
	}   

	public String getStudentSex() {
		return this.StudentSex;	
	} 
	
	public void setStudentClass(String StudentClass) {
		this.StudentClass = StudentClass;	
	}   

	public String getStudentClass() {
		return this.StudentClass;	
	} 
	

	public void setSdepartment(String Sdepartment) {
		this.Sdepartment = Sdepartment;	
	}   

	public String getSdepartment() {
		return this.Sdepartment;	
	} 
	
	
}
