<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%String section = request.getParameter("section") != null ? request.getParameter("section") : ""; %>
<body>
<a href="?section=A">a</a>
<a href="?section=B">b</a>
<a href="?section=C">c</a>
<%
switch (section){
case "A":
	%><%@include file="pages/A.jsp" %><%
	break;
case "B":
	%><%@include file="pages/B.jsp" %><%
	break;
case "C":
	%><%@include file="pages/C.jsp" %><%
	break;
default:
	break;
}
%>

<table border="1">
<% 
int[] array = {1,2,3,11,12,13,21,22,23,31,32,33, 41,42, 43};
int pos = 0;
for(int i = 0; i < 5; i++){
	out.print("<tr>");
	for(int j = 0; j < 3; j++){
		out.print("<td>"+ array[pos++] +"</td>");
	}
	out.print("</tr>");
}
%>
</table>

</body>
< /html>