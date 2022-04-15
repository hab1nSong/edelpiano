<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<title>Edel Piano</title>
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
	
	body{
		background: url('../Edel/abab.jpg') no-repeat center center fixed; 
		-o-background-size:cover;
		background-size:cover;	
	}	
	
	html, body {margin: 0; padding: 0;} 
	
	.body{
		width: 61%;
		padding-left: 19.5%;
		padding-right: 19%;
		padding-top: 20px;
		padding-bottom: 100px;
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
	

	.grid{
		display: inline-block;
		padding-bottom: 20px;
	}
	
	.contents_h2{
		text-decoration: underline;
		padding-top: 30px;
	}
	
	.contents_h1{
		text-decoration: underline;
	}
	
	.body_font{
		font-size: 13px;
		font-weight: bold;
	}
	
	
	.list-table tbody td{
		text-align: center;
		font-weight: bold;
		font-size: 13px;
	}
	
		a {
		text-decoration: none;
		color:#333;
	}
</style>
</head>
<body>
<div class="header">
<h1><a href="#">EDEL</a></h1>
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


<div class="body">
<h2 class="contents_h1">notice</h2>
    <table class="list-table">
      <thead>
          <tr>
              <th width="70">번호<hr></th>
                <th width="500">제목<hr></th>
                <th width="120">작성자<hr></th>
                <th width="100">작성일<hr></th>
                <th width="100">조회수<hr></th>
            </tr>
        </thead>
      <tbody>
      	<c:forEach var="n" items="${notice}">
        <tr>
          <td width="70"> <c:out value="${n.num}" /><hr> </td>
          <td width="500"> <a href="/notice/detail/${n.num}"><c:out value="${n.title}" /></a><hr> </td>
          <td width="120"> <c:out value="${n.name}" /><hr> </td>
          <td width="100"> 
          	<fmt:formatDate pattern="yyyy-MM-dd" value="${n.date}"></fmt:formatDate> <hr>
          </td>
          <td width="100"> <c:out value="${n.hit}" /><hr> </td>
        </tr>
      </c:forEach> 
      </tbody>
    </table>
	
	
	


<h2 class="contents_h2">contents</h2>
	<c:forEach var="video" items="${list}">
		<div class="grid">
			<iframe width="200" height="150" frameborder="0"
					src="https://www.youtube.com/${video.mv_the_origin_url}"></iframe>
					<a href="/video/vlogdetail/${video.video_num}">
						<div class="body_font"><c:out value="${video.video_num}" />.<c:out value="${video.video_name}" /> <hr style="border: inset 1px white;"></div>
					</a>
		</div>	
	</c:forEach>	

<h2 class="contents_h2">악보자료실</h2>
	<c:forEach var="order" items="${order}">
		<div class="grid">
			<img width="200" height="150" frameborder="0"
					src="../Edel/${order.thumbnail}">
					<a href="/order/detail/${order.num}">
						<div class="body_font"><c:out value="${order.num}" />.<c:out value="${order.name}" /> <hr style="border: inset 1px white;"></div>
					</a>
		</div>	
	</c:forEach>	
</div>

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
</html>