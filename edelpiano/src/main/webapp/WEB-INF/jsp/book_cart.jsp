<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니 보기</title>
<style>
	table{border:1px solid black; padding:0.5em; 
		border-spacing: 0; border-collapse: collapse;
	}
	th {border:1px solid black; background-color: #eee;}
	th:nth-child(2){width:20em;}
	td {border:1px solid black;}
	td{padding:0.2em 0.5em; text-align:center;}
	tr#footer>td { border-top:3px double black; 
		font-weight:bolder; background-color:#eee;
	}
	tr#footer>td:nth-child(1){ text-align:right;}
	tr#footer>td:nth-child(2){ text-align:left;}
	input#qty { width:3em;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function update_qty(no){
		var newQty = $('#'+no).val();
		var obj = {};
		obj.no = no;
		obj.qty = newQty;
		alert(obj.no);
		if(!confirm('수량을 변경하시겠어요?')){
			return;
		}
		$.ajax({
			url:'/shop/book/updateqty',
			method:'post',
			cache:false,
			data:obj,
			dataType:'json',
			success:function(res){
				alert(res.updated ? '수량변경 성공':'실패');
				$('#tdTotal').text(res.total+'원');
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	};
	
	function del(no){
		var reqURL = '/shop/book/del/'+no;
		if(!confirm('정말로 삭제하시겠습니까?')){
			return;
		}
		location.href=reqURL;
	};
	
	function delCart(){
		var reqURL = '/shop/book/delCart';
		if(!confirm("장바구니를 비우시겠습니까?")){
			return;
		}
		location.href=reqURL;
	};
	
	function order(){
		if(!confirm('장바구니 상품들을 결제하시겠어요?')){
			return;
		}
		$.ajax({
			url:'/shop/book/order',
			cache:false,
			dataType:'json',
			success:function(res){
				alert(res.ok ? '결제 성공':'결제 실패');
				location.href='/shop/book/1';
			},
			error:function(xhr,status,err){
				alert(err);
			}
		});
	}
</script>
</head>
<body>
<h3>장바구니 내용 보기</h3>
<table>
<tr><th>품목번호</th><th>제 목</th><th>가 격</th><th>출판사</th><th>수량</th><th>삭제</th></tr>
<c:forEach var="item" items="${list}">
	<tr><td>${item.no}</td>
		<td>${item.title}</td>
		<td>${item.price}</td>
		<td>${item.pub}</td>
		<td>
			<input type="number" id="${item.no}" value="${item.qty}" min="0">
			<button type="button" onclick="update_qty(${item.no});">변경</button>
		</td>
		<td><button type="button" onclick="del(${item.no});">삭제</button>
	</tr>
</c:forEach>
<fmt:formatNumber type="number" maxFractionDigits="3" 
					value="${total}" var="sum" />
	<tr id="footer"><td colspan="4">총 계<td id="tdTotal" colspan="2">${sum}원</td></tr>
</table>
<p>
<a href="/shop/book/1">[계속 쇼핑하기]</a>
<a href="javascript:delCart(${item.no});">[장바구니 비우기]</a>
<a href="javascript:order();">[결제하기]</a>
</body>
</html>