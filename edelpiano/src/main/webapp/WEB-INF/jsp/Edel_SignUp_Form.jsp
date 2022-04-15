<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<title>Edel SignUp page</title>
<style>
	*{
	margin: 0;
 	padding: 0;
  	text-decoration: none;
  	font-family: montserrat;
  	box-sizing: border-box;
	}
	
	.login-form{
 	width: 360px;
 	background: #f1f1f1;
 	height: 580px;
	padding: 50px 40px;
 	border-radius: 10px;
 	position: absolute;
 	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	opacity: 0.9;
	}
	
	.login-form h1{
 	text-align: center;
 	margin-bottom: 60px;
	}
	
	.txtb{
  	border-bottom: 2px solid #adadad;
  	position: relative;
 	margin: 30px 0;
	}
	
	.txtb input{
 	font-size: 15px;
	color: #333;
	border: none;
	width: 100%;
	outline: none;
	background: none;
	padding: 0 5px;
	height: 40px;
	}
	
	.txtb span::before{
	content: attr(data-placeholder);
 	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	z-index: -1;
	transition: .5s;
	}
	
	.txtb span::after{
	content: '';
	position: absolute;
	width: 0%;
	height: 2px;
	background: linear-gradient(120deg,#f0b501,#8e44ad);
	transition: .5s;
	}
	
	.focus + span::before{
    top: -5px;
	}
	
	.focus + span::after{
 	width: 100%;
	}
	
	.logbtn{
	display: block;
 	width: 100%;
	height: 50px;
	border: none;
	background: linear-gradient(120deg,#f0b501,#8e44ad,#f0b501);
	background-size: 200%;
	color: #fff;
	outline: none;
	cursor: pointer;
	transition: .5s;
	}
	
	.logbtn:hover{
 	background-position: right;
	}
	
	.bottom-text{
 	margin-top: 35px;
 	text-align: center;
 	font-size: 13px;
	}
	
	body{
	background: url('../Edel/log3.jpg') no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;	
	}	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
function add(){
	var id = $('#id').val();
	var pwd = $('#pwd').val();
	var phone = $('#phone').val();
	var email = $('#email').val();
	if(id=='' || pwd=='' || phone=='' || email==''){
		alert('필수항목을 입력주세요');
		return false;
	}
	var serData = $('#add_form').serialize();
	$.ajax({
		url:'/edel/signup',
		method:'post',
		cache:false,
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.ok ? '회원가입이 되었습니다':'회원정보를 다시 확인해주세요');
			location.href='/edel/login';
		},
		error:function(xhr,status,err){
			alert('에러:'+err);
		}
	});
	return false;
}
</script>	
</head>
<body>
      <form id="add_form" class="login-form" onsubmit="return add();">
        <h1>SignUp</h1>

        <div class="txtb">
        	<input type="text" id="id" name="id" placeholder="Username">
        </div>

        <div class="txtb">
        	<input type="password" id="pwd" name="pwd" placeholder="Password">
        </div>
        
        <div class="txtb">
        	<input type="text" id="phone" name="phone" placeholder="PhoneNum">
        </div>
        
        <div class="txtb">
        	<input type="text" id="email" name="email" placeholder="Email">
        </div>

        <input type="submit" class="logbtn" value="SignUp">

        <div class="bottom-text">
          <a href="/edel/main">Edel Piano</a>
        </div>
        </form>
</body>
</html>

 