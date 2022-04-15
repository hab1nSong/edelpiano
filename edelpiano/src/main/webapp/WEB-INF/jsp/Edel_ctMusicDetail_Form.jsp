<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edel Music Detail</title>
<script>
	function del(num){
		var reqURL = '/edelmusic/delete/'+num;
		if(!confirm('정말로 삭제하시겠습니까?')){
			return;
		}
		location.href=reqURL;
	};		
</script>
<style>
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

	a {
		text-decoration: none;
		color:#333;
	}
	
	
	body{
	background: url('../../Edel/abab.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
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
	
	.button{
		padding-bottom: 20px;
	}
</style>
</head>
<body>
<div class="header">
<h1>EDEL</h1>
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
	
		<table  style="padding-top:20px" align = center width=703 border=0 cellpadding=2 >
			<tr>
				<td height=20 align=center bgcolor=#c0c0c0>
					<font color=white>${video.video_name}</font>
				</td>
			</tr>
		</table>
	<center> 
	<div class="video">
		<iframe width="700" height="450" frameborder="0"
			src="https://www.youtube.com/${video.mv_the_origin_url}"></iframe>
	</div>
	</center>
			<table  style="padding-top:0px" align = center width=700 border=0 cellpadding=2 >
			<tr>
				<td class="button" height=20 align=right>
					<a href="/edelmusic/list"><button type="button">목록</button></a> 
					<a href="javascript:del(${video.video_num})"><button type="button">삭제</button></a>
				</td>
			</tr>
		</table>
		
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