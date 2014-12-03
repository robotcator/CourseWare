<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'view_student_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<jsp:useBean scope="page" id="Student" class="cJava.Student" />
	<jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />

  </head>
  
  <body>
    <div id="container" style="width:100%">
	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">管理员模块</h1>
	</div>
	
	<div id="menu" style="background-color:#FFD700;height:300pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="modify_student_info.jsp" style="text-decoration:none;">增加学生信息</a><br><br>
		<a href="modify_teacher_info.jsp" style="text-decoration:none;">增加老师信息</a><br></br>
		<a href="view_student_info.jsp" style="text-decoration:none;">查看学生信息</a><br></br>
		<a href="view_teacher_info.jsp" style="text-decoration:none;">查看老师信息</a><br></br>
	</div>

	<div id="content" style="background-color:#EEEEEE;height:300pt;width:90%;x;float:left;">
	<form name="student_form" method="post" action="add_student_save.jsp" >
	
	<table width="90%" style="center">
	<tr>
		<td width="20%"height="30" align="right">学生学号:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="text" name="StudentID" size="20"></td>
	</tr>
	<tr>
		<td width="20%"height="30" align="right">&nbsp;学生姓名:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="text" name="StudentName" size="20"></td>
	</tr>
	<tr>	
		<td width="20%"height="30" align="right">&nbsp;登录密码:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="password" name="Password" size="20"></td>
	</tr>
	<tr>	
		<td width="20%"height="30" align="right">性别:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="radio" value="男" name="StudentSex">男
		<input type="radio" value="女" name="Sex">女</td>
		
	</tr>
	<tr>
		<td width="20%"height="30" align="right">&nbsp;学生年级:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="text" name="StudentClass" size="20"></td>
	</tr>
	<tr>	
		<td width="20%"height="30" align="right">&nbsp;学生院系:</td>
		<td width="30%"height="30" align="left">&nbsp;<input type="text" name="Sdepartment" size="20"></td>
	</tr>
	</table>
	<p align="center">
		<input type="submit" value="添加" name="sub">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="清除" name="res">&nbsp;&nbsp;
	</p>
	
	</form>
	</div>
	
	<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
		Copyright © ccnu
	</div>
  </div>
  </body>
</html>
