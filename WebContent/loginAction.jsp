<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <%--클래스 가져오기 --%>
<%@ page import="java.io.PrintWriter" %><%--js작성을 위함 --%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= EUC-KR">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		UserDAO userDAO=new UserDAO();
		int result=userDAO.login(user.getUserID(), user.getUserPassword());
		if(result==1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else if(result==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}else if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('ID가 존재하지 않습니다')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		else if(result==-2){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('데이터 베이스 오류가 발생했습니다')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		
	%>
</body>
</html>