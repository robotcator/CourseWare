<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CourseHandle.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <jsp:useBean scope="page" id="User" class="cJava.User" />

  </head>
  
  <body>
    	
    <% 
    	String StudentID = session.getAttribute("UserName").toString();
    	
    	String CourseID[] = request.getParameterValues("CourseID");
    	String CourseClass[] = request.getParameterValues("CourseClass");
    	String CourseName[] = request.getParameterValues("CourseName");
    	String Offer[] = request.getParameterValues("offer");
    	String Need[] = request.getParameterValues("need");
    	
    	
    	
    	int cnt = 0;
		if((cnt = User.addNeedandOffer(StudentID, CourseID, CourseClass, Offer, Need)) != 0){
			out.println("<p><font color=blue>添加需求/转让课程成功</font></p>");
			out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"back\" onClick=\"javascript:window.history.go(-1)\"></div>");
		} else {
			out.println("<p><font color=#0000FF>添加课程失败，可能某处出错</font></p>");
			out.println("<input type=button name=btn2 value=返回 onClick='window.history.go(-1)'>");
		}
    	
     %>
  </body>
