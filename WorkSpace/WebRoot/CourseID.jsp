<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String userName = "root";
	String passWord = "admin";
	String url = "jdbc:mysql://localhost:3306/courseware"; 
	Connection dbConn;
	String errorMessage;
	Statement stmt;
	ResultSet rs;
	String strSql = "SELECT DISTINCT CourseID from coursetable";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		dbConn = DriverManager.getConnection(url, userName, passWord);
		stmt = dbConn.createStatement();
		rs = stmt.executeQuery(strSql);
		
		response.setCharacterEncoding("utf-8");
	    PrintWriter Out = response.getWriter();
	    Out.println("{");
	    int i = 0;
	    while(rs.next()) {
	    	Out.print("\"" + i + "\": \"" + rs.getString("CourseID") + "\"");
	    	i ++;
	    	if (!rs.isLast()) Out.println(",");
	    }
	    Out.println("}");
		
	} catch(Exception e) {
		dbConn = null;
		errorMessage = e.toString();
		System.out.println("getConn" + errorMessage);
		
		
	}
  
%>