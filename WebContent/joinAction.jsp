<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <%--Ŭ���� �������� --%>
<%@ page import="java.io.PrintWriter" %> <%--�ڹ� ��ũ��Ʈ�ۼ��� ���� --%>
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
<title>JSP�Խ��� �� ����Ʈ</title>
</head>
<body>
	<%
		if(user.getUserID()==null||user.getUserPassword()==null||user.getUserName()==null
		||user.getUserGender()==null||user.getUserEmail()==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back()"); //���� �������� �̵�
			script.println("</script>");
		}
		else{
			UserDAO userDAO=new UserDAO();
			int result=userDAO.join(user);
			if(result==-1){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('ID�� �����մϴ�.')");
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
