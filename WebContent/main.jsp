<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=divice-width", initial-scale="1"> <%--반응형 디자인--%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
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
				<li class="active"><a href="main.jsp">메인</a></li>	<%--active 현재 선택된 홈페이지를 의미  한개의 홈페이지에만 들어갈 수 있다--%>
				<li><a href="bbs.jsp">게시판</a></li>		
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
		<div class="jumbotron"> <!-- 사이트 소개 -->
			<div class="container">
				<h1>웹 사이트</h1>
				<p>이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. 최소한의 간단한 로직만을 이용해서
				개발했습니다. 디자인 템플릿으로는 부트스트랩을 이용했습니다.</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p> <!-- junbotron에는 a태그를 이용해서 버튼을 만들면 이쁘다-->
			</div>
		</div>
	</div> 
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"> <!-- carousel = 사진첩 -->
			<ol class="carousel-indicators"><!-- 지시자 -->
				<li data-target="#myCarousel" data-slide-top="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-top="1"></li>
				<li data-target="#myCarousel" data-slide-top="2"></li>
			</ol>
			<div class="carousel-inner"> <!-- 실질적으로 이미지가 들어가는 부분 -->
				<div class="item active">
					<img src="images/사진008.jpg">
				</div>
				<div class="item">
					<img src="images/1463796860484.jpg">
				</div>
				<div class="item">
					<img src="images/1472652293247.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphincon glyphincon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphincon glyphincon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jqery-3.3.7.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>