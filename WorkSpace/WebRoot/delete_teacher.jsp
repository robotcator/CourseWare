<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete_teacher.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:useBean scope="page" id="Teacher" class="cJava.Teacher"/>
	<jsp:useBean scope="page" id="User" class="cJava.User"/>

  </head>
  
  <body>
    <div align="center">
	<%
	String[] sUserID = request.getParameterValues("Delete_teacher");	
	String sDeleteUserID = "";
	if (sUserID != null){
		for(int i = 0; i < sUserID.length; i ++){
			if(i != 0) 
				sDeleteUserID = sDeleteUserID +"," + sUserID[i];	
			else sDeleteUserID = sDeleteUserID + sUserID[i];
		}		
	}	
	if(User.delete(sDeleteUserID)){	
		Teacher.delete(sDeleteUserID);
		out.println("<p><font color=blue>教师信息删除成功</font></p>");
		out.println("<p><a href=\"view_teacher_info.jsp" + "\" ><font color=blue>返回教师信息管理</font></a></p>");
	}else{
		out.println("<p><font color=red>教师信息删除失败，请重试</font></p>");
		out.println("<input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\">");
	}
	%>
	</div>
  </body>
</html>
