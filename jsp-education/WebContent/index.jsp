<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/css.css">
<title>이정훈</title>
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
	switch(section){
	case "insert":
		%><%@include file="page/insert.jsp" %><%
		break;
	case "select":
		%><%@include file="page/select.jsp" %><%
		break;
	case "select_sales":
		%><%@include file="page/select_sales.jsp" %><%
		break;
	case "select_sales_shop":
		%><%@include file="page/select_sales_shop.jsp" %><%
		break;
	case "select_sales_by_pizza":
		%><%@include file="page/select_sales_by_pizza.jsp" %><%
		break;
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>