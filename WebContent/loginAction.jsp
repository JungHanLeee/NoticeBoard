<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <%--Ŭ���� �������� --%>
<%@ page import="java.io.PrintWriter" %><%--js�ۼ��� ���� --%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= EUC-KR">
<title>JSP�Խ��� �� ����Ʈ</title>
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
			script.println("alert('��й�ȣ�� Ʋ���ϴ�')");
			script.println("history.back()"); //���� �������� �̵�
			script.println("</script>");
		}else if(result==-1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('ID�� �������� �ʽ��ϴ�')");
			script.println("history.back()"); //���� �������� �̵�
			script.println("</script>");
		}
		else if(result==-2){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('������ ���̽� ������ �߻��߽��ϴ�')");
			script.println("history.back()"); //���� �������� �̵�
			script.println("</script>");
		}
		
	%>
</body>
</html>