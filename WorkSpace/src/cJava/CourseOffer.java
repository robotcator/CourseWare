package cJava;

import java.sql.ResultSet;

public class CourseOffer extends ExecuteDB{
	private String strSql;
		
	public ResultSet query() {
		this.strSql = "SELECT a.CourseID, a.CourseName, a.CourseClass, c.StudentID, c.StudentName " + 
				"FROM coursetable as a, courseoffer as b, studenttable as c " + 
				"WHERE  b.CourseID = a.CourseID AND b.CourseClass = a.CourseClass " + 
				"AND b.StudentID = c.StudentID";
		//System.out.println(this.strSql);
		
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
