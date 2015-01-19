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
    <title>CourseInfo</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    
    <jsp:useBean scope="page" id="Page" class="cJava.SplitPage" />
	<jsp:useBean scope="page" id="Course" class="cJava.Course" />
 
 <script type="text/javascript">
function checkSubmit(){
    if ( confirm("确认提交表单吗？")){
    	var x = document.getElementsByName("need");
    	var y = document.getElementsByName("offer");
    	
		var issel = false;
		var isdouble = false;
		for(var i = 0 ; i < x.length; i ++) {
			if(x[i].checked){
				issel = true;
			}
		}
		if (!issel) {
			alert("请至少选择一个进行提交！");
			return false;
		}
		for (var i = 0; i < x.length; i ++) {
			if (x[i].checked && y[i].checked) {
				alert("需求和转让不同同时选中！");
				return false;
			}
		}
		return true;
    } else {
        return false;
    }
}
 /*
 	防止空选和同时选择
 */
</script>
   
  
  </head>
  
  <body>  
  <div id="container" style="width:100%">
	<div id="header" style="background-color:#FFA500;">
		<h1 style="text-align:center">换课模块</h1>
	</div>
	<div id="menu" style="background-color:#FFD700;height:320pt;width:10%;float:left;">
		<br></br><br></br><br></br>
		<a href="ChangeCourse.html" style="text-decoration:none;text-align:center">首页</a><br><br>
		<a href="Course.jsp" style="text-decoration:none;text-align:center">课程列表</a><br><br>
		<a href="CourseNeed.jsp" style="text-decoration:none;text-align:center">需求列表</a><br><br>
		<a href="CourseOffer.jsp" style="text-decoration:none;text-align:center">转让列表</a><br></br>
		
	</div>
	<div id="content" style="background-color:#EEEEEE;;width:90%;x;float:left;">
		<div align="center">
			<form action="CourseHandle.jsp" onsubmit="return checkSubmit();" method="post">
			<table width="90%" border="0" cellpadding="0" cellspacing="1">
			<tr bgcolor="#CC99FF">
				<th width="15%" height="30" align="center">课程编号</th>
				<th width="15%" height="30" align="center">课程名称</th>
				<th width="15%" height="30" align="center">课堂号</th>
				<th width="15%" height="30" align="center">需求/转让</th>
			</tr>	
		<%
			ResultSet rs = Course.showCourse();
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
					<input type="text" name="CourseID" style="border:0px;
					background-color:transparent;text-align:center" readonly="true" value="<%=sData[0]%>">
				</td>
				
				<td width="10%" height="25" align="center">
					<input type="text" name="CourseName" style="border:0px;
					background-color:transparent;text-align:center" readonly="true" value="<%=sData[1]%>">
				</td>
				
				<td width="10%" height="25" align="center">
					<input type="text" name="CourseClass" style="border:0px;
					background-color:transparent;text-align:center" readonly="true" value="<%=sData[2]%>">
				</td>
				<td width="10%" height="25" align="center">
					<input id="need" type="checkbox" name="need" value=<%=i %>>  需求
					<input id="offer" type="checkbox" name="offer" value=<%=i %>>  转让
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
			<a href="Course.jsp?showPage=1" target="_self"><font color="#0000FF">[首页]</font></a>&nbsp;			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1){				
			%>
					<a href="Course.jsp?showPage=<%=showPage-1%>" target="_self"><font color="#0000FF">[上一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[上一页]&nbsp;");
				}
				//判断"下一页"链接是否要显示
				if(showPage < Page.getPageCount()){				
			%>
					<a href="Course.jsp?showPage=<%=showPage+1%>" target="_self"><font color="#0000FF">[下一页]</font> </a>&nbsp;
			<%
				}else{
					out.println("[下一页]&nbsp;");
				}
			%> 
			<a href="Course.jsp?showPage=<%=Page.getPageCount()%>" target="_self"><font color="#0000FF">[尾页]</font> </a>&nbsp;
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
