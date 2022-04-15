<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BOOK DETAIL PAGE</title>
<style>
	.header{display:inline-block; width:100px; text-align:right; padding:0.5em; font-weight:bolder; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function inCart(){
		if($('#qty').val()<1){
			alert('수량은 필수 항목입니다');
			return false;
		}
		var serData = $('#order_form').serialize();
		$.ajax({
			url:'/shop/book/tocart',
			cache:false,
			method:'post',
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.incart ? '장바구니 저장 성공':'실패');
				location.href='/shop/book/showcart';
			},
			error:function(xhr,status,err){
				alert(err);
			}
		});
	}
</script>	

</head>
<body>
<h3>BOOK DETAIL PAGE</h3>
	<div>번호 : "${book.no}"</div>
	<div>제목 : "${book.title}"</div>
	<div>출판사 : "${book.pub}"</div>
	<div>가격 : "${book.price}"</div>
	<div>출판일 : "${book.pubdate}"</div>
	<div>내용 : "${book.describe}"</div>
	<hr>
	<form id="order_form" onsubmit="return inCart()">
		<input type="hidden" name="no" value="${book.no}">
		<input type="hidden" name="title" value="${book.title}">
		<input type="hidden" name="pub" value="${book.pub}">
		<input type="hidden" name="price" value="${book.price}">
		<input type="hidden" name="pubdate" value="${book.pubdate}">		
	<div>
	수량<input type="number" min="1" max="100" name="qty" value="1" id="qty" >
	<button type="button" onclick="inCart();">장바구니에담기</button>
	</div>
	</form>
</body>
</html>