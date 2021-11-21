<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <%--클래스 가져오기 --%>
<%@ page import="java.io.PrintWriter" %> <%--자바 스크립트작성을 위함 --%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= EUC-KR">
<title>JSP게시판 웹 사이트</title>
</head>
<body>
	<%
		if(user.getUserID()==null||user.getUserPassword()==null||user.getUserName()==null
		||user.getUserGender()==null||user.getUserEmail()==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //이전 페이지로 이동
			script.println("</script>");
		}
		else{
			UserDAO userDAO=new UserDAO();
			int result=userDAO.join(user);
			if(result==-1){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('ID가 존재합니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>
