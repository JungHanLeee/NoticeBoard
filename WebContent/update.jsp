<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=divice-width", initial-scale="1"> <%--반응형 디자인--%>
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert(로그인을 하세요.)");
		script.println("location.href='login.jsp'");
		script.println("</script>");		
	}
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){//bbsID라는 매개변수가 존재한다면
		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert(유효하지 않은 글 입니다.)");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs=new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert(권한이 없습니다.)");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");	
	}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>	<%--active 현재 선택된 홈페이지를 의미  한개의 홈페이지에만 들어갈 수 있다--%>
				<li class="active"><a href="bbs.jsp">게시판</a></li>		
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li> 
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
						<%--table-striped 글 목록들이 홀수와 짝수가 번갈아 가면서 색이 변하게 해준다--%>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead> <%--테이블의 제목부분 --%>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글 수정 양식</th>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목 " name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbs.getBbsContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull pull-right" value="글 수정">
		</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jqery-3.3.7.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>