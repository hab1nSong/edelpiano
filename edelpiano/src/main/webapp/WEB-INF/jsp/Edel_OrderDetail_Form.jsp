<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="utf-8">
<title>Edel Order Detail</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
function EdelinCart(){
	if(!confirm('장바구니에 담으시겠습니까?')) return;
	var serData = $('#order_form').serialize();
	$.ajax({
		url:'/order/cart',
		cache:false,
		method:'post',
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.incart ? '장바구니 저장 성공':'실패');
			location.href='/order/cart';
		},
		error:function(xhr,status,err){
			alert(err);
		}
	});
}
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
	
	.user a{color: blue;}
	
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
</style>
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


	<form id="order_form" onsubmit="return EdelinCart();">
	<table  style="padding-top:30px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="admin" height=20 align=right >관리자</td>
			</tr>
			<tr>
				<td height=20 align=center bgcolor=#c0c0c0>
					<font color=white>${order.name}</font>
				</td>
			</tr>
			<tr>
				<td>
					<hr color="#c0c0c0">
				</td>
			</tr>
	</table>		
	<div>
		<center>
		<textarea id="target-textarea" cols="56"  readonly>${order.detail}</textarea>
		<div style="padding-top: 30px;"><img src="../../Edel/${order.thumbnail}" onError="this.style.visibility='hidden'" width="500" height="400"></div>
		</center>
	</div>	
	
	<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
		<tr>
			<td>
				<hr color="#c0c0c0">
			</td>
		</tr>
		</table>
		
	<table style="padding-top:0px" align = center width=700 border=0 cellpadding=2 ">
		<tr>
			<td height=20 align=left>
				<a class="reply" href="javascript:doDisplay();">첨부파일</a>
			
			<div id="!reply" style="disply: none">
				<div class="user">
					<a href="/order/file/${order.file}">${order.file}</a>
				</div>
			</div>	
			</td>
		</tr>
	</table>
		
	<table style="padding-top:0px; align: center; width: 700; border: 0; cellpadding: 2; ">
		<tr>
			<td>
				<hr color="#c0c0c0">
			</td>
		</tr>
	</table>
	
		<div style="padding-bottom:50px;">
			<center>
			<button><a href="/order/list">목록</a></button>
			<button type="button"><a href="/order/update/${order.num}">수정</a></button>
			<button type="button" onclick="EdelinCart();">담기</button>
			</center>
		</div>
	</form>	
	
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
<script>
    function resize() {
        let textarea = document.getElementById("target-textarea");
 
        textarea.style.height = "0px";
 
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
 
        textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
    }
    
    window.addEventListener("load", resize);
    window.onresize = resize;
</script>


<script type="text/javascript">
var bDisplay = true;
function doDisplay(){
	var con = document.getElementById("!reply");
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
};
</script>
</html>