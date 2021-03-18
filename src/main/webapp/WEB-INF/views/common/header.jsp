<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main_4989.css">
<link rel="stylesheet" href="resources/css/main_4989_2.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<body>
	<!-- 헤더부분 -->
	<div class="header">
		<div class="header_logo">
			<a class="logo" href="#" onclick="location.href='/sabangpalbang/main'"> 사방 팔방 </a>

		</div>
		<div class="header_menu">
			<a class="header_menu_item" href="#" onclick="location.href='/sabangpalbang/sabang_main'"> 
				사방
			</a> 
			<a class="header_menu_item" href="#" onclick="location.href='/sabangpalbang/palbang_main'">
				팔방
			</a>
		</div>

		<div class="header_search" href="#" onclick="location.href='/sabangpalbang/sabang_search'">
			<input type="text" class="header_search_input input-group mb-3 mt-5 form-control rounded-pill"
				style="background-color: #e9ecef;" placeholder="             내 예산에 맞는 방 찾기">
		</div>


		<div class="header_cart">
			<a href="#" onclick="location.href='/sabangpalbang/shopping_basket'">
				<img src="resources/images/trolley.png" height="30px" />
			</a>
		</div>

		<div class="header_logIn">
			<a class="header_logIn_item" href="#" onclick="location.href='/sabangpalbang/login'">
				 로그인 
				</a> 
			<a class="header_logIn_item" href="#" onclick="location.href='/sabangpalbang/signin'">
				회원가입 
			</a>
		</div>
	</div>
	<hr/>
