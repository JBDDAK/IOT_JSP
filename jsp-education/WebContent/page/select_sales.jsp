<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>SELECT</h3>
<table border="1">
  <tr>
    <th>판매 ID</th>
    <th>지점명</th>
    <th>판매 일자</th>
    <th>피자 코드</th>
    <th>판매 수량</th>
    <th>매출액</th>
  </tr>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_18", "1234");
		if (conn != null) {
			System.out.println("Database Connected!");
		}
		else {
			System.out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT "+
				"SALELIST.SALENO, SHOP.SCODE || '-' || SHOP.SNAME, salelist.saledate, PIZZA.PCODE, SALELIST.AMOUNT, PIZZA.COST * SALELIST.AMOUNT AS TOTAL_COST "+ 
			"FROM "+
				"tbl_pizza_01 PIZZA, tbl_salelist_01 SALELIST, tbl_shop_01 SHOP "+ 
			"WHERE "+ 
				"SALELIST.SCODE = SHOP.SCODE "+ 
			"AND "+ 
				"SALELIST.PCODE = PIZZA.PCODE";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getInt(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ rs.getString(3) + "</td>");
				out.print("<td>"+ rs.getString(4) + "</td>");
				out.print("<td>"+ rs.getInt(5) + "</td>");
				out.print("<td>"+ rs.getInt(6) + "</td>");
				out.print("</tr>");
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>