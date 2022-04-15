<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edel Notice Detail</title>
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
       padding: 0px;
       text-align: center;
       background: none;
       position: relative;
   }

   .header h1 {
       font-size: 50px;
       font-family: serif;
   }
	
	#wrap{
		min-height: 100%;
		position: relative;
		width: 100%;
	}
	
	.footer {
	    width: 100%;
	    height: 0px; /* footer의 높이 */
	    position: absolute;  
	    bottom: 0;
	    left: 0;
	    text-align: center;
	    color: black;
	    font-weight: bold;
	    font-size: 12px;
	    padding: 15px 0;
	}
	
	ul, ol, li { list-style:none; margin:0; padding:0; text-align:center; font-weight:bold;}
   
    ul.myMenu {}
    ul.myMenu > li { display:inline-block; width:150px; padding:5px 10px; border:10px; text-align:center; position:relative; }
    ul.myMenu > li:hover { background:#fff; }
    ul.myMenu > li ul.submenu { display:none; position:absolute; top:30px; left:0; text-align:center;}
    ul.myMenu > li:hover ul.submenu { display:block; }
    ul.myMenu > li ul.submenu > li { display:inline-block; width:150px; padding:5px 10px; background:white; border-bottom:1px solid #eee; text-align:center; }
    ul.myMenu > li ul.submenu > li:hover { background:#fff; }
    
    ul a {
	  display: block;
	  color: #333;
	  text-decoration: none;
	  text-align: center;
	}
	
	body{
	background: url('../../Edel/abab.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
	}	
	
	
	#target-textarea{
		box-sizing: border-box;
		resize: none;
		border: none;
		font-size: 20px;
		font-family: Georgia;
		background: none;
		font-weight: bold;
		text-align: center;
	}
	
	.text:focus{ outline:none;}
	.admin{font-weight:bold}
	
	.reply{
		text-decoration: underline;
		font-weight: bold;
		font-size: 18px;
	}
	
	.user{
		padding-left: 25px;
		font-weight: bold;
		font-size: 13px;
	}
	
	.reply-button{
		text-align: right;
	}
	
	.contents-font{
		font-weight: normal;
	}
	
	.date{
		font-weight: normal;
		float: right;
	}
	.text{font-size:20px; resize:none; border: 1px solid #c0c0c0; text-align:center;}
	.text:focus{ outline:none;}
	.admin{font-weight:bold}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function replybo(){
		var num = $('#num').val();
		var reply_name = $('#reply_name').val();
		var content = $('#content').val();
		if(reply_name=='' || content==''){
			alert('댓글을 입력해주세요.');
			return false;
		}
		var serData = $('#replybo_form').serialize();
		console.log(serData);
		$.ajax({
			url:'/board/replywrite',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.ok? '저장성공':'오류발생');
				location.href="/edelboard/detail/${detail.num}";
			},
			error:function(xhr,status,err){
				alert('에러'+err);
			}
		});
		return false;
	} 
</script>
</head>
<body>
<!-- header 부분 입니다 -->
<div class="header">
<h1><a href="/edel/main">EDEL</a></h1>
</div>

<hr color="black" width="60%" size="2" align="center" >
 <div id="container">
 
<ul class="myMenu">
    <li class="menu1">
        <a href="#">NEWS</a>
        <ul class="menu1_s submenu">
            <li><a href="/notice/list">공지사항</a></li>
            <li><a href="/edel/map">오시는길</a></li>
        </ul>   
    </li>
    <li class="menu2">
        <a href="#">CONTENTS</a>
        <ul class="menu2_s submenu">
        	<li><a href="/video/vloglist">VLOG</a></li>
            <li><a href="/concours/list">콩쿨영상</a></li>
            <li><a href="/edelmusic/list">작은음악회영상</a></li>
        </ul>   
    </li>
    <li class="menu3">
    	<a href="#" class="is-current">EDEL</a>
    	<ul class="menu3_s submenu">
    		<li><a href="/order/list">악보</a></li>
    	</ul>
    </li>
    <li class="menu4">
    	<a href="/edelboard/list">Q&A</a>
    	<ul class="menu4_s submenu">
    		<li><a href="/edelboard/list">상담/문의</a></li>
    	</ul>
    </li>
    <li class="menu5">
    	<a href="/edel/login">JOIN</a>
    	<ul class="menu5_s submenu">
    		<li><a href="#">내정보</a></li>
    		<li><a href="/order/cart">장바구니</a></li>
    	</ul>
    </li>   
</ul>
<!-- header 여기까지 입니다. -->
	
	
	<table  style="padding-top:30px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="admin" height=20 align=right >${detail.name}</td>
			</tr>
			<tr>
				<td height=20 align=center bgcolor=#c0c0c0>
					<font color=white>${detail.title}</font>
				</td>
			</tr>
	</table>	
		
	<div>
		<center>
		<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
		<tr>
			<td>
				<hr color="#c0c0c0">
			</td>
		</tr>
		</table>
		
		<textarea class="text" cols="67" rows="10" readonly>${detail.content}</textarea>
		<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="admin" height=20 align=right >암호 : <input type="text" size=10 value="${detail.pwd}" readonly></td>
			</tr>
		</table>	
		
		<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td>
					<hr color="#c0c0c0">
				</td>
			</tr>
		</table>
		
		
			<form id="replybo_form" onsubmit="return replybo();">
			
	<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
	
		<tr>
			<td height=20 align=left>
				<a class="reply" href="javascript:doDisplay();">댓글</a>
				
				<div id="!reply" style="display: none">
					<c:forEach var="r" items="${reply}">
					<div class="user">@${r.reply_name}&nbsp;&nbsp;
						<span class="contents-font">${r.content}</span>
						<span class="date">
							<fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${r.date}"></fmt:formatDate>
						</span>
					</div>
				</c:forEach>
				</div>
				
			</td>
		</tr>
	
	</table>	
		
	<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td>
					<hr color="#c0c0c0">
				</td>
			</tr>
	</table>		
		
	<table style="padding-top:0px" align = center width=700 border=0 cellpadding=2>	
		<tr>
			<th>
				<textarea id="content" name="content" cols="90%" rows="5" placeholder="비적절한 말은 사용하지맙시다."></textarea>
			</th>
			<th>
				<input type="hidden" id="num" name="num" value="${detail.num}">
				<input type="hidden" id="reply_name" name="reply_name" value="edel">
				<button class="reply-button">작성</button>
			</th>
		</tr>
	</table>
	</form>
	<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td>
					<hr color="#c0c0c0">
				</td>
			</tr>
	</table>	
		
		</center>
	</div>	
	
		<div style="padding-bottom:30px;">
			<center>
			<button type="submit"><a href="/edelboard/list">목록</a></button>
			<button type="button"><a href="/edelboard/update/${detail.num}">수정</a></button>
			</center>
		</div>
<div id="wrap">
	<div class="footer">
		<hr>
		<div>상호명 이델 피아노</div>
		<div>대표 송하은</div>
		<div>Youtube Edel Piano / instagram edel_piano</div>
		<div>서울 성북구 화랑로 210-6 3층 / tel 02-960-2155</div>
		<div>Copyright2022. 이델 피아노 all rights reserved.</div>
	</div>
</div>		
</body>
<script type="text/javascript">
var bDisplay = true;
function doDisplay(){
	var con = document.getElementById("!reply");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
}
</script>
</html>