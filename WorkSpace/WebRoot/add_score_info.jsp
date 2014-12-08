<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'view_student_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:useBean scope="page" id="Score" class="cJava.SelectCourse" />
	<jsp:useBean scope="page" id="Teacher" class="cJava.Teacher" />
	<jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />
	<jsp:useBean scope="page" id="Lstudent" class="cJava.TeachCourse" />
	
  </head>
  
  <body>
  	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">教师模块</h1>
	</div>
	<div id="menu" style="background-color:#FFD700;height:320pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="view_student_list.jsp" style="text-decoration:none;">查看学生信息</a><br><br>
		<a href="add_score_info.jsp" style="text-decoration:none;">添加学生成绩</a><br></br>
	</div>
	
    <div id="content" style="background-color:#EEEEEE;height:320pt;width:90%;x;float:left;">
		<div align="center">
			<form action="add_score_save.jsp" method="post">
			<div align="center">
				请输入课程名字:<input type="text" name="CourseName">
			</div>
			<table width="90%" border="0" cellpadding="0" cellspacing="1">
			<tr bgcolor="#CC99FF">
				<th width="15%" height="30" align="center">学号</th>
				<th width="15%" height="30" align="center">姓名</th>
				<th width="15%" height="30" align="center">年级</th>
				<th width="15%" height="30" align="center">学院</th>
				<th width="15%" height="30" align="center">成绩</th>
			</tr>	
		<%
			Lstudent.setUserID(session.getAttribute("UserName").toString());
			Lstudent.setUserPassword(session.getAttribute("UserPassword").toString());
			
			ResultSet rs = Lstudent.showStudent();
			
			Vector vData = Page.getAllPage(rs);
			
			for(int i = 0; i < vData.size(); i ++){
				String[] sData = (String[])vData.get(i); 
	    %>
			<tr>
				<td width="10%" height="25" align="center">
					<input type="text" name="studentID" style="border:0px;
					background-color:transparent;text-align:center" readonly="true" value="<%=sData[0]%>">
				</td>
				<td width="10%" height="25" align="center"><%=sData[1]%></td>
				<td width="10%" height="25" align="center"><%=sData[3]%></td>
				<td width="10%" height="25" align="center"><%=sData[4]%></td>
				<td width="10%" height="25" align="center">
					<input type="text" name="score">
				</td>
			</tr>
		<% 
			}
		%>
		</table>
			
			<input type="submit" name="sub" value="提交"/>
		<%
			rs.close();
		%>
		</form>
			
		</div>
		<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;margin:60pt 0pt 0pt 0pt">
			Copyright © ccnu
		</div>
		
	</div>
  </body>
</html>
