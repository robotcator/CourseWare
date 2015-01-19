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
	<jsp:useBean scope="page" id="Teacher" class="cJava.Teacher" />
  </head>
  
  <body>
   <div align="center">
	<%
		request.setCharacterEncoding("UTF-8");
		String TeacherID = request.getParameter("TeacherID");
		User.setUserName(TeacherID);
		
		if(User.exist()){
			out.println("<p>用户名&nbsp;<font color=red>"+TeacherID+"</font>&nbsp;已经存在！</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}else{
			
			String UserPassword = request.getParameter("Password");
			String TeacherName = request.getParameter("TeacherName");
			String Password = request.getParameter("Password");
			String TeacherSex = request.getParameter("TeacherSex");		
			String Department = request.getParameter("Department");		
			
			User.setUserPassword(UserPassword);
			User.setRole("1");
			
			Teacher.setTeacherID(TeacherID);
			Teacher.setTeacherName(TeacherName);
			Teacher.setTeacherSex(TeacherSex);
			Teacher.setDepartment(Department);
			
			if(User.add()){
				Teacher.add();
				out.println("<p><font color=blue>添加教师信息成功</font></p>");
				out.println("<a href=\"add_teacher_info.jsp\"><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加教师信息失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		} 
	%>	
	</div>
  </body>
</html>
