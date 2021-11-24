<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근객체 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=divice-width" initial-scale="1"> <%--반응형 디자인--%>
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
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
			<%
				if(userID==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
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
			<%	
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead> <%--테이블의 제목부분 --%>
					<tr>
						<th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("/n","<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성 일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0,11)+
						bbs.getBbsDate().substring(11,13)+"시"+
						bbs.getBbsDate().substring(14,16)+"분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height:200px;text-align:left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("/n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if(userID !=null &&userID.equals(bbs.getUserID())){//현재 사용자가 작성자와 같다면 ↓
			%>
				<a href="update.jsp?bbsID=<%=bbsID %>"class="btn btn-primary">수정</a>		   <!--이부분 출력 -->
				<a href="deleteAction.jsp?bbsID=<%=bbsID %>"class="btn btn-primary">삭제</a>	
			<% 		
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jqery-3.3.7.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>