package cJava;

import java.sql.ResultSet;

public class Course extends ExecuteDB{
	String strSql="";
	
	public ResultSet showCourse(){
		this.strSql = "SELECT CourseID, CourseName, CourseClass  FROM coursetable ";
		//System.out.println(this.strSql);
		ResultSet rs = null;
		try{
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public boolean exist(String CourseID, String CourseClass) {
		this.strSql = "SELECT CourseID , CourseClass FROM coursetable" + 
				" WHERE CourseID = " + CourseID + " AND CourseClass = "  + CourseClass;
		boolean flag = true;
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if(rs == null) {
				flag = false;
			} else  {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		return flag;
	}
}
