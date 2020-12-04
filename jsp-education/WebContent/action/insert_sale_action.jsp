<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String pro_name = request.getParameter("pro_name");
int count = Integer.parseInt(request.getParameter("count"));
String date = request.getParameter("date");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_18", "1234");

	Statement stmt = conn.createStatement();
	//int stmt.executeQuery("SELECT price name FROM ")
	
	String query = "INSERT INTO SALE(SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) VALUES(sale_SEQ.NEXTVAL, '%s', '%s', s %d)";
	//out.print(String.format(query, pizza_code, pizza_name, cost));
	ResultSet rs = stmt.executeQuery(String.format(query, pro_name, date, count));
	
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

//response.sendRedirect("../index.jsp");
%>