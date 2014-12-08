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
    
    <title>My JSP 'add_course_save.jsp' starting page</title>
    
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
	<jsp:useBean scope="page" id="Scourse" class="cJava.SelectCourse" />
  
  </head>
  
  <body>
   <div align="center">
	<%
		request.setCharacterEncoding("UTF-8");
		
		Scourse.setUserID(session.getAttribute("UserName").toString());
		Scourse.setUserPassword(session.getAttribute("UserPassword").toString());
		
		String CourseID = request.getParameter("CourseID");
		String CourseClass = request.getParameter("CourseClass");
		String CourseName = request.getParameter("CourseName");
		
		Scourse.setCourseID(CourseID);
		Scourse.setCourseClass(CourseClass);
		Scourse.setCourseName(CourseName);
		
		if(Scourse.exist()){
			out.println("<p>你已经选了&nbsp;<font color=red>"+CourseName+"</p>");
			out.println("<input type=button name=btn1 value=返回 onClick='window.history.go(-1)'>");
		}else{
			
			
			if(User.add()){
				Student.add();
				out.println("<p><font color=blue>添加课程成功</font></p>");
				out.println("<a href=\"add_student_info.jsp\"><font color=blue>继续添加</font></a>");
			}
			else
			{
				out.println("<p><font color=#0000FF>添加课程失败，请稍后重试</font></p>");
				out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
			}
		} 
	%>	
	</div>
  </body>
</html>
