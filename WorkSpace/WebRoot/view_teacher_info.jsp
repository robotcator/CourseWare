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
	
	<jsp:useBean scope="page" id="Teacher" class="cJava.Teacher" />
	<jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />

  </head>
  
  <body>
    <div id="container" style="width:100%">
	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">管理员模块</h1>
	</div>
	
	<div id="menu" style="background-color:#FFD700;height:320pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="add_student_info.jsp" style="text-decoration:none;">增加学生信息</a><br><br>
		<a href="add_teacher_info.jsp" style="text-decoration:none;">增加老师信息</a><br></br>
		<a href="view_student_info.jsp" style="text-decoration:none;">查看学生信息</a><br></br>
		<a href="view_teacher_info.jsp" style="text-decoration:none;">查看老师信息</a><br></br>
	</div>

	<div id="content" style="background-color:#EEEEEE;height:300pt;width:90%;x;float:left;">
		<div align="center">
			<form name="delete_form" method="post" action="delete_teacher.jsp">
			<table width="90%" border="0" cellpadding="0" cellspacing="1">
			<tr bgcolor="#CC99FF">
				<th width="15%" height="30" align="center">选中</th>
				<th width="15%" height="30" align="center">教工号</th>
				<th width="15%" height="30" align="center">姓名</th>
				<th width="15%" height="30" align="center">性别</th>
				<th width="15%" height="30" align="center">学院</th>
			</tr>	
		<%
			ResultSet rs = Teacher.showTeacher();
			Page.initialize(rs, 10);
			String	strPage = null;
			int showPage = 1;
			strPage = request.getParameter("showPage");
			if(strPage == null){
				showPage = 1;
			} else {
				try{
					showPage = Integer.parseInt(strPage);
				} catch (NumberFormatException e) {
					showPage = 1;
				}
			}
			if(showPage > Page.getPageCount()) {
				showPage = Page.getPageCount();
			}
			Vector vData = Page.getPage(showPage);
			for(int i = 0; i < vData.size(); i ++){
				String[] sData = (String[])vData.get(i); 
	    %>
			<tr>
				<td width="10%" height="25" align="center">
				<input type="checkbox" name="Delete_teacher" value="<%=sData[0]%>">
				</td>
				<td width="10%" height="25" align="center"><%=sData[0]%></td>
				<td width="10%" height="25" align="center"><%=sData[1]%></td>
				<td width="10%" height="25" align="center"><%=sData[2]%></td>
				<td width="10%" height="25" align="center"><%=sData[3]%></td>
			</tr>
		<% 
			}
			if(vData.size() != 12) {
				for(int i = vData.size(); i < 12; i ++){
					%>
			<tr>
				<td width="10%" height="25" align="center"></td>
				<td width="10%" height="25" align="center"></td>
				<td width="10%" height="25" align="center"></td>
				<td width="10%" height="25" align="center"></td>
				<td width="10%" height="25" align="center"></td>
			</tr>
					<% 
				}
			}
		 %>
		</table>
			<input type="submit" name="sub" value="删除选中老师">
		</form>
			<form action="view_teacher_info.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=Page.getPageCount()%></font>页&nbsp;
			<a href="view_teacher_info.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1){				
			%>
					<a href="view_teacher_info.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[上一页]&nbsp;");
				}
				//判断"下一页"链接是否要显示
				if(showPage < Page.getPageCount()){				
			%>
					<a href="view_teacher_info.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="view_teacher_info.jsp?showPage=<%=Page.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
			转到
			<select name="showPage">
			<%
				for(int x = 1; x <= Page.getPageCount(); x ++){
			%>
					<option value="<%=x%>" <%if(showPage==x) out.println("selected");%> ><%=x%></option>
			<%
				}
			%>
			</select>页&nbsp;
			<input type="submit" name="go" value="提交"/>
		</form>
		
		<%rs.close();%>
		</div>
	</div>
	
	<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
		Copyright © ccnu
	</div>
  </div>
  </body>
</html>
