<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문 정보 리스트</title>
<style>
	table{border:1px solid black; padding:0.5em; 
		border-spacing: 0; border-collapse: collapse;
	}
	th {border:1px solid black; background-color: #eee;}
	td {border:1px solid black;}
	td{padding:0.2em 0.5em; text-align:center;}
</style>
</head>
<body>
<h3>주문 정보 리스트</h3>
<table>
<tr><th>번호</th><th>이용자</th><th>품목번호</th><th>결제금액</th><th>구입날짜</th><th>상세보기</th></tr>
<c:forEach var="order" items="${list}">
	<tr>
		<td>${order.num}</td>
		<td>${order.uid}</td>
		<td>${order.no}</td>
		<td>${order.price}</td>
		<td>${order.date}</td>
		<td><a href="/shop/order/detail/${order.num}">상세보기</a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>