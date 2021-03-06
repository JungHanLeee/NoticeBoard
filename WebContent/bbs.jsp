<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %> <!-- 게시판 목록을 출력하기 위해 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=divice-width" ,initial-scale="1"> <!--반응형 디자인-->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	int pageNumber=1;
	if(request.getParameter("pageNumebr")!=null){ //파라미터로 pageNumber가 넘어왔다면 pageNumber에 해당 파라미터의 값을 넣어준다
		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));//파라미터를 정수형으로 바꿔준다 
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
					<%--table-striped 글 목록들이 홀수와 짝수가 번갈아 가면서 색이 변하게 해준다--%>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead> <%--테이블의 제목부분 --%>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">제목</th>
						<th style="background-color:#eeeeee; text-align:center;">작성자</th>
						<th style="background-color:#eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO =new BbsDAO();
						ArrayList<Bbs> list=bbsDAO.getList(pageNumber);
						for(int i=0;i<list.size();i++){
					%>	
					<tr>
						<td><%=list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
						<%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll("/n","<br>") %></a></td> <!-- view.jsp로 해당 게시글 번호를 매개변수로 보냄 -->
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getBbsDate().substring(0,11)+
						list.get(i).getBbsDate().substring(11,13)+"시"+
						list.get(i).getBbsDate().substring(14,16)+"분" %></td>
					</tr>
					<% 		
						}
					%>
					
				</tbody>
			</table>
			<%
				if(pageNumber!=1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>"class="btn btn-success btn-arrow-left">이전</a>
			<%		 
				}if(bbsDAO.nextPage(pageNumber+1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>"class="btn btn-success btn-arrow-left">다음</a>	
			<%	
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jqery-3.3.7.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>