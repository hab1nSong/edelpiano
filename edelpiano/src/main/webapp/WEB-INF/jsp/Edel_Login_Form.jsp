<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="utf-8">
<title>Edel Login page</title>
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
	padding: 80px 40px;
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
 	margin-top: 60px;
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
	function login(){
		var id = $('#id').val();
		var pwd = $('#pwd').val();
		if(id=='' || pwd==''){
			alert('아이디 또는 비밀번호가 올바르지 않습니다');
			return false;
		}
		var serData = $('#login_form').serialize();
		$.ajax({
			url:'/edel/login',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.ok ? 'Welcome to Edel':'아이디 또는 비밀번호가 일치하지 않습니다');
				location.href='/edel/main';
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
      <form id="login_form" class="login-form" onsubmit="return login();">
        <h1>Login</h1>

        <div class="txtb">
          <input type="text" id="id" name="id" placeholder="Username">
          
        </div>

        <div class="txtb">
          <input type="password" id="pwd" name="pwd" placeholder="Password">
         
        </div>

        <input type="submit" class="logbtn" value="Login">

        <div class="bottom-text">
          Don't have account? <a href="/edel/signup">Sign up</a>
          <div><a class="main" href="/edel/main">홈페이지로 가기</a></div>
        </div>
        </form>
</body>
</html>

 