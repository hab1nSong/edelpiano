<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<title>Edel 장바구니</title>
<style>
	* {
		margin: 0 auto;
		padding: 0;
		font-family: 'Malgun gothic','Sans-Serif','Arial';
	}
	
	a {
		text-decoration: none;
		color:#333;
	}
	
	ul li {
		list-style:none;
	}
	
	/* 공통 */
	.fl {
		float:left;
	}
	
	.tc {
		text-align:center;
	}
	
	/* 게시판 목록 */
	#board_area {
		width: 900px;
		position: relative;
	}
	
	.list-table {
		margin-top: 50px;
	}
	
	.list-table thead th{
		height:40px;
		border-top:2px solid black;
		border-bottom:1px solid black;
		font-weight: bold;
		font-size: 17px;
	}
	
	.list-table tbody td{
		text-align:center;
		padding:10px 0;
		border-bottom:1px solid black; height:20px;
		font-size: 14px 
	}
	
	#write_btn {
		margin-top:20px;
		text-align:center;
	}
	
	.header {
		padding: 0px;
		text-align: center;
		background: none;
	}

	.header h1 a{
		font-size: 50px;
		font-family: serif;
	}
	
	body{
	background: url('../Edel/map1.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
	}	
</style>
<script>
	function cart(){
		if(!confirm('장바구니에 담으시겠습니까?')) return;
		var serData = $('#cart_form').serialize();
		$.ajax({
			url:'/order/cart',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.ok? '담기':'실패');
			},
			error:function(xhr,status,err){
				alert(err);
			}
		});
	}
</script>
</head>
<body>
	<div class="header">
		<h1><a href="/edel/main">EDEL CART</a></h1>
	</div>
		<table class="list-table">
		<thead>
			<tr>
				<th width="70">번호</th>
				<th width="500">악보명</th>
				<th width="100">가격</th>
			</tr>
		</thead>
	<tbody>
		<c:forEach var="order" items="${list}">
		<tr>
			<td width="70"> <c:out value="${order.num}" /></td>
			<td width="500"> <a href="/order/detail/${order.num}"><c:out value="${order.name}" /></a></td>
			<td width="100"> <c:out value="${order.price}" /></td>
		</tr>	
		</c:forEach>
	</tbody>	
	</table>
	
</body>
</html>