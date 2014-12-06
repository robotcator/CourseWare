package cJava;
import java.sql.ResultSet;
import java.util.*;

public class SelectCourse extends ExecuteDB{
	private String User;
	private String Password;
	private String strSql;
	
	public SelectCourse(){
		this.User = "";
		this.passWord = "";
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
}
