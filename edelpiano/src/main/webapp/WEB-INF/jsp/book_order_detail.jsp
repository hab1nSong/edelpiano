<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문 정보 상세보기 리스트</title>

<style>
	table{border:1px solid black; padding:0.5em; 
		border-spacing: 0; border-collapse: collapse;
	}
	th {border:1px solid black; background-color: #eee;}
	td {border:1px solid black;}
	td{padding:0.2em 0.5em; text-align:center;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function del(num){
		if(!confirm('정말로 삭제하시겠어요?')) return;
		$.ajax({
			url:'/shop/order/del/'+num,
			cache:false,
			dataType:'text',	
			success:function(res){
				location.href="/shop/order/1";
			},
			error:function(xhr,status,err){
				alert(err);
			}			
		});
	}
</script>
</head>
<body>
<h3>주문 정보 상세보기 리스트</h3>
<table>
<tr>
	<th>번호</th>
	<th>이용자</th>
	<th>품목번호</th>
	<th>제목</th>
	<th>결제금액</th>
	<th>출판사</th>
	<th>출판일</th>
	<th>수량</th>
	<th>구입날짜</th>
	<th>삭제</th>
</tr>
	<tr>
		<td>${order.num}</td>
		<td>${order.uid}</td>
		<td>${order.no}</td>
		<td>${order.title}</td>
		<td>${order.price}</td>
		<td>${order.pub}</td>
		<td>${order.pubdate}</td>
		<td>${order.qty}</td>
		<td>${order.date}</td>
		<td><a href="javascript:del(${order.num})">삭제</a></td>
	</tr>
</table>


</body>
</html>