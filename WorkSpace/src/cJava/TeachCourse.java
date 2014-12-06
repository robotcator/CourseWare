package cJava;
import java.sql.ResultSet;

public class TeachCourse extends ExecuteDB{
	private String User;
	private String Password;
	private String strSql;
	
	public TeachCourse(){
		this.User = "";
		this.passWord = "";
	}
	
	public ResultSet showStudent(){
		this.strSql = "SELECT a.StudentID, a.StudentName, a.StudentSex, a.StudentClass, a.Sdepartment" +
				" FROM studenttable AS a, selecttable AS b, teachtable AS c" +
				" WHERE c.TeacherID = " + this.User + " AND c.CourseID = b.CourseID" + 
				" AND c.CourseClass = b.CourseClass AND b.StudentID = a.StudentID";		
		
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
