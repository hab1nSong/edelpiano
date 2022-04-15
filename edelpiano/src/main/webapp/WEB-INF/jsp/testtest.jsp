<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edel Vlog List</title>
<style>
	a {
		text-decoration: none;
		color:#333;
	}
	
	#write_btn {
		margin-top:20px;
		text-align:center;
	}
	
	.header {
		padding-top: 30px;
		text-align: center;
		background: none;
	}

	.header h1 a{
		font-size: 50px;
		font-family: serif;
		text-align: center;
	}
	
	body{
	background: url('../Edel/map1.jpg') no-repeat center center fixed; 
	-o-background-size:cover;
	background-size:cover;	
	}	
	
	
/* 디자인 CSS 바깥 부분 */
.wrap {
    width:100%;
    height:100%;
    font-size:14px;
         margin-left: auto;
      margin-right: auto;
}
.item {
    width:25%;
}

div { display:inline-block; 
}




	
</style>
</head>
<body>

	
         <div class="wrap">
         	<div class="header">
		<h1><a href="/edel/main">VLOG</a></h1>
	</div>
            <div class="item">
                <div class="inner">
                 <c:forEach var="video" items="${list}">
                    <div class="frame">
                        <a href="#none" class="link">
                           <iframe width="280" height="170" frameborder="0"
								src="https://www.youtube.com/${video.mv_the_origin_url}"></iframe>
                        </a>
                        <p class="description">
                            <a href="#none" title="">
                            					<span style="font-weight: bold;"><c:out value="${video.video_num}" /></span>.
					<span style="font-weight: bold;"><c:out value="${video.video_name}" /></span>
					<div><fmt:formatDate pattern="yyyy-MM-dd" value="${video.date}"></fmt:formatDate></div>
                            </a>        
                        </p>
                        <hr>
                    </div>
                    	</c:forEach>
                </div>
            </div>
</div>
</body>
</html>