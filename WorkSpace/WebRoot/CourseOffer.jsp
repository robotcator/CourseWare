<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Course Info</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />
	<jsp:useBean scope="page" id="Offer" class="cJava.CourseOffer" />
	
  </head>
  
    <body>  
  <div id="container" style="width:100%">
	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">课程转让</h1>
	</div>
	
	<div id="menu" style="background-color:#FFD700;height:300pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="ChangeCourse.html" style="text-decoration:none;text-align:center">首页</a><br><br>
		<a href="Course.jsp" style="text-decoration:none;text-align:center">课程列表</a><br><br>
		<a href="CourseNeed.jsp" style="text-decoration:none;text-align:center">需求列表</a><br><br>
		<a href="CourseOffer.jsp" style="text-decoration:none;text-align:center">转让列表</a><br></br>
	</div>
	<div id="content" style="background-color:#EEEEEE;height:320pt;width:90%;x;float:left;">
		<div align="center">
			<form action="add_score_save.jsp" method="post">
			<table width="90%" border="0" cellpadding="0" cellspacing="1">
			<tr bgcolor="#CC99FF">
				<th width="15%" height="30" align="center">课程编号</th>
				<th width="15%" height="30" align="center">课程名称</th>
				<th width="15%" height="30" align="center">课堂号</th>
				<th width="15%" height="30" align="center">学生学号</th>
				<th width="15%" height="30" align="center">学生姓名</th>
			</tr>	
		<%
			ResultSet rs = Offer.query();
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
				<td width="10%" height="25" align="center"><%=sData[0]%></td>
				<td width="10%" height="25" align="center"><%=sData[1]%></td>
				<td width="10%" height="25" align="center"><%=sData[2]%></td>
				<td width="10%" height="25" align="center"><%=sData[3]%></td>
				<td width="10%" height="25" align="center"><%=sData[4]%></td>
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
	
	<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
		Copyright © ccnu
	</div>
  </div>
  </body>
</html>
