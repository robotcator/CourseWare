<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%! 
	String strSql = null;
	ResultSet rs = null;
	int iCount = 0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LoginHandle.jsp' starting page</title>
    
    <jsp:useBean scope = "page" id = "User" class = "cJava.User" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  		<%
  			String sUserName = request.getParameter("UserName");
  			String sUserPassword = request.getParameter("UserPassword");
  			
  			User.setUserName(sUserName);
  			User.setUserPassword(sUserPassword);
  			
  		//	out.println(User.valid());
  			
  			if(!User.valid()) {
  				out.println("<p align=center><font color=red></font></p>");
				out.println("<div align=\"center\"><input type=\"button\" name=\"btn\" value=\"back\" onClick=\"javascript:window.history.go(-1)\"></div>");
  			} else {
  				session.setAttribute("UserName", User.getUserName());
  				session.setAttribute("Role", User.getRole());
  				
  				if(User.getRole().equals("0")) {
  					response.sendRedirect("Administrator.html");
  				} else if(User.getRole().equals("1")) {
  					response.sendRedirect("Teacher.html");
  				} else {
  					response.sendRedirect("Student.html");
  				}
  			}
  		 %>
  <body>
    
  </body>
</html>
