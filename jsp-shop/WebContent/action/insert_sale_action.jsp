<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
String pro_name = request.getParameter("pro_name");
int count = Integer.parseInt(request.getParameter("count"));
String date = request.getParameter("date");
int pro_id = 0;
int pro_price = 0;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost/xe", "system", "1234");

	Statement stmt1 = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	Statement stmt3 = conn.createStatement();
	ResultSet pro_id_rs = stmt1.executeQuery("SELECT product.product_id FROM PRODUCT "+
			"WHERE product.name = '"+pro_name+"' "+
			"GROUP BY product.product_id");
	
	ResultSet pro_price_rs = stmt2.executeQuery("SELECT product.price FROM PRODUCT "+
			"WHERE product.name = '"+pro_name+"' "+
			"GROUP BY product.price");

	if(pro_id_rs.next()){
		pro_id = pro_id_rs.getInt(1);
	}
	if(pro_price_rs.next()){
		pro_price = pro_price_rs.getInt(1);
	}
	
	String query = "INSERT INTO SALE(SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) VALUES(sale_SEQ.NEXTVAL, %d, '%s', %d, %d)";
	
	ResultSet rs = stmt3.executeQuery(String.format(query, pro_id, date, pro_price*count, count));
	
	conn.commit();
	
	stmt1.close();
	stmt2.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp?section=insert_sale");
%>