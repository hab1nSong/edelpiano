<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function insert(){
		var pwd = $('#pwd').val();
		if(pwd==''){
			alert('암호를 입력해주세요');
			return false;
		}
		var serData = $('#insert_form').serialize();
		$.ajax({
			url:'/edelboard/insertpwd',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.ok? '암호확인' : '암호가 올바르지 않습니다');
				//location.href='/edelboard/detail/{num}';
			},
			error:function(xhr,status,err){
				alert('에러'+err)
			}
		});
		return false;
	}
</script>
</head>
<body>
이 글은 비밀글 입니다
비밀번호를 입력해주세요
관리자는 확인만 누르면 됩니다
<form id="insert_form" onsubmit="return insert();">
<div>
	<input type="password" id="pwd" name="pwd">
	<button type="button" onclick="insert();">ok</button>
</div>
</form>
<a href="/edelboard/list">list</a>
</body>
</html>