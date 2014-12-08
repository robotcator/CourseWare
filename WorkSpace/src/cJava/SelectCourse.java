package cJava;
import java.sql.ResultSet;
import java.util.*;

public class SelectCourse extends ExecuteDB{
	private String User;
	private String Password;
	private String CourseName;
	private String CourseID;
	private String CourseClass;
	
	private String strSql;
	
	public SelectCourse(){
		this.User = "";
		this.passWord = "";
		this.CourseID = "";
		this.CourseClass = "";
		this.CourseName = "";
	}
	
	public ResultSet showScore(){
		this.strSql = "SELECT a.CourseClass, a.CourseName, a.Point, b.Score" +
				" FROM selecttable as b, coursetable as a " + 
				" WHERE b.StudentID = " + this.User + " AND b.CourseID = a.CourseID AND" +
						" b.CourseClass = a.CourseClass	";
		
		System.out.println(this.strSql);
		
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public ResultSet showCourse(){
		this.strSql = "SELECT a.CourseClass, a.CourseID, a.CourseName," + 
				"a.Point, a.CourseLocation, a.CourseTime1, a.CourseTime2" +
				" FROM coursetable AS a, selecttable AS b " + 
				" WHERE b.studentID = " + this.User + " AND b.CourseID = a.CourseID AND " +
				" b.CourseClass = a.CourseClass ";		
		
		System.out.println(this.strSql);
		
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean addScore(String Score[], String StudentID){
		for (int i = 0; i < Score.length; i ++) {
			
		}
		return true;
	}
	
	
	
	public boolean exist() {
		this.strSql = "SELECT * FROM SelectTable";
		this.strSql = this.strSql + " where StudentID = '" + this.User + 
				"CourseClass = '" + this.CourseClass + "'" + 
				"CourseID = '" + this.CourseID + "'" ;
		
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
		this.strSql = "insert into SelectTable ";
		this.strSql = this.strSql + "(";        
		this.strSql = this.strSql + "StudentID,";
		this.strSql = this.strSql + "CourseClass,";
		this.strSql = this.strSql + "CourseID";          
		this.strSql=this.strSql + ") ";        
		this.strSql=this.strSql + "values(";
		this.strSql=this.strSql + "'" + this.User + "',";	
		this.strSql=this.strSql + "'" + this.CourseClass + "',";
		this.strSql=this.strSql + "'" + this.CourseID + "'";
		this.strSql=this.strSql + ")";
		
		System.out.println(this.strSql);
		
		boolean isAdd = super.exeSQL(this.strSql);		
		return isAdd;
	}
	
	public void setUserID(String User) {
		this.User = User;	
	}   

	public String getUser() {
		return this.User;	
	} 
	
 	public void setUserPassword(String UserPassword) {
		this.passWord = UserPassword;	
	}   

	public String getUserPassword() {
		return this.passWord;	
	} 
	
	public void setCourseID(String CourseID) {
		this.CourseID = CourseID;	
	}   

	public String getCourseID() {
		return this.CourseID;	
	} 
	
	public void setCourseClass(String CourseClass) {
		this.CourseClass = CourseClass;	
	}   

	public String geCourseClass() {
		return this.CourseClass;	
	} 
	
	public void setCourseName(String CourseName) {
		this.CourseName = CourseName;
	}   

	public String getCourseName() {
		return this.CourseName;	
	} 
}
