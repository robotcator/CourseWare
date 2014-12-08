<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_course_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <div id="container" style="width:100%">
	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">学生模块</h1>
	</div>
	
	<div id="menu" style="background-color:#FFD700;height:300pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="view_course_info.jsp" style="text-decoration:none;">查看选课信息</a><br><br>
		<a href="view_score_info.jsp" style="text-decoration:none;">查看课程成绩</a><br></br>
		<a href="add_course_info.jsp" style="text-decoration:none;">添加课程信息</a><br><br>
	</div>
	
	<div id="content" style="background-color:#EEEEEE;height:300pt;width:90%;x;float:left;">
		<form name="course_form" method="post" action="add_score_save.jsp" >
	
			<table width="90%" style="center">
			<tr>
				<td width="20%"height="30" align="right">课程编号:</td>
				<td width="30%"height="30" align="left">&nbsp;<input type="text" name="CourseID" size="20"></td>
			</tr>
			<tr>
				<td width="20%"height="30" align="right">&nbsp;课堂号:</td>
				<td width="30%"height="30" align="left">&nbsp;<input type="text" name="CourseClass" size="20"></td>
			</tr>
			<tr>	
				<td width="20%"height="30" align="right">&nbsp;课程名字:</td>
				<td width="30%"height="30" align="left">&nbsp;<input type="text" name="CourseName" size="20"></td>
			</tr>
			
			</table>
			<p align="center">
				<input type="submit" value="添加" name="sub" align="right">&nbsp;&nbsp;
				<input type="reset" value="清除" name="res" align="left">&nbsp;&nbsp;
			</p>
	  </form>
		
	</div>
	
	<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
		Copyright © ccnu
	</div>
  </div>
  </body>
</html>
