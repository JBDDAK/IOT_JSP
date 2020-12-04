<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String scode = request.getParameter("scode");
String sname = request.getParameter("sname");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_18", "1234");

	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO TBL_SHOP_01(SCODE, SNAME) VALUES('%s', '%s')";
	
	//out.print(String.format(query, sale_code, scode, sale_date, pcode, sale_amount));
	ResultSet rs = stmt.executeQuery(String.format(query, scode, sname));
	
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp");
%>