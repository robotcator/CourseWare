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
	<jsp:useBean scope="page" id="Student" class="cJava.Student" />
	<jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />
	<jsp:useBean scope="page" id="Score" class="cJava.SelectCourse" />
	
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
			<table width="90%" border="0" cellpadding="0" cellspacing="1">
			<tr bgcolor="#CC99FF">
				<th width="15%" height="30" align="center">学号</th>
				<th width="15%" height="30" align="center">姓名</th>
				<th width="15%" height="30" align="center">年级</th>
				<th width="15%" height="30" align="center">学院</th>
				<th width="15%" height="30" align="center">成绩</th>
			</tr>	
		<%
			ResultSet rs = Student.showStudent();
			Page.initialize(rs, 12);
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
			<input type="submit" name="sub" value="提交"/>
		</form>
			<form action="add_score_info.jsp" method="post" target="_self">	
			第<font color="#FF0000"><%=showPage%></font>页/共<font color=red><%=Page.getPageCount()%></font>页&nbsp;
			<a href="add_score_info.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1){				
			%>
					<a href="add_score_info.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[上一页]&nbsp;");
				}
				//判断"下一页"链接是否要显示
				if(showPage < Page.getPageCount()){				
			%>
					<a href="add_score_info.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="add_score_info.jsp?showPage=<%=Page.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
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
  </body>
</html>
