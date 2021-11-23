<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <%--클래스 가져오기 --%>
<%@ page import="java.io.PrintWriter" %><%--js작성을 위함 --%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
	if(userID!=null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("slert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
		UserDAO userDAO=new UserDAO();
		int result=userDAO.login(user.getUserID(), user.getUserPassword());
		if(result==1){
			session.setAttribute("userID", user.getUserID());
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