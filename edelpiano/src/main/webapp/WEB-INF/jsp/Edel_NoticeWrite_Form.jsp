<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<title>Edel piano Notice</title>
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

	a {
		text-decoration: none;
		color:#333;
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
	
	body{
	background: url('../Edel/abab.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
	}	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function noWrite(){
		var title = $('#title').val();
		var name = $('#name').val();
		var content = $('#content').val();
		var nj_url = $('#nj_url').val();
		if(title=='' || name=='' || content==''){
			alert('모든 항목을 작성해주세요');
			return false;
		}
		var serData = $('#NoWrite_form').serialize();
		$.ajax({
			url:'/notice/noWrite',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.ok? '저장' : '실패');
				location.href='/notice/list';
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
            <li><a href="map">오시는길</a></li>
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

<form id="NoWrite_form" onsubmit="return noWrite();">
	<table  style="padding-top:50px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td align=center bgcolor=#c0c0c0>
					<font color=white>공지사항</font>
				</td>
			</tr>
				<td>
					<table class="table2">
						<tr>
							<td>제목</td>
							<td><input type="text" id="title" name="title" size="78" ></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" id="name" name="name" size="10" ></td>
						</tr>	
						<tr>
							<td>내용</td>
							<td><textarea onkeyup="adjustHeight();" id="content" name="content" cols="80" rows="15"></textarea></td>
						</tr>	
						<tr>
							<td>이미지</td>
							<td>
								<input type="text" name="nj_url" id="nj_url" style="width:150px">
								<p>*파일형식을 정확히 입력해주세요.(.jpg)</p>
							</td>
						</tr>
					</table>
				</td>
	</table>	
						<center>
						<div style="padding-bottom:50px;"><button type="submit">저장</button></div>
						</center>			
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
</html>