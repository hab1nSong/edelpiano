<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<title>Edel Notice Detail</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function bdUpdate(){
		var title = $('#title').val();
		var content = $('#content').val();
		var name = $('#name').val();
		var num = $('#num').val();
		var pwd = $('#pwd').val();
		if(title=='' || content=='' || name=='' || pwd==''){
			alert('모든 항목을 작성해주세요');
			return false;
		}
		if(!confirm('정말로 수정하시겠습니까?')) return false;
		var serData = $('#update_form').serialize();
		console.log(serData);
		$.ajax({
			url:'/edelboard/bdupdate',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.updated? '수정 성공':'수정 실패');
				location.href="/edelboard/list";
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
	};
	
	function del(num){
		var reqURL = '/edelboard/delete/'+num;
		if(!confirm('정말로 삭제하시겠습니까?')){
			return;
		}
		location.href=reqURL;
	};	
</script>	
<style>
	a {
		text-decoration: none;
		color:#333;
	}
	
	table.table2 {
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid black;
		margin: 20px 10px;
	}

	table.table2 tr {
		width: 50px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid black;
	}

	table.table2 td {
		width: 100px;
		padding: 4px;
		vertical-align: top;
		border-bottom: 1px solid black;
	}
	
	.header {
		padding-top: 10px;
		text-align: center;
		background: none;
	}

	.header h1 a{
		font-size: 50px;
		font-family: serif;
	}
	
	body{
	background: url('../../Edel/map11.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
	}	
	
	.text{font-size:20px; resize:none; border: 1px solid #c0c0c0; text-align:center;}
	.text:focus{ outline:none;}
	.admin{font-weight:bold}
	.input{ background:none; border-top:none; border-left:none; border-right:none; text-align:center;}
	.font input{color:white;}
</style>
</head>
<body>
	<div class="header">
		<h1><a href="/edel/main">EDEL</a></h1>
	</div>
	<form id="update_form" onsubmit="return bdUpdate();">
	<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="admin" height=20 align=right ><input type="text" id="name" name="name" size="10" value="${detail.name}"></td>
			</tr>
			<tr>
				<td height=20 align=center bgcolor=#c0c0c0>
					<font class="font"><input class="input" type="text" id="title" name="title" size="60" value="${detail.title}"></font>
				</td>
			</tr>
	</table>		
	<div>
		<center>
		<hr color="#c0c0c0" width="46%">
		<textarea class="text" id="content" name="content" cols="67" rows="10">${detail.content}</textarea>
		<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="admin" height=20 align=right >암호 : <input type="text" id="pwd" name="pwd" size=10 value="${detail.pwd}"></td>
			</tr>
		</table>	
		<hr color="#c0c0c0" width="46%">
		</center>
	</div>	
	
		<div>
			<center>
			<button type="submit"><a href="/edelboard/detail/${detail.num}">이전</a></button>
			<button type="button"><a href="javascript:del(${detail.num})">삭제</a></button>
			<button type="button" onclick="bdUpdate();">수정</button>
			</center>
		</div>
		<input type="hidden" id="num" name="num" value="${detail.num}">
		</form>
</body>
</html>