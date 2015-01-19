package cJava;

import java.sql.ResultSet;

public class Teacher extends ExecuteDB{
	private String TeacherID;
	private String TeacherName;
	private String TeacherSex;
	private String Department;
	private String strSql;
	
	public Teacher(){
		TeacherID = "";
		TeacherName = "";
		TeacherSex = "";
		Department = "";
		strSql = "";
	}
	
	public ResultSet showTeacher(){
		this.strSql = "SELECT TeacherID, TeacherName, TeacherSex," +
				"Department FROM TeacherTable";
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean delete(String sUserID) {
		this.strSql="delete from TeacherTable where TeacherID in (";
		this.strSql=this.strSql + sUserID + ")";
		
		//System.out.println(this.strSql);
		
		boolean isDelete = super.exeSQL(this.strSql);		
		return isDelete;
	}
	
	public boolean add(){
		this.strSql = "insert into TeacherTable ";
		this.strSql = this.strSql + "(";        
		this.strSql = this.strSql + "TeacherID,";
		this.strSql = this.strSql + "TeacherName,";
		this.strSql = this.strSql + "TeacherSex,";  
		this.strSql = this.strSql + "Department";  
		this.strSql=this.strSql + ") ";        
		this.strSql=this.strSql + "values(";
		this.strSql=this.strSql + "'" + this.TeacherID + "',";	
		this.strSql=this.strSql + "'" + this.TeacherName + "',";
		this.strSql=this.strSql + "'" + this.TeacherSex + "',";	
		this.strSql=this.strSql + "'" + this.Department + "'";
		this.strSql=this.strSql + ")";
		
		//System.out.println(this.strSql);
		
		boolean isAdd = super.exeSQL(this.strSql);		
		return isAdd;
	}
	
	public ResultSet showStudent(){
		this.strSql = "SELECT DISTINCT a.studentID, a.StudentName, a.StudentSex," +
				" a.StudentClass, a.Sdepartment FROM studenttable AS a, selecttable AS b," +
				" teachertable AS c, coursetable AS d, teachtable AS e WHERE" +
				" c.TeacherID = " + this.TeacherID + " AND c.TeacherID = e.TeacherID " +
				" AND e.CourseID = b.CourseID AND b.StudentID = a.StudentID ";
		
		//System.out.println(this.strSql);
		
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public void setTeacherID(String TeacherID) {
		this.TeacherID = TeacherID;	
	}   

	public String getTeacherID()	{
		return this.TeacherID;	
	} 
	
	public void setTeacherName(String TeacherName) {
		this.TeacherName = TeacherName;	
	}   

	public String getTeacherName() {
		return this.TeacherName;	
	} 
	
 	public void setTeacherSex(String TeacherSex) {
		this.TeacherSex = TeacherSex;	
	}   

	public String getTeacherSex() {
		return this.TeacherSex;	
	} 
	
	public void setDepartment(String Department) {
		this.Department = Department;	
	}   

	public String getDepartment() {
		return this.Department;	
	} 	
}
