<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edel Concours</title>
</head>
<body>
<script type="text/javaScript">
 
function frm_check(){    
 
if (!confirm('등록하시겠습니까?')) {
return false;
}
}
</script>
 
<div class="cnt_bbs">
<form:form commandName="EdelVideoVO" name="EdelVideoVO" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/youtube/createAction.do" onsubmit="return frm_check();" >
 
<div class="bbs_write">
<table class="tb_write">
<caption>게시글 등록</caption>
<colgroup>
    <col style="width:25%;">
    <col style="width:75%;">
</colgroup>
<tbody>
    <tr>
        <th scope="row"><label for="mv_title"> 제목 </label></th>
        <td>  
            <input type="text" name="mv_title" id="mv_title" style="width:100%"/>
        </td>
    </tr>
    <tr>
        <th scope="row">유튜브 주소 ID</th>
        <td>  
            <div>
                <span class="line_h35">https://youtu.be/  </span>
                <input type="text" name="mv_the_origin_url" id="mv_the_origin_url" style="width:150px"/>
            </div>  
            <p class="mt_10">*ID를 정확히 입력해야 Player 및 썸네일 이미지가 정상적으로 출력이 됩니다.</p>
            <p>유튜브 주소 ID를 입력하지 않으면 기존에 등록한 썸네일 이미지로 출력이 됩니다.</p>
                
        </td>
    </tr>
</tbody>
</table>
</div>    
 
<div class="mt_20 t_r">
<input type="submit" class="tb_btn blueM"  value="등록" />
<a href="${pageContext.request.contextPath}/youtube/list.do"  class="tb_btn whiteM">목록</a>
</div>
</form:form>
</div>
 
 
 
</body>
</html>