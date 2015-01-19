<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_score_save.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:useBean scope="page" id="Sscore" class="cJava.SelectCourse" />

  </head>
  
  <body>
    <%
    	String Score[] = request.getParameterValues("score");
    	String StudentID[] = request.getParameterValues("studentID");
    	String CourseID = request.getParameter("CourseID");
    	String CourseClass = request.getParameter("Courseclass");
    	
		if(Sscore.addScore(Score, StudentID, CourseID, CourseClass)){
			out.println("<p><font color=blue>添加成绩成功</font></p>");
		} else {
			out.println("<p><font color=#0000FF>添加成绩失败，可能某处出错</font></p>");
			out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
		}
    	
     %>
  </body>
</html>
