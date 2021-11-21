<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= EUC-KR">
<meta name="viewport" content="width=divice-width", initial-scale="1"> <%--������ ������--%>
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP�Խ��� �� ����Ʈ</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP �Խ��� �� ����Ʈ</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">����</a></li>
				<li><a href="bbs.jsp">�Խ���</a></li>		
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">�����ϱ�<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">�α���</a></li> <%--active ���� ���õ� Ȩ�������� �ǹ�  �Ѱ��� Ȩ���������� �� �� �ִ�--%>
						<li><a href="join.jsp">ȸ������</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align:center;">ȸ������ ȭ��</h3>
					<div class="form-group">		
						<input type="text" class="form-control" placeholder="���̵�" name="userID" maxlength="20">		<%--placeholder=����� ��¹��� --%>
					</div>
					<div class="form-group">		
						<input type="password" class="form-control" placeholder="��й�ȣ" name="userPassword" maxlength="20">		
					</div>
					<div class="form-group">		
						<input type="name" class="form-control" placeholder="�̸�" name="userName" maxlength="20">		
					</div>
					<div class="form-group" style="text-align:center;">		
						<div class="btn-group" data-toggle="buttons">
							<lable class="btn vtn-primary active"> <%--active== �⺻ ���� --%>
								<input type="radio" name="userGender" autocomplete="off" value="����" checked>����
							</lable>
							<lable class="btn vtn-primary"> 
								<input type="radio" name="userGender" autocomplete="off" value="����" checked>����
							</lable>
						</div>
					</div>
					<div class="form-group">		
						<input type="email" class="form-control" placeholder="�̸���" name="userEmail" maxlength="50">		
					</div>
					<input type="submit" class="btn vtn-primary form-control" value="ȸ������">
				</form>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jqery-3.3.7.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>