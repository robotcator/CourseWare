<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_student_save.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:useBean scope="page" id="User" class="cJava.User" />
	<jsp:useBean scope="page" id="Student" class="cJava.Student" />
  </head>
  
  <body>
   <div align="center">
	<%
		request.setCharacterEncoding("UTF-8");
		String StudentID = request.getParameter("StudentID");
		User.setUserName(StudentID);
		
		if(User.exist()){
			out.println("<p>用户名&nbsp;<font color=red>"+StudentID+"</font>&nbsp;已经存在！</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}else{
			
			String UserPassword = request.getParameter("Password");
			String StudentName = request.getParameter("StudentName");
			String Password = request.getParameter("Password");
			String StudentSex = request.getParameter("StudentSex");		
			String StudentClass = request.getParameter("StudentClass");
			String Sdepartment = request.getParameter("Sdepartment");		
			
			User.setUserPassword(UserPassword);
			User.setRole("2");
			
			Student.setStudentID(StudentID);
			Student.setStudentName(StudentName);
			Student.setStudentSex(StudentSex);
			Student.setStudentClass(StudentClass);
			Student.setSdepartment(Sdepartment);
			
			if(User.add()){
				Student.add();
				out.println("<p><font color=blue>添加学生信息成功</font></p>");
				out.println("<a href=\"add_student_info.jsp\"><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加学生信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		} 
	%>	
	</div>
  </body>
</html>
